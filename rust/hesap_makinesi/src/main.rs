use std::collections::HashMap;
use std::io::{self, Write};

#[derive(Debug)]
enum Token {
    Number(f64),
    Operator(char),
    Identifier(String),
    Assign,
    LeftParen,
    RightParen,
}

fn tokenize(expression: &str) -> Result<Vec<Token>, String> {
    let mut tokens = Vec::new();
    let mut chars = expression.chars().peekable();
    
    while let Some(&ch) = chars.peek() {
        match ch {
            '0'..='9' | '.' => {
                let mut num_str = String::new();
                while let Some(&c) = chars.peek() {
                    if c.is_numeric() || c == '.' {
                        num_str.push(c);
                        chars.next();
                    } else {
                        break;
                    }
                }
                tokens.push(Token::Number(num_str.parse::<f64>().map_err(|_| "Invalid number".to_string())?));
            }
            '+' | '-' | '*' | '/' => {
                tokens.push(Token::Operator(ch));
                chars.next();
            }
            '=' => {
                tokens.push(Token::Assign);
                chars.next();
            }
            '(' => {
                tokens.push(Token::LeftParen);
                chars.next();
            }
            ')' => {
                tokens.push(Token::RightParen);
                chars.next();
            }
            'a'..='z' | 'A'..='Z' => {
                let mut ident = String::new();
                while let Some(&c) = chars.peek() {
                    if c.is_alphanumeric() || c == '_' {
                        ident.push(c);
                        chars.next();
                    } else {
                        break;
                    }
                }
                tokens.push(Token::Identifier(ident));
            }
            ' ' => {
                chars.next();
            }
            _ => return Err(format!("Invalid character: {}", ch)),
        }
    }
    
    Ok(tokens)
}

fn evaluate_expression(tokens: &[Token], variables: &mut HashMap<String, f64>) -> Result<f64, String> {
    let mut output = Vec::new();
    let mut operators = Vec::new();
    
    for token in tokens {
        match token {
            Token::Number(n) => output.push(*n),
            Token::Identifier(var) => {
                if let Some(&val) = variables.get(var) {
                    output.push(val);
                } else {
                    return Err(format!("Unknown variable: {}", var));
                }
            }
            Token::Operator(op) => {
                while let Some(&top) = operators.last() {
                    if precedence(top) >= precedence(*op) {
                        let b = output.pop().ok_or("Insufficient operands")?;
                        let a = output.pop().ok_or("Insufficient operands")?;
                        output.push(apply_operator(operators.pop().unwrap(), a, b)?);
                    } else {
                        break;
                    }
                }
                operators.push(*op);
            }
            Token::LeftParen => operators.push('('),
            Token::RightParen => {
                while let Some(&top) = operators.last() {
                    if top == '(' {
                        operators.pop();
                        break;
                    }
                    let b = output.pop().ok_or("Insufficient operands")?;
                    let a = output.pop().ok_or("Insufficient operands")?;
                    output.push(apply_operator(operators.pop().unwrap(), a, b)?);
                }
            }
            _ => {}
        }
    }
    
    while let Some(op) = operators.pop() {
        let b = output.pop().ok_or("Insufficient operands")?;
        let a = output.pop().ok_or("Insufficient operands")?;
        output.push(apply_operator(op, a, b)?);
    }
    
    output.pop().ok_or("Invalid expression".to_string())
}

fn precedence(op: char) -> i32 {
    match op {
        '+' | '-' => 1,
        '*' | '/' => 2,
        _ => 0,
    }
}

fn apply_operator(op: char, a: f64, b: f64) -> Result<f64, String> {
    match op {
        '+' => Ok(a + b),
        '-' => Ok(a - b),
        '*' => Ok(a * b),
        '/' => if b == 0.0 { Err("Division by zero".to_string()) } else { Ok(a / b) },
        _ => Err("Invalid operator".to_string()),
    }
}

fn main() {
    let mut variables: HashMap<String, f64> = HashMap::new();
    loop {
        print!("Enter expression: ");
        io::stdout().flush().unwrap();
        let mut input = String::new();
        io::stdin().read_line(&mut input).unwrap();
        let input = input.trim();
        if input.eq_ignore_ascii_case("exit") {
            break;
        }
        
        match tokenize(input) {
            Ok(tokens) => {
                if tokens.len() >= 3 {
                    if let Token::Identifier(var) = &tokens[0] {
                        if let Token::Assign = tokens[1] {
                            let value = evaluate_expression(&tokens[2..], &mut variables);
                            match value {
                                Ok(val) => {
                                    variables.insert(var.clone(), val);
                                    println!("{} = {}", var, val);
                                }
                                Err(err) => println!("Error: {}", err),
                            }
                            continue;
                        }
                    }
                }
                match evaluate_expression(&tokens, &mut variables) {
                    Ok(result) => println!("= {}", result),
                    Err(err) => println!("Error: {}", err),
                }
            }
            Err(err) => println!("Error: {}", err),
        }
    }
}
