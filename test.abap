METHOD if_ex_invoice_update~change_at_save.

*""""""""""""""""""""""""""""""""""""""""""" ADDED BY PANKAJS """""""""""""""""""""""""""""""""""""""""""
  DATA  : item_list_version TYPE mrm_item_list_version.
  IMPORT item_list_version = item_list_version FROM MEMORY ID 'REV'.


  TYPES : BEGIN OF tt_bseg,
          bukrs TYPE bseg-bukrs,
          belnr TYPE bseg-belnr,
          gjahr TYPE bseg-gjahr,
          buzei TYPE bseg-buzei,
          koart TYPE bseg-koart,
    END OF tt_bseg.
  TYPES : BEGIN OF tt_bkpf,
          bukrs TYPE bkpf-bukrs,
          belnr TYPE bkpf-belnr,
          gjahr TYPE bkpf-gjahr,
          xblnr TYPE bkpf-xblnr,
      xreversal TYPE bkpf-xreversal,
          blart TYPE bkpf-blart,
          stblg TYPE bkpf-stblg,
    END OF tt_bkpf.

  TYPES : BEGIN OF tt_rbkp,
          belnr TYPE rbkp-belnr,
          gjahr TYPE rbkp-gjahr,
          lifnr TYPE rbkp-lifnr,
          xblnr TYPE rbkp-xblnr,
          blart TYPE rbkp-blart,
          ivtyp TYPE rbkp-ivtyp,
          rbstat TYPE rbkp-rbstat,
          stblg TYPE rbkp-stblg,
    END OF tt_rbkp.

  DATA :
        it_bseg TYPE TABLE OF tt_bseg,
        wa_bseg TYPE tt_bseg,
        it_bkpf TYPE TABLE OF tt_bkpf,
        wa_bkpf TYPE tt_bkpf,
        it_rbkp TYPE TABLE OF tt_rbkp,
        wa_rbkp TYPE tt_rbkp,
         mess_pri TYPE string,
         hmsg_txt TYPE char100,
              msg_txt TYPE char100,
              ans(8) TYPE c,
               v_stcd3 TYPE lfa1-stcd3.
  DATA:       wa_rseg_new TYPE mrmrseg,
        introw  TYPE  introw_ekbe,
              v_steuc TYPE steuc.
              