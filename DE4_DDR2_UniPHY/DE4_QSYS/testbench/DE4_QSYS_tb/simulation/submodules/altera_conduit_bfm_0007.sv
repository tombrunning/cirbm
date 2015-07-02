// (C) 2001-2013 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $Id: //acds/main/ip/sopc/components/verification/altera_tristate_conduit_bfm/altera_tristate_conduit_bfm.sv.terp#7 $
// $Revision: #7 $
// $Date: 2010/08/05 $
// $Author: klong $
//-----------------------------------------------------------------------------
// =head1 NAME
// altera_conduit_bfm
// =head1 SYNOPSIS
// Bus Functional Model (BFM) for a Standard Conduit BFM
//-----------------------------------------------------------------------------
// =head1 DESCRIPTION
// This is a Bus Functional Model (BFM) for a Standard Conduit Master.
// This BFM sampled the input/bidirection port value or driving user's value to 
// output ports when user call the API.  
// This BFM's HDL is been generated through terp file in Qsys/SOPC Builder.
// Generation parameters:
// output_name:                                       altera_conduit_bfm_0007
// role:width:direction:                              fixed_location:1:output,read_base:32:output,read_length:32:output,go:1:output,done:1:input,early_done:1:input
// false
//-----------------------------------------------------------------------------
`timescale 1 ns / 1 ns

module altera_conduit_bfm_0007
(
   sig_fixed_location,
   sig_read_base,
   sig_read_length,
   sig_go,
   sig_done,
   sig_early_done
);

   //--------------------------------------------------------------------------
   // =head1 PINS 
   // =head2 User defined interface
   //--------------------------------------------------------------------------
   output sig_fixed_location;
   output [31 : 0] sig_read_base;
   output [31 : 0] sig_read_length;
   output sig_go;
   input sig_done;
   input sig_early_done;

   // synthesis translate_off
   import verbosity_pkg::*;
   
   typedef logic ROLE_fixed_location_t;
   typedef logic [31 : 0] ROLE_read_base_t;
   typedef logic [31 : 0] ROLE_read_length_t;
   typedef logic ROLE_go_t;
   typedef logic ROLE_done_t;
   typedef logic ROLE_early_done_t;

   reg fixed_location_temp;
   reg fixed_location_out;
   reg [31 : 0] read_base_temp;
   reg [31 : 0] read_base_out;
   reg [31 : 0] read_length_temp;
   reg [31 : 0] read_length_out;
   reg go_temp;
   reg go_out;
   logic [0 : 0] done_in;
   logic [0 : 0] done_local;
   logic [0 : 0] early_done_in;
   logic [0 : 0] early_done_local;

   //--------------------------------------------------------------------------
   // =head1 Public Methods API
   // =pod
   // This section describes the public methods in the application programming
   // interface (API). The application program interface provides methods for 
   // a testbench which instantiates, controls and queries state in this BFM 
   // component. Test programs must only use these public access methods and 
   // events to communicate with this BFM component. The API and module pins
   // are the only interfaces of this component that are guaranteed to be
   // stable. The API will be maintained for the life of the product. 
   // While we cannot prevent a test program from directly accessing internal
   // tasks, functions, or data private to the BFM, there is no guarantee that
   // these will be present in the future. In fact, it is best for the user
   // to assume that the underlying implementation of this component can 
   // and will change.
   // =cut
   //--------------------------------------------------------------------------
   
   event signal_input_done_change;
   event signal_input_early_done_change;
   
   function automatic string get_version();  // public
      // Return BFM version string. For example, version 9.1 sp1 is "9.1sp1" 
      string ret_version = "13.0";
      return ret_version;
   endfunction

   // -------------------------------------------------------
   // fixed_location
   // -------------------------------------------------------

   function automatic void set_fixed_location (
      ROLE_fixed_location_t new_value
   );
      // Drive the new value to fixed_location.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      fixed_location_temp = new_value;
   endfunction

   // -------------------------------------------------------
   // read_base
   // -------------------------------------------------------

   function automatic void set_read_base (
      ROLE_read_base_t new_value
   );
      // Drive the new value to read_base.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      read_base_temp = new_value;
   endfunction

   // -------------------------------------------------------
   // read_length
   // -------------------------------------------------------

   function automatic void set_read_length (
      ROLE_read_length_t new_value
   );
      // Drive the new value to read_length.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      read_length_temp = new_value;
   endfunction

   // -------------------------------------------------------
   // go
   // -------------------------------------------------------

   function automatic void set_go (
      ROLE_go_t new_value
   );
      // Drive the new value to go.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      go_temp = new_value;
   endfunction

   // -------------------------------------------------------
   // done
   // -------------------------------------------------------
   function automatic ROLE_done_t get_done();
   
      // Gets the done input value.
      $sformat(message, "%m: called get_done");
      print(VERBOSITY_DEBUG, message);
      return done_in;
      
   endfunction

   // -------------------------------------------------------
   // early_done
   // -------------------------------------------------------
   function automatic ROLE_early_done_t get_early_done();
   
      // Gets the early_done input value.
      $sformat(message, "%m: called get_early_done");
      print(VERBOSITY_DEBUG, message);
      return early_done_in;
      
   endfunction

   assign sig_fixed_location = fixed_location_temp;
   assign sig_read_base = read_base_temp;
   assign sig_read_length = read_length_temp;
   assign sig_go = go_temp;
   assign done_in = sig_done;
   assign early_done_in = sig_early_done;


   always @(done_in) begin
      if (done_local != done_in)
         -> signal_input_done_change;
      done_local = done_in;
   end
   
   always @(early_done_in) begin
      if (early_done_local != early_done_in)
         -> signal_input_early_done_change;
      early_done_local = early_done_in;
   end
   


// synthesis translate_on

endmodule


