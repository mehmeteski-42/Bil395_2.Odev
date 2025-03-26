pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: 14.2.0" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   GNAT_Version_Address : constant System.Address := GNAT_Version'Address;
   pragma Export (C, GNAT_Version_Address, "__gnat_version_address");

   Ada_Main_Program_Name : constant String := "_ada_calculator" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#2329a7e5#;
   pragma Export (C, u00001, "calculatorB");
   u00002 : constant Version_32 := 16#30305195#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#f6f6171f#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#6a8dc01a#;
   pragma Export (C, u00005, "ada__exceptionsB");
   u00006 : constant Version_32 := 16#9409e295#;
   pragma Export (C, u00006, "ada__exceptionsS");
   u00007 : constant Version_32 := 16#0740df23#;
   pragma Export (C, u00007, "ada__exceptions__last_chance_handlerB");
   u00008 : constant Version_32 := 16#a028f72d#;
   pragma Export (C, u00008, "ada__exceptions__last_chance_handlerS");
   u00009 : constant Version_32 := 16#e4f8b086#;
   pragma Export (C, u00009, "systemS");
   u00010 : constant Version_32 := 16#fd5f5f4c#;
   pragma Export (C, u00010, "system__soft_linksB");
   u00011 : constant Version_32 := 16#b58cff7b#;
   pragma Export (C, u00011, "system__soft_linksS");
   u00012 : constant Version_32 := 16#524f7d04#;
   pragma Export (C, u00012, "system__secondary_stackB");
   u00013 : constant Version_32 := 16#4a33e18a#;
   pragma Export (C, u00013, "system__secondary_stackS");
   u00014 : constant Version_32 := 16#a43efea2#;
   pragma Export (C, u00014, "system__parametersB");
   u00015 : constant Version_32 := 16#d16f4c97#;
   pragma Export (C, u00015, "system__parametersS");
   u00016 : constant Version_32 := 16#2826646e#;
   pragma Export (C, u00016, "system__storage_elementsS");
   u00017 : constant Version_32 := 16#0286ce9f#;
   pragma Export (C, u00017, "system__soft_links__initializeB");
   u00018 : constant Version_32 := 16#2ed17187#;
   pragma Export (C, u00018, "system__soft_links__initializeS");
   u00019 : constant Version_32 := 16#8599b27b#;
   pragma Export (C, u00019, "system__stack_checkingB");
   u00020 : constant Version_32 := 16#23a7a590#;
   pragma Export (C, u00020, "system__stack_checkingS");
   u00021 : constant Version_32 := 16#c71e6c8a#;
   pragma Export (C, u00021, "system__exception_tableB");
   u00022 : constant Version_32 := 16#69d3c69f#;
   pragma Export (C, u00022, "system__exception_tableS");
   u00023 : constant Version_32 := 16#d65d0fb4#;
   pragma Export (C, u00023, "system__exceptionsS");
   u00024 : constant Version_32 := 16#69416224#;
   pragma Export (C, u00024, "system__exceptions__machineB");
   u00025 : constant Version_32 := 16#46355a4a#;
   pragma Export (C, u00025, "system__exceptions__machineS");
   u00026 : constant Version_32 := 16#7706238d#;
   pragma Export (C, u00026, "system__exceptions_debugB");
   u00027 : constant Version_32 := 16#d4f6e8d5#;
   pragma Export (C, u00027, "system__exceptions_debugS");
   u00028 : constant Version_32 := 16#c667f3c7#;
   pragma Export (C, u00028, "system__img_intS");
   u00029 : constant Version_32 := 16#f2c63a02#;
   pragma Export (C, u00029, "ada__numericsS");
   u00030 : constant Version_32 := 16#174f5472#;
   pragma Export (C, u00030, "ada__numerics__big_numbersS");
   u00031 : constant Version_32 := 16#1ed2cfdf#;
   pragma Export (C, u00031, "system__unsigned_typesS");
   u00032 : constant Version_32 := 16#5c7d9c20#;
   pragma Export (C, u00032, "system__tracebackB");
   u00033 : constant Version_32 := 16#6262443b#;
   pragma Export (C, u00033, "system__tracebackS");
   u00034 : constant Version_32 := 16#5f6b6486#;
   pragma Export (C, u00034, "system__traceback_entriesB");
   u00035 : constant Version_32 := 16#2ce40f0a#;
   pragma Export (C, u00035, "system__traceback_entriesS");
   u00036 : constant Version_32 := 16#974d6b4b#;
   pragma Export (C, u00036, "system__traceback__symbolicB");
   u00037 : constant Version_32 := 16#140ceb78#;
   pragma Export (C, u00037, "system__traceback__symbolicS");
   u00038 : constant Version_32 := 16#179d7d28#;
   pragma Export (C, u00038, "ada__containersS");
   u00039 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00039, "ada__exceptions__tracebackB");
   u00040 : constant Version_32 := 16#26ed0985#;
   pragma Export (C, u00040, "ada__exceptions__tracebackS");
   u00041 : constant Version_32 := 16#0978786d#;
   pragma Export (C, u00041, "system__bounded_stringsB");
   u00042 : constant Version_32 := 16#9305919f#;
   pragma Export (C, u00042, "system__bounded_stringsS");
   u00043 : constant Version_32 := 16#6fdcd709#;
   pragma Export (C, u00043, "system__crtlS");
   u00044 : constant Version_32 := 16#a604bd9c#;
   pragma Export (C, u00044, "system__dwarf_linesB");
   u00045 : constant Version_32 := 16#035e8590#;
   pragma Export (C, u00045, "system__dwarf_linesS");
   u00046 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00046, "ada__charactersS");
   u00047 : constant Version_32 := 16#9de61c25#;
   pragma Export (C, u00047, "ada__characters__handlingB");
   u00048 : constant Version_32 := 16#729cc5db#;
   pragma Export (C, u00048, "ada__characters__handlingS");
   u00049 : constant Version_32 := 16#cde9ea2d#;
   pragma Export (C, u00049, "ada__characters__latin_1S");
   u00050 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00050, "ada__stringsS");
   u00051 : constant Version_32 := 16#c5e1e773#;
   pragma Export (C, u00051, "ada__strings__mapsB");
   u00052 : constant Version_32 := 16#6feaa257#;
   pragma Export (C, u00052, "ada__strings__mapsS");
   u00053 : constant Version_32 := 16#b451a498#;
   pragma Export (C, u00053, "system__bit_opsB");
   u00054 : constant Version_32 := 16#290b1cba#;
   pragma Export (C, u00054, "system__bit_opsS");
   u00055 : constant Version_32 := 16#b459efcb#;
   pragma Export (C, u00055, "ada__strings__maps__constantsS");
   u00056 : constant Version_32 := 16#9111f9c1#;
   pragma Export (C, u00056, "interfacesS");
   u00057 : constant Version_32 := 16#a0d3d22b#;
   pragma Export (C, u00057, "system__address_imageB");
   u00058 : constant Version_32 := 16#45142dbc#;
   pragma Export (C, u00058, "system__address_imageS");
   u00059 : constant Version_32 := 16#8d718538#;
   pragma Export (C, u00059, "system__img_unsS");
   u00060 : constant Version_32 := 16#20ec7aa3#;
   pragma Export (C, u00060, "system__ioB");
   u00061 : constant Version_32 := 16#7aba47c9#;
   pragma Export (C, u00061, "system__ioS");
   u00062 : constant Version_32 := 16#264c804d#;
   pragma Export (C, u00062, "system__mmapB");
   u00063 : constant Version_32 := 16#2a4acea5#;
   pragma Export (C, u00063, "system__mmapS");
   u00064 : constant Version_32 := 16#367911c4#;
   pragma Export (C, u00064, "ada__io_exceptionsS");
   u00065 : constant Version_32 := 16#2e05e25c#;
   pragma Export (C, u00065, "system__mmap__os_interfaceB");
   u00066 : constant Version_32 := 16#52ab6463#;
   pragma Export (C, u00066, "system__mmap__os_interfaceS");
   u00067 : constant Version_32 := 16#29c68ba2#;
   pragma Export (C, u00067, "system__os_libB");
   u00068 : constant Version_32 := 16#1e9460d9#;
   pragma Export (C, u00068, "system__os_libS");
   u00069 : constant Version_32 := 16#94d23d25#;
   pragma Export (C, u00069, "system__atomic_operations__test_and_setB");
   u00070 : constant Version_32 := 16#57acee8e#;
   pragma Export (C, u00070, "system__atomic_operations__test_and_setS");
   u00071 : constant Version_32 := 16#239bcaa3#;
   pragma Export (C, u00071, "system__atomic_operationsS");
   u00072 : constant Version_32 := 16#553a519e#;
   pragma Export (C, u00072, "system__atomic_primitivesB");
   u00073 : constant Version_32 := 16#afa7bbc1#;
   pragma Export (C, u00073, "system__atomic_primitivesS");
   u00074 : constant Version_32 := 16#0390ef72#;
   pragma Export (C, u00074, "interfaces__cB");
   u00075 : constant Version_32 := 16#eabda398#;
   pragma Export (C, u00075, "interfaces__cS");
   u00076 : constant Version_32 := 16#b98923bf#;
   pragma Export (C, u00076, "system__case_utilB");
   u00077 : constant Version_32 := 16#2beb67d3#;
   pragma Export (C, u00077, "system__case_utilS");
   u00078 : constant Version_32 := 16#256dbbe5#;
   pragma Export (C, u00078, "system__stringsB");
   u00079 : constant Version_32 := 16#7f7ab09e#;
   pragma Export (C, u00079, "system__stringsS");
   u00080 : constant Version_32 := 16#edf7b7b1#;
   pragma Export (C, u00080, "system__object_readerB");
   u00081 : constant Version_32 := 16#7787c48e#;
   pragma Export (C, u00081, "system__object_readerS");
   u00082 : constant Version_32 := 16#8590b30a#;
   pragma Export (C, u00082, "system__val_lliS");
   u00083 : constant Version_32 := 16#735e3189#;
   pragma Export (C, u00083, "system__val_lluS");
   u00084 : constant Version_32 := 16#b709731b#;
   pragma Export (C, u00084, "system__sparkS");
   u00085 : constant Version_32 := 16#a571a4dc#;
   pragma Export (C, u00085, "system__spark__cut_operationsB");
   u00086 : constant Version_32 := 16#629c0fb7#;
   pragma Export (C, u00086, "system__spark__cut_operationsS");
   u00087 : constant Version_32 := 16#1bac5121#;
   pragma Export (C, u00087, "system__val_utilB");
   u00088 : constant Version_32 := 16#4881149d#;
   pragma Export (C, u00088, "system__val_utilS");
   u00089 : constant Version_32 := 16#bad10b33#;
   pragma Export (C, u00089, "system__exception_tracesB");
   u00090 : constant Version_32 := 16#0860d9e0#;
   pragma Export (C, u00090, "system__exception_tracesS");
   u00091 : constant Version_32 := 16#5b97f5b3#;
   pragma Export (C, u00091, "system__win32S");
   u00092 : constant Version_32 := 16#fd158a37#;
   pragma Export (C, u00092, "system__wch_conB");
   u00093 : constant Version_32 := 16#3dfb93e5#;
   pragma Export (C, u00093, "system__wch_conS");
   u00094 : constant Version_32 := 16#5c289972#;
   pragma Export (C, u00094, "system__wch_stwB");
   u00095 : constant Version_32 := 16#10eabfe4#;
   pragma Export (C, u00095, "system__wch_stwS");
   u00096 : constant Version_32 := 16#7cd63de5#;
   pragma Export (C, u00096, "system__wch_cnvB");
   u00097 : constant Version_32 := 16#3b3b5995#;
   pragma Export (C, u00097, "system__wch_cnvS");
   u00098 : constant Version_32 := 16#e538de43#;
   pragma Export (C, u00098, "system__wch_jisB");
   u00099 : constant Version_32 := 16#8e8c3bbf#;
   pragma Export (C, u00099, "system__wch_jisS");
   u00100 : constant Version_32 := 16#e18a47a0#;
   pragma Export (C, u00100, "ada__float_text_ioB");
   u00101 : constant Version_32 := 16#a31d9ddf#;
   pragma Export (C, u00101, "ada__float_text_ioS");
   u00102 : constant Version_32 := 16#2170d2a2#;
   pragma Export (C, u00102, "ada__text_ioB");
   u00103 : constant Version_32 := 16#f2a72b98#;
   pragma Export (C, u00103, "ada__text_ioS");
   u00104 : constant Version_32 := 16#b4f41810#;
   pragma Export (C, u00104, "ada__streamsB");
   u00105 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00105, "ada__streamsS");
   u00106 : constant Version_32 := 16#a201b8c5#;
   pragma Export (C, u00106, "ada__strings__text_buffersB");
   u00107 : constant Version_32 := 16#a7cfd09b#;
   pragma Export (C, u00107, "ada__strings__text_buffersS");
   u00108 : constant Version_32 := 16#8b7604c4#;
   pragma Export (C, u00108, "ada__strings__utf_encodingB");
   u00109 : constant Version_32 := 16#c9e86997#;
   pragma Export (C, u00109, "ada__strings__utf_encodingS");
   u00110 : constant Version_32 := 16#bb780f45#;
   pragma Export (C, u00110, "ada__strings__utf_encoding__stringsB");
   u00111 : constant Version_32 := 16#b85ff4b6#;
   pragma Export (C, u00111, "ada__strings__utf_encoding__stringsS");
   u00112 : constant Version_32 := 16#d1d1ed0b#;
   pragma Export (C, u00112, "ada__strings__utf_encoding__wide_stringsB");
   u00113 : constant Version_32 := 16#5678478f#;
   pragma Export (C, u00113, "ada__strings__utf_encoding__wide_stringsS");
   u00114 : constant Version_32 := 16#c2b98963#;
   pragma Export (C, u00114, "ada__strings__utf_encoding__wide_wide_stringsB");
   u00115 : constant Version_32 := 16#d7af3358#;
   pragma Export (C, u00115, "ada__strings__utf_encoding__wide_wide_stringsS");
   u00116 : constant Version_32 := 16#0d5e09a4#;
   pragma Export (C, u00116, "ada__tagsB");
   u00117 : constant Version_32 := 16#2a9756e0#;
   pragma Export (C, u00117, "ada__tagsS");
   u00118 : constant Version_32 := 16#3548d972#;
   pragma Export (C, u00118, "system__htableB");
   u00119 : constant Version_32 := 16#6521e86d#;
   pragma Export (C, u00119, "system__htableS");
   u00120 : constant Version_32 := 16#1f1abe38#;
   pragma Export (C, u00120, "system__string_hashB");
   u00121 : constant Version_32 := 16#c2646812#;
   pragma Export (C, u00121, "system__string_hashS");
   u00122 : constant Version_32 := 16#05222263#;
   pragma Export (C, u00122, "system__put_imagesB");
   u00123 : constant Version_32 := 16#f856b799#;
   pragma Export (C, u00123, "system__put_imagesS");
   u00124 : constant Version_32 := 16#22b9eb9f#;
   pragma Export (C, u00124, "ada__strings__text_buffers__utilsB");
   u00125 : constant Version_32 := 16#89062ac3#;
   pragma Export (C, u00125, "ada__strings__text_buffers__utilsS");
   u00126 : constant Version_32 := 16#1cacf006#;
   pragma Export (C, u00126, "interfaces__c_streamsB");
   u00127 : constant Version_32 := 16#d07279c2#;
   pragma Export (C, u00127, "interfaces__c_streamsS");
   u00128 : constant Version_32 := 16#f74fab1c#;
   pragma Export (C, u00128, "system__file_ioB");
   u00129 : constant Version_32 := 16#82b7e5c0#;
   pragma Export (C, u00129, "system__file_ioS");
   u00130 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00130, "ada__finalizationS");
   u00131 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00131, "system__finalization_rootB");
   u00132 : constant Version_32 := 16#ab0ac316#;
   pragma Export (C, u00132, "system__finalization_rootS");
   u00133 : constant Version_32 := 16#6851dee2#;
   pragma Export (C, u00133, "system__file_control_blockS");
   u00134 : constant Version_32 := 16#5e511f79#;
   pragma Export (C, u00134, "ada__text_io__generic_auxB");
   u00135 : constant Version_32 := 16#d2ac8a2d#;
   pragma Export (C, u00135, "ada__text_io__generic_auxS");
   u00136 : constant Version_32 := 16#27ca6fea#;
   pragma Export (C, u00136, "system__fat_fltS");
   u00137 : constant Version_32 := 16#ebc5433f#;
   pragma Export (C, u00137, "system__img_fltS");
   u00138 : constant Version_32 := 16#1b28662b#;
   pragma Export (C, u00138, "system__float_controlB");
   u00139 : constant Version_32 := 16#0404f3ba#;
   pragma Export (C, u00139, "system__float_controlS");
   u00140 : constant Version_32 := 16#1efd3382#;
   pragma Export (C, u00140, "system__img_utilB");
   u00141 : constant Version_32 := 16#93e1143f#;
   pragma Export (C, u00141, "system__img_utilS");
   u00142 : constant Version_32 := 16#41e2093e#;
   pragma Export (C, u00142, "system__powten_fltS");
   u00143 : constant Version_32 := 16#36bc39b0#;
   pragma Export (C, u00143, "system__img_lfltS");
   u00144 : constant Version_32 := 16#01f866e7#;
   pragma Export (C, u00144, "system__fat_lfltS");
   u00145 : constant Version_32 := 16#74e8ac92#;
   pragma Export (C, u00145, "system__img_lluS");
   u00146 : constant Version_32 := 16#48f0e24e#;
   pragma Export (C, u00146, "system__powten_lfltS");
   u00147 : constant Version_32 := 16#7d6c1edc#;
   pragma Export (C, u00147, "system__img_llfS");
   u00148 : constant Version_32 := 16#7b28c80d#;
   pragma Export (C, u00148, "system__fat_llfS");
   u00149 : constant Version_32 := 16#7f6158c5#;
   pragma Export (C, u00149, "system__powten_llfS");
   u00150 : constant Version_32 := 16#336d6941#;
   pragma Export (C, u00150, "system__val_fltS");
   u00151 : constant Version_32 := 16#41e89f7f#;
   pragma Export (C, u00151, "system__exn_fltS");
   u00152 : constant Version_32 := 16#d6c127b0#;
   pragma Export (C, u00152, "system__val_lfltS");
   u00153 : constant Version_32 := 16#ffa97ea6#;
   pragma Export (C, u00153, "system__exn_lfltS");
   u00154 : constant Version_32 := 16#761695fd#;
   pragma Export (C, u00154, "system__val_llfS");
   u00155 : constant Version_32 := 16#d207bed6#;
   pragma Export (C, u00155, "system__exn_llfS");
   u00156 : constant Version_32 := 16#4b810764#;
   pragma Export (C, u00156, "ada__strings__unboundedB");
   u00157 : constant Version_32 := 16#850187aa#;
   pragma Export (C, u00157, "ada__strings__unboundedS");
   u00158 : constant Version_32 := 16#0b8849df#;
   pragma Export (C, u00158, "ada__strings__searchB");
   u00159 : constant Version_32 := 16#a44727a7#;
   pragma Export (C, u00159, "ada__strings__searchS");
   u00160 : constant Version_32 := 16#ec48c658#;
   pragma Export (C, u00160, "system__compare_array_unsigned_8B");
   u00161 : constant Version_32 := 16#741e2ee5#;
   pragma Export (C, u00161, "system__compare_array_unsigned_8S");
   u00162 : constant Version_32 := 16#74e358eb#;
   pragma Export (C, u00162, "system__address_operationsB");
   u00163 : constant Version_32 := 16#9acc9c26#;
   pragma Export (C, u00163, "system__address_operationsS");
   u00164 : constant Version_32 := 16#274d62a5#;
   pragma Export (C, u00164, "system__return_stackS");
   u00165 : constant Version_32 := 16#52627794#;
   pragma Export (C, u00165, "system__atomic_countersB");
   u00166 : constant Version_32 := 16#38e05f45#;
   pragma Export (C, u00166, "system__atomic_countersS");
   u00167 : constant Version_32 := 16#8356fb7a#;
   pragma Export (C, u00167, "system__stream_attributesB");
   u00168 : constant Version_32 := 16#aecf506b#;
   pragma Export (C, u00168, "system__stream_attributesS");
   u00169 : constant Version_32 := 16#4ea7f13e#;
   pragma Export (C, u00169, "system__stream_attributes__xdrB");
   u00170 : constant Version_32 := 16#14c199f1#;
   pragma Export (C, u00170, "system__stream_attributes__xdrS");
   u00171 : constant Version_32 := 16#8f2423cb#;
   pragma Export (C, u00171, "system__memoryB");
   u00172 : constant Version_32 := 16#fc6c2c9c#;
   pragma Export (C, u00172, "system__memoryS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  interfaces%s
   --  system%s
   --  system.address_operations%s
   --  system.address_operations%b
   --  system.atomic_operations%s
   --  system.float_control%s
   --  system.float_control%b
   --  system.io%s
   --  system.io%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.powten_flt%s
   --  system.powten_lflt%s
   --  system.powten_llf%s
   --  system.spark%s
   --  system.spark.cut_operations%s
   --  system.spark.cut_operations%b
   --  system.storage_elements%s
   --  system.return_stack%s
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.compare_array_unsigned_8%s
   --  system.compare_array_unsigned_8%b
   --  system.exn_flt%s
   --  system.exn_lflt%s
   --  system.exn_llf%s
   --  system.traceback%s
   --  system.traceback%b
   --  ada.characters.handling%s
   --  system.atomic_operations.test_and_set%s
   --  system.case_util%s
   --  system.os_lib%s
   --  system.secondary_stack%s
   --  system.standard_library%s
   --  ada.exceptions%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.soft_links%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_llu%s
   --  system.val_lli%s
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  ada.exceptions.traceback%b
   --  system.address_image%s
   --  system.address_image%b
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.bounded_strings%s
   --  system.bounded_strings%b
   --  system.case_util%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.containers%s
   --  ada.io_exceptions%s
   --  ada.numerics%s
   --  ada.numerics.big_numbers%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.maps%b
   --  ada.strings.maps.constants%s
   --  interfaces.c%s
   --  interfaces.c%b
   --  system.atomic_primitives%s
   --  system.atomic_primitives%b
   --  system.exceptions%s
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  system.win32%s
   --  ada.characters.handling%b
   --  system.atomic_operations.test_and_set%b
   --  system.exception_traces%s
   --  system.exception_traces%b
   --  system.img_int%s
   --  system.img_uns%s
   --  system.memory%s
   --  system.memory%b
   --  system.mmap%s
   --  system.mmap.os_interface%s
   --  system.mmap.os_interface%b
   --  system.mmap%b
   --  system.object_reader%s
   --  system.object_reader%b
   --  system.dwarf_lines%s
   --  system.dwarf_lines%b
   --  system.os_lib%b
   --  system.secondary_stack%b
   --  system.soft_links.initialize%s
   --  system.soft_links.initialize%b
   --  system.soft_links%b
   --  system.standard_library%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  ada.strings.search%s
   --  ada.strings.search%b
   --  ada.strings.utf_encoding%s
   --  ada.strings.utf_encoding%b
   --  ada.strings.utf_encoding.strings%s
   --  ada.strings.utf_encoding.strings%b
   --  ada.strings.utf_encoding.wide_strings%s
   --  ada.strings.utf_encoding.wide_strings%b
   --  ada.strings.utf_encoding.wide_wide_strings%s
   --  ada.strings.utf_encoding.wide_wide_strings%b
   --  ada.tags%s
   --  ada.tags%b
   --  ada.strings.text_buffers%s
   --  ada.strings.text_buffers%b
   --  ada.strings.text_buffers.utils%s
   --  ada.strings.text_buffers.utils%b
   --  system.atomic_counters%s
   --  system.atomic_counters%b
   --  system.fat_flt%s
   --  system.fat_lflt%s
   --  system.fat_llf%s
   --  system.put_images%s
   --  system.put_images%b
   --  ada.streams%s
   --  ada.streams%b
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.file_io%s
   --  system.file_io%b
   --  system.stream_attributes%s
   --  system.stream_attributes.xdr%s
   --  system.stream_attributes.xdr%b
   --  system.stream_attributes%b
   --  ada.strings.unbounded%s
   --  ada.strings.unbounded%b
   --  system.val_flt%s
   --  system.val_lflt%s
   --  system.val_llf%s
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  system.img_llu%s
   --  system.img_util%s
   --  system.img_util%b
   --  system.img_flt%s
   --  system.img_lflt%s
   --  system.img_llf%s
   --  ada.float_text_io%s
   --  ada.float_text_io%b
   --  calculator%b
   --  END ELABORATION ORDER

end ada_main;
