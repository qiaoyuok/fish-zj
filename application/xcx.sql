/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : xcx

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-05-02 09:33:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for xcx_access_token
-- ----------------------------
DROP TABLE IF EXISTS `xcx_access_token`;
CREATE TABLE `xcx_access_token` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `access_token` varchar(550) NOT NULL DEFAULT '' COMMENT 'access_token',
  `out_time` varchar(11) NOT NULL DEFAULT '' COMMENT 'access_token过期时间',
  `create_time` varchar(11) NOT NULL DEFAULT '' COMMENT '第一次发送模板消息时间',
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '默认为0；0：小程序的access_token；1：微信公众号的access_token',
  `ticket` varchar(255) NOT NULL DEFAULT '' COMMENT 'ticket',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xcx_access_token
-- ----------------------------
INSERT INTO `xcx_access_token` VALUES ('81', '8_IOA-IDpMoPHtiWopUysLFFHWT0I4EsZzy4wzOZnISZiE0K74dFanApwTiBju3xV96Y4hVj6Z9pIb6a7geTrSBdoc_0QCtRI4DhFNPW5AIAAgTMEN4M5BRimvReEmcEG2AlVsUpsFlikC9rluKMHgAEAXZU', '1524111785', '1524104635', '0', '');
INSERT INTO `xcx_access_token` VALUES ('82', '8_r7OSKiqIiowilGXjQyI1evMQeb8mQiQJ_eJWs3-FK4hgzXaB1-SG4I4guolil2KTMPx-dk6uopvJbDvB9VP9sC1w5UzFczB0xKiN6kKyYcD4JQ3-phVeg8M--2NxrAgrpcAOPuexDUWzNY7rFPKiAEANXS', '1524111835', '1524104685', '0', '');
INSERT INTO `xcx_access_token` VALUES ('83', '8__6VBHEJg4gtfoJ4IRzrltcPblu6ej3C7SQmnJzTRofqpSONsyul4DgFhzQMXu-jwBsLKV8PBZboN3IqMd-JyEn3Qf_JfBbegOzk4fp-kFulMSzp9fusKD5lgCCueYaooPMNw4JjQ7GpT_2BqZDMfAEAEIR', '1524127795', '1524120645', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6NxmqcVV2MQjSQmd2xCuS8r0Fqpaxe3B3gFpfp_XKvrMmSw');
INSERT INTO `xcx_access_token` VALUES ('84', '8_aHZjb2O718B0MbcXVyBimlWCROD_epcTqSGlM3vbyqRg4KBI9YFRyDP6p475lBH7g19wNrWq18Cucm3TTuvAJsWV5QL-YYmloR2KAdp9MohwkXF4HuiPiduLRTANOTcAJATUZ', '1524137158', '1524130008', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6NxlcTUfhANU4FHzTvhJBPlKLZcGBmV_C2Absngc9ajV20Q');
INSERT INTO `xcx_access_token` VALUES ('85', '8_y0BEd8tk9IdIFHfbjBdvsSsLX-mnsxvJqydjzgi7CPrAlDK0FJNVW4NrUszqUxbkP1R3wyIOwQNhjmvB9WBajQBpC4nTxbJJSxYZrmeh4XHH02s15QHq1cbci7kHb4F-twmV7Rug59mNzzj-WDRjADAIPD', '1524137894', '1524130744', '0', '');
INSERT INTO `xcx_access_token` VALUES ('86', '8_4bZMyp-DyG0LteO_8-DrT935PZaSg0cnk_6elSqUnDWEtPKeqNDGImMMym-IOER657_zHgicZfhyUHi129OGLuYx4Hg_y0SGfb4z30_yEkzMS9jUd90watLgIuepUgPPtQKcSwBj-guoAtOlIHFcAGAPOM', '1524155967', '1524148817', '1', '');
INSERT INTO `xcx_access_token` VALUES ('87', '8_H-_HtTzs0q-n3pcpvEr0PxOPJ1FksCF2s3lsS76FDj8M-h0WDCjxYXwwfYgASHcDddlFhPPQW1yrI-pGUV2fgn881hVKN5ClrqEdk7yTOrdW8cO4AX8xbaP8FSgF4jLZR5SV9d21hEjoq3AKEAOeADAQMA', '1524155967', '1524148817', '0', '');
INSERT INTO `xcx_access_token` VALUES ('88', '8_aq7PVEwEhnxlchh3pNEEPBNH6Zu1sitQN5BQ9dDFfIeRjTFX7kLp70HcC0e9BIy5zE_cuuZz64lW5HBXCZtIr7ReofQb8Zvzj7AadxVcoQpw2QRsP431t2lnt3d8GlHuRTkInuZWSTq_tGNrYSHfAIAUOD', '1524200084', '1524192934', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6NxlRhE3tjKjsCrNGbbtrBMId_1UkkTs37GXa45vw6HnGzg');
INSERT INTO `xcx_access_token` VALUES ('89', '8_G1c-gIoEyJtQcYpDQ1CACp5c049h-Ht_PqukUiU_TK9FmTf7KQaBjzmmpqoJ1QI7nFo4ZmXKDMZToOLCZhy031SRL9UYy8z4-D74qg0keloR4ZGYFHoyjXqzV8Xloa4w4iSKGNVdjCJ4vm5eEGGaAJAUWW', '1524210167', '1524203017', '1', '');
INSERT INTO `xcx_access_token` VALUES ('90', '8_Un0fPhgeVnZ2wYW6Fk4fCk53ZaWDtyB-kjX-uqQKQQWKAdWDZ8GC4lRFJ4MYg6Nz1xlznAK3TNYwCF_XWtH4lwTCWNfEAluZeCR33ePB9yNgkfIvsJ1LsXKx-GASQIiAEAIGY', '1524220040', '1524212890', '0', '');
INSERT INTO `xcx_access_token` VALUES ('91', '8_2fdk16BkXpCUenCFtbXWZJPS4doo89MEVQuFA08zPC_7n5NUdpa3toS5NgdTdAT850crqNXyuMu_bClixad-CjJMzKZEpIhjo7SjElo-t4gcH7r4a9owL0to8F2adyQuJPSBxMPMjoaQhQgXABOgAIAHIV', '1524220430', '1524213280', '0', '');
INSERT INTO `xcx_access_token` VALUES ('92', '8_VR04MlFrtjRPfeLfLPVsnRL5mgpluuX-Zc3AnA51S3mYv0N81ORN9l8Wh3TbHPoSdwkfNNJvi6240W3_zwTbrJfb730F7P0heJR0P2_oBT6Y_VuOQzRof40sUmRHijrBZPZp6GDSSwiskRi2ARVeAJAEVZ', '1524220568', '1524213418', '0', '');
INSERT INTO `xcx_access_token` VALUES ('93', '8_tutNlV5I2U-MaA1lTwzoW8jhRLR9td64KKyRQbreorsbWU9jhfTmHet_o5UEHk-Zoal274asj7bVxk0ZCovveStP1MMPQkS_FbilYST6SxvB2hrcOSb6ETaLg3jK2fdIWF2kJwc_YpZ4yR4rDPIfAEAYKD', '1524222827', '1524215677', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6NxmtiKgjLCjcZa0_egaGdcdGLlCw3XGJtTl-3KNNfE0iOA');
INSERT INTO `xcx_access_token` VALUES ('94', '8_z17RHmKy9aHqa5sBCPZ19oTUBDcGdebyu0VQzHRs9ACJu9Jvnd68US-XVx6Fl7ELvd7dztGdJwEd4lEn4o2YxzlQg8-mc9pwYrBVFAa04v9Fv38QkHK3WXg3u3cY-nXI2Kg5esIXfxdh23GmSYWdAHALRP', '1524278727', '1524271577', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6Nxko9UzmwnXgLWPXoY0F9LaLjaHpx9MmM3vNo2s2doD-1w');
INSERT INTO `xcx_access_token` VALUES ('95', '8_JzR7kwtcm2ts2PaqRldAKgyQvzSSCRmUZYkrz07teZWDXe8kV_yLiWv-B9Pp5-uOU3CINObyRbLMBc4A55XEH47U63cy6DziyDgmshud123aRcnOm0IGr7v8hiI-4bC0n_ATCgrE6senykavGZOiAGAWPE', '1524298993', '1524291843', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6NxnqWSeR5Pl0CBW4qU_jvRRnKt4FyOc_-jCZnlNmcb06Zw');
INSERT INTO `xcx_access_token` VALUES ('96', '9_7pFYzLTxcSuUfjLExJD594z4htXqALRSrClrLPk6ZaKiYDFxbB7_IVSmikO-zeOjvaNVlLKQIpF9htMKQkn7kWdX4ubeIv9wgLZT7X565AbR-Nj-U10C4cVrARenXYUNkzdTutJjiQ5hlC4wMANfAEABPC', '1524306220', '1524299070', '1', '');
INSERT INTO `xcx_access_token` VALUES ('97', '9_4sVT_68XWjgZTiv1u4OTyLo2q2ET69lgSzG-1JX_Y3IvLXPiUM80RwZH4P9_hz1ZCgjBGADmB-d-N1Zqlqv2QE3Bb2awh-2LVnCYjgAD0JNeepyt-U1d7Mly8Y4OFPeAIAVMW', '1524359152', '1524352002', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6NxmypHQY75rTo1ifVqTtIxycPZPM6X7wiiJu_d25TyyupA');
INSERT INTO `xcx_access_token` VALUES ('98', '9_F0Jsur4amVtaGHIzRsXLdCb6FNrxfcpFXNHtSENXU27fLDRsZhHlwTVlcJLn5-OmbfGPTT66qYaHhla7GLUm4s6xEKb1P1TYVhtwQEiT64bCu1jyP_nDZ3kAotGk3r6uI-WBzLhD_w5Dd6_8XBQjAAAGKZ', '1524376011', '1524368861', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6Nxlr2ChzE4ltuJfmuCgqYvQmkw9h9gfMaW4Be04TyFODWg');
INSERT INTO `xcx_access_token` VALUES ('99', '9_FATTpN1At4uhtz8xSNf6hhbaDBB0LLFJpMWYe80tGAYx7hUtcTrUcgMpROiSAGu5fcex_wi47IMFhS1uzvyNXTfG8JPatsu7cVZQeRmSyXnRHbIUfcqMC2xykiwUNTbAEACVB', '1524449433', '1524442283', '0', '');
INSERT INTO `xcx_access_token` VALUES ('100', '9_dzIr5lJHIkwDQ4KE7m0rEiVeyF6I0-3tlpTXoGWR0cj_Jk72Sd8aeTHIw7kcY97ExY8qEodzqWB6TSweTHgwvhcXxxhhgPlF3OrGv_qERXD2Pt7V8eTar_Iu3kjNYjJCv5XShIJQ-dzqMaNMNJTgAJABXH', '1524454649', '1524447499', '0', '');
INSERT INTO `xcx_access_token` VALUES ('101', '9_g93U4z0dsr2V6kq0UjXDuvWErDZHMu9ROqviU5BgAlVy9qqpTARaJzCDkNFSbsPzE0I1dk3v0C6w29nOvEnLhoh_TkdxDlfyMFjLaDWZdWnOb0W0KiU6pZv9ub-fqr_PuVkneB7ivAmZbUNUFYHdACAATC', '1524455333', '1524448183', '1', '');
INSERT INTO `xcx_access_token` VALUES ('102', '9_pzGzLGmeZE-gRgVIS-Bby15IY-_gVRYJvwWPFoDVAw4MfkA2wyN4Q-4zTzaFd5Qmm3SAydCWwp_7Yzyfxgey4Qwz2R0SOdmF7NOZCtyp823tcnHCZqjozn6kdMjRsLNYvVm-xIF7UCsd-o66FLEjAEALRK', '1524464977', '1524457827', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6NxlkICVWEMJu8UmQxXZ_ixNXIHRxnQU14xKheat4ez2K9A');
INSERT INTO `xcx_access_token` VALUES ('103', '9_X3cZRrqwqI4rfzZg0l7cacCzMS-JuGFpc0mrN78LgHAi_-HwzdC8Mk9-SHN2Ry5gmzT1KeaCUl0e6jIKNcRVnhcRLoPfPvfSq2e35n8gUjZRa0NglbQOpfpOPg6WzatehsQMt-kR5ekJpEXKUOUcAGADXD', '1524466405', '1524459255', '0', '');
INSERT INTO `xcx_access_token` VALUES ('104', '9_6zVRZDG_Kelbp6tRRVZkVrCv6S1ksBlkqmdxL4AoKMzL-b2zmH_g6YKk3xiywApFyiwVnmvgEgcuAz_bJ31bD97TTRiH0vAtuK6scr69xpk_1DYNruoLihQ8oncSFIaADAZMP', '1524484135', '1524476985', '0', '');
INSERT INTO `xcx_access_token` VALUES ('105', '9_mb3ItQpm8_937jxXSQB0KtTwUtG5_4wox4FnVEjCXd8MvhSQ5SatECN7gVIULgyyC6aZed3S8KoZ4DWg51ieOZqSoEXOC13vbzXfgNDQmFB2um_4zFxxPzF7lfn0RuaQyph72xIi08fCbbSQUTNgAEALKE', '1524541846', '1524534696', '0', '');
INSERT INTO `xcx_access_token` VALUES ('106', '9_0wwpK0EAT75kXyAQLFtC9lGWZg4DJnNoHOWO23uo5ISkl90cuymuxIKC9NlMFHwkATjpBNrtsqyNnSueIbLB1_RI_NsJTjELeADj7qRP2xA1rpjPEZMA0k-5l_TkoZu0h5HLyXTpyjhOjsKdRBTeAIAYIA', '1524549081', '1524541931', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6NxkuGfdMru5oHRIs8zjoPjpDv-hbu-1b7tVHlQs6vbDe-Q');
INSERT INTO `xcx_access_token` VALUES ('107', '9_V2plBJtgnCe-k-NiDWLNDrwbsUuAJpsHJtDjKTBrBNGIt5ForNCbUxcAcMvWVjzeb0AeDoRtkckQKKefzayUli08suLO0Fd74wqIDPd1DNNuFHvq4XQu1PNcDxr0laKzoQ1rH4jV_HRjd9FsTIIhADAODD', '1524549588', '1524542438', '0', '');
INSERT INTO `xcx_access_token` VALUES ('108', '9_40rNS7O0qNa5seXD-uz0dN4CtTF55B4wpSGpJ0Fhu7cOr-IjPnzs5C1sQO3fCOgLViEF_kYmkn3gXukyx31vHejVzdz6E6v7JaoP45xZaDthGPfVY6-kZPUT4fMb4-Yp8Lc5MBr793L-2hg1AOKjAJAESO', '1524557021', '1524549871', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6Nxk0-w0VyNLs0T2eftBmLzfs6rCTdQT5ZQXGxfNoKSMKrQ');
INSERT INTO `xcx_access_token` VALUES ('109', '9_TiFKNfksezAnfmIx-XAKXhkKAqaknhPnYmShDxg-V1nc95MZYwdTwzJtKj1KtGFnP0HqESFhZwvyTgk1cpkUaB84VTCBXwsZhJIjRTElY1JrVCLB_ZxH_pTwKW3padff9KlMH2yi3GVeidcvLOCeAHAADR', '1524566184', '1524559034', '0', '');
INSERT INTO `xcx_access_token` VALUES ('110', '9_VyYM4hQIBV53c78taNAHaIxn9viV5gJqjQmdxG-DNd6a9W4AD1ya4Sr7vkLy0Ra00C0czzxlp0iDKuCstC8T86x3BU4Yh3j3bbh0G4Z13E4owYHdM3T-LDXAhUG2HCofQab_dGLSvWOyOYRrCHFiAIAMRP', '1524566442', '1524559292', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6NxnNxMUVvvLyBV7yj613sDzs33DmKItPvtCsoPhUD3L2_A');
INSERT INTO `xcx_access_token` VALUES ('111', '9_FrvTqH0dVbzjzK_SEyFiqtNPzK-pJpoHHI6PsQefPR4bA0kbpdwllH19_PB4Iwkvm-RgXhhzq8TbsgdqhSopqHTTC-t8mQAiYifWDLaFksq_mR72jq0oD9AeHHIPZ_z7iLuB-VLZvHChcGFiLCQhAJAQHV', '1524574980', '1524567830', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6NxnIdWsJ_Kl3i9hVIyFXv4bXUa1m42zjvR1IBEsHyxbadQ');
INSERT INTO `xcx_access_token` VALUES ('112', '9_HfdnIZnG7ST4TOvKVP3nO5vgzSInJ5qZ7Bf7W_MY1MIH1HWvgJbi3oixSbdroUpfys9nZ6VrEROkBJ5APcGRK_gzcX_5dKe8Wsd1X0tij0VkBs0cMdY9O-B1eBbNGXXSQMjzgVPWy_VkGbVXGMJhAEASYV', '1524596358', '1524589208', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6Nxl3rT9ophfy2_eX6IvnuYrDZwLdGeM6EnDkkuSgcvtEpg');
INSERT INTO `xcx_access_token` VALUES ('113', '9_DeqQkTb4FaxVxMebkei4rc4UyMV_GwVOdxQIUgPm1yOGR67z6AF37ddFSjd3a7uX3WSdGVA0Em9K84K2rmhcLtiQvxKvgLvPZU-uvwTHjT5PrPcUM5rc4OU4pkm7iwy44DOdDCKxBCGYhRtzWBNbABAEJV', '1524622130', '1524614980', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6NxnyrYD767LWoK3K37AMzdF5aPaxiEs1PQ5QpS8XfQa-_Q');
INSERT INTO `xcx_access_token` VALUES ('114', '9_xrS8FjC2ZeI8cTCdBYLBH0DeY7KLe27ABb9-LhqoO4GKWLpwQ35Jlo29BKQkFTZ-b4DOP877yiEPfI-nTXLBeqseBhoOddlqA_hbSfuvETpbTKPLkKjB9hXf7xju9uQMP7gFDczLg5F30HuOIGMbAHAVTZ', '1524640598', '1524633448', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6NxnS7FXy_lzURgqpfmH7fyiUcXhoYtwUZC17UiQ4nPs5uA');
INSERT INTO `xcx_access_token` VALUES ('115', '9_Ni_q5rJ_1mQgCNHjVJLxt1pJ1qYNHMPRJdjROXUnjOGZHRJI8Rh0TTw7OgBvCqDIMDPIxA1IqfYkIGon6ArmfFHYvY1mMQronjccr34FPFijBE0AQpMrRAhFT0KwofAafdXHTnaC0dvgk4GKWNNaAAASJJ', '1524650327', '1524643177', '1', '');
INSERT INTO `xcx_access_token` VALUES ('116', '9_YkPbDvDwubhptRtwfR2W0wYgUFL02YGyldMFobPUBLCgfjwQcjQtHpNsrIb6aNdGfsq0xP6rMJ5KmkSUPRjGUkv_qPgeWbz9SEtuGLGTVvk59uGW-hbXqMX0cwEKFYaADANIB', '1524658408', '1524651258', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6Nxl3tRXAcjACJ-3lKB7d7aLoK69s5YpZ0I1m41QQ4F8abg');
INSERT INTO `xcx_access_token` VALUES ('117', '9_MybI7E_nnd84UbYIm6jwkda8uxUCh-YbY_BYwuAYN-mgmXmIRjQVQ1K26pipZ8juqa6HeE8ITVTsab9ay_iCMSwrT00ojzDb-jsDZmwcUnB5166LDpeMUs81jbvq9PAutLtkkYfXOMYi2AHkWLHbADADSO', '1524665876', '1524658726', '0', '');
INSERT INTO `xcx_access_token` VALUES ('118', '9_pRypio2vkHm9YzIc1T8vUWGVjKNEUXRKQn-4ai6eRuSpEorT_nNH2JcjQtQcNhuSGwDnAueJ54lg3yQMuf4qZKF5CIOTJBwq81yieJ8xNCUoWJFP8WKF_3S-tXgGWAaADAYOS', '1524666064', '1524658914', '1', '');
INSERT INTO `xcx_access_token` VALUES ('119', '9_bkacI_v3HLolBXJt7s7-tt4eHQuEq1CTEl5bT0tqFkEE0rRpmI4haLzsL5S7HWBdVERY9lcWwflQYpCnruDrkMi3toSORw0od0nPkfh3XV6gp9RoXEWnqJu-utI6EgXPJLEv-SM564s0A4uUXRScAEARLM', '1524708937', '1524701787', '0', '');
INSERT INTO `xcx_access_token` VALUES ('120', '9_iT_CvOg4MyC-hnHipbq7n9Zo7FTBfpTqqDlS87CGn-PbxPQk0rrWXVWfPBUQIv5rI7N554WR4FtU1z03RGKyX5NbE-O9-B-5B8Qb37RY6lQ1fobzelYtRrVWN-FsQfib0FBNTu-_vSZbE8roJAKiADAARB', '1524713222', '1524706072', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6NxmrEbubOplRvTF6qrgFafE9QjlcdTlL4LNVPg_b4G34-g');
INSERT INTO `xcx_access_token` VALUES ('121', '9_vAWRD6x5cU79VAoHqpEz-gYbNYO2xerhmuYpZ7IakjCEOZfXs5T_yuJm7sCffjOPA5FKFk386CQfEMdpZ1nDd1APvHwgLkNP6bCOUadIWGwMA6-KdbVHmFy7Aom6-taDATdomDAVLzBn5QO7UYDbACAAEJ', '1524722265', '1524715115', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6Nxl8Dq8YERM4MtRVEwT1iLmcpU5RLtYGgudfGggYKp7uHg');
INSERT INTO `xcx_access_token` VALUES ('122', '9_Kj4cidNv8YL1Gbh5m9RIz-8aDaNSe1vSv3Ytt9XhTgJNDi0y3QmU8OGI0LF-2q0ImUNa0vd0omKgzqAYxFF6VZ-IBrDXB246leqWQPclNSPftx3dlxVdkxQusgSo95w-Xg9vYsdjpCPi9AjxEPBaACANYK', '1524730734', '1524723584', '0', '');
INSERT INTO `xcx_access_token` VALUES ('123', '9_u7lUHA-9BnuMXakhYX9vZU_Ipj86c5Q1DR7Fvtk4BZxrmD_Nw3ApD1gLvai7tZGyCyB5Xf-0Iz_1VtjYBtFX_KwxWj4pfwkcwOLdew_0UbPDRpRNqqBbR3Dn1k27zFnfDsMpoAwD7hW51rH2GIXgAFAXZO', '1524733249', '1524726099', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6Nxn3Ifi7G-p9F1g3DEPlbZJQA0VkymQHIDiVnjHuwYOMoQ');
INSERT INTO `xcx_access_token` VALUES ('124', '9_0XrGL8t3Ke6IFHWC28ZphxWIxeDvu9nPyvG28wIIvVzKX111O_i34x__OG6jesrBGXxIFb4iGHm1a5aAwET9GBC-TaVk_Y182f19IBUpKEBxVLLXZ23YWEqdSZQNxRgGSPChEX1ZQyMGoP41NLKbAGAIGF', '1524759607', '1524752457', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6NxnTyTZ0Oow9zynZyMXj_xNC5tpp3QxYGuhWbnweo-716w');
INSERT INTO `xcx_access_token` VALUES ('125', '9_OAiEmzk_Ee1sk3vaKsgndNPZd1S-DgMTwpP_dXxbl-0XfkLX2GcpoavK7Eo7aL6LMW2zGdRJ_Ug2BqdXcrJ-B9hEsRoLmKwqlzlppXDrVXYxmao3eXlKzzOTnc0WIGSiT8cxLV_VrMn9LWjrWUQbAEASQM', '1524833184', '1524826034', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6NxnOYjZWx3ZMA6m09iGGU8-jKAy8e_QOy9z4qQSYnsU_cg');
INSERT INTO `xcx_access_token` VALUES ('126', '9_fogejc_wjKf9pxRqrS4wQNWzKSXn5wWk_iiiM0fV5uArYmWl4jc_0bnT2u-j2B_rv-L7aGC2ZRixYhazN2ZSK70hOvssSn3Ju12pAMcWyjIV8Ti054WmTnj_azEd7ryfmfSmpqDilp4_sH2xHPRfADAMUW', '1524836744', '1524829594', '0', '');
INSERT INTO `xcx_access_token` VALUES ('127', '9_wQfYSD-tckFePj7qm2smWGGaf7lyv3NCdV2rbyn5yLrTMkxY_Q6ZNpxfRx83uWNNFO5-v2Hz2Y3bshdqAJZZOUuOHUeMQnUixgUOJE2MhXMA5ZDW2LJ39mhUYYVR72mHaLwpRH7yESqtUAYnXUQhADASPL', '1524840524', '1524833374', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6Nxkdfei--mqQ4THJ1POxIcaISXJnc3_lk9HwCamVqMfxrA');
INSERT INTO `xcx_access_token` VALUES ('128', '9_bT4AT-7TqSwUaRq2Ag7tyq79ROjhMI1DE5uK_at6OE2RiuO14dLQ2LtUHqQV-Sk9yafBwqTt9qOdmL2Ywdf6L5UeCAcFTeowRPgl-UWZvqmtF-KQlvuIEiZ-E-4pvayR1E2yRsNJpIuinTluARQeAGAOFE', '1524879301', '1524872151', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6NxkObwg1q-ax9xRySrGw6zTIDeXF6zcucYGDb2H3qnEX7Q');
INSERT INTO `xcx_access_token` VALUES ('129', '9_TH2drbAka6E8hG8xpmw6-l4NtsQZxzb2JuntAWiDoe3IjIN-hamI7SSQTrmXwR7m8kMA7YZDVGfhhvpHz-nB3zeQG8V-Iug8aQ5ObzKJwNDyxb8if1O0SFBxZ_ARtiLUeVe9l0wm4Kv-QJmoKMGdAGAGIC', '1524896728', '1524889578', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6NxntOfWd8hXIdyukT_NvEpGdm4nt6N3OrPvj4G50IRmYbg');
INSERT INTO `xcx_access_token` VALUES ('130', '9_9SJYkp10-FTFlubIBY6lT91GRjHz5NbsXSCwYRA-D7lnBi0R4ufBKeTXk080FtyHhH1OCdeYV4cZL3WWHpcEcRL7hW4--fuUPpNTvmkKMJF_GLIASI2Y_ENRUVQNTrJRPMHqWyBXPIPHXg-VYQCeAFAEWI', '1524926583', '1524919433', '1', '');
INSERT INTO `xcx_access_token` VALUES ('131', '9_UiBPuJdUCNZqQAEaM7ZcgNZPUwE1l_yQPuPdp1udBH7gJf-nkckAonHRYU7cUc58W9nkvfPZcud1XjAKYQRVJVTEOKMdZhvdVHL7d50VMGMvrBUvtpvsV_koIjYgMqteg6iKL71WijjINxcQOPDeAAACDR', '1524977571', '1524970421', '0', '');
INSERT INTO `xcx_access_token` VALUES ('132', '9_-3Y3MT83d1VO6aJXLu1gL1-hy1Pp6bzP3G2QZQtckaAJjeZIKagJncdZmhpJPQR7AqyGoOCBuY04xC9383D6aLo9270fqZyE6X8j0P3C7m3kjSxxzK_ltZqD31IRbjTwta1jkLceuPiv_g5tRPZgAHACAK', '1524978343', '1524971193', '1', '');
INSERT INTO `xcx_access_token` VALUES ('133', '9_OgfLXOzgkisKuILBeePfXEGKtp-5X5uQxr2CrZfxTLUT9nNPKKataSJs_DguFPApeYx2W5lQM7hQaHtciuOH03c3BiMoWzH4EbyEQXyJYAf8TJ2r-r-aZxc94Gj_kRj4oHKGLXfNNVGDUxDnGBRiACAUPF', '1525024412', '1525017262', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6NxmF0TaOVwa-6DMvcIu0TeK7EjLnFoX4ibuZs3R18bs7GQ');
INSERT INTO `xcx_access_token` VALUES ('134', '9_WSHptJSvRyn0kJSMBY6lT91GRjHz5NbsXSCwYV0bqKBnMbM7HId2yp9PPBn4gqm6mh5Xs6RIgomFZc1n-OSLqrEhp7_cr2GO8EaWawWGfbbr2mGdJzf53kKsODGzsBjthss3SuxVRqv4X6ybGBHeADAQLR', '1525073228', '1525066078', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6Nxlx-1Rze0HLpXY5c2g2YJX6ma2ce1cQDMLGUHLca58kog');
INSERT INTO `xcx_access_token` VALUES ('135', '9_vAP2yTcPCAfs7qNeVP3nO5vgzSInJ5qZ7Bf7W--nVQgR6kX90OWSPcrQN36a3vFVLqUPZaBWYrWtBbV5nrnQZfUw1KcZXsl0m_zMM88LIJ4SofCKrD4oIG6jnl8QJLdAIADWY', '1525141007', '1525133857', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6NxlcFYQYrEWRj3fjnSbOI7OZlPNtkpXM6kx46e-FjCyGNA');
INSERT INTO `xcx_access_token` VALUES ('136', '9_i6saPqqTyBqQkav2VtyBFiuiVz7ka6SLcuiigNe8HHugj9oCha6rzyl8yS-LOd5JB1mPwKBv4JKE2vpBbleC7LfhRYaOuZ5Sga6JCFU8CfrBYZZZ8Qrf4N4OWh7JWypcP4GT7nHct5oK7LpyYFFbABAJQQ', '1525174301', '1525167151', '1', 'kgt8ON7yVITDhtdwci0qebnTNqcL6Z_c0LxWE2Q6NxktsQZVK2HbYcxjoo14zCWjDAeiUw02f6nGN5mWdcb0kA');

-- ----------------------------
-- Table structure for xcx_action
-- ----------------------------
DROP TABLE IF EXISTS `xcx_action`;
CREATE TABLE `xcx_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of xcx_action
-- ----------------------------
INSERT INTO `xcx_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', '1', '1', '1387181220');
INSERT INTO `xcx_action` VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', '2', '0', '1380173180');
INSERT INTO `xcx_action` VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', '2', '1', '1383285646');
INSERT INTO `xcx_action` VALUES ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', '2', '0', '1386139726');
INSERT INTO `xcx_action` VALUES ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', '2', '0', '1383285551');
INSERT INTO `xcx_action` VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1383294988');
INSERT INTO `xcx_action` VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '1', '1383295057');
INSERT INTO `xcx_action` VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1383295963');
INSERT INTO `xcx_action` VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1383296301');
INSERT INTO `xcx_action` VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1383296392');
INSERT INTO `xcx_action` VALUES ('11', 'update_category', '更新分类', '新增或修改或删除分类', '', '', '1', '1', '1383296765');

-- ----------------------------
-- Table structure for xcx_action_log
-- ----------------------------
DROP TABLE IF EXISTS `xcx_action_log`;
CREATE TABLE `xcx_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of xcx_action_log
-- ----------------------------
INSERT INTO `xcx_action_log` VALUES ('1', '1', '1', '2130706433', 'member', '1', 'qiaoyuok在2018-03-22 15:45登录了后台', '1', '1521704750');
INSERT INTO `xcx_action_log` VALUES ('2', '1', '1', '2130706433', 'member', '1', 'qiaoyuok在2018-03-23 11:29登录了后台', '1', '1521775774');
INSERT INTO `xcx_action_log` VALUES ('3', '1', '1', '2130706433', 'member', '1', 'qiaoyuok在2018-03-23 11:36登录了后台', '1', '1521776209');
INSERT INTO `xcx_action_log` VALUES ('4', '10', '1', '2130706433', 'Menu', '122', '操作url：/index.php?s=/admin/menu/add.html', '1', '1521777263');
INSERT INTO `xcx_action_log` VALUES ('5', '10', '1', '2130706433', 'Menu', '16', '操作url：/index.php?s=/admin/menu/edit.html', '1', '1521777275');
INSERT INTO `xcx_action_log` VALUES ('6', '1', '1', '1018200451', 'member', '1', 'qiaoyuok在2018-04-09 16:11登录了后台', '1', '1523261480');
INSERT INTO `xcx_action_log` VALUES ('7', '1', '1', '1018200372', 'member', '1', 'qiaoyuok在2018-04-11 11:17登录了后台', '1', '1523416647');
INSERT INTO `xcx_action_log` VALUES ('8', '1', '1', '1018200372', 'member', '1', 'qiaoyuok在2018-04-11 14:49登录了后台', '1', '1523429358');
INSERT INTO `xcx_action_log` VALUES ('9', '10', '1', '1018200372', 'Menu', '68', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1523429437');
INSERT INTO `xcx_action_log` VALUES ('10', '1', '1', '1903073627', 'member', '1', 'qiaoyuok在2018-04-11 21:13登录了后台', '1', '1523452383');
INSERT INTO `xcx_action_log` VALUES ('11', '1', '1', '2105098274', 'member', '1', 'qiaoyuok在2018-04-25 14:46登录了后台', '1', '1524638782');
INSERT INTO `xcx_action_log` VALUES ('12', '10', '1', '2105098274', 'Menu', '127', '操作url：/index.php?s=/Admin/Menu/add.html', '1', '1524639737');
INSERT INTO `xcx_action_log` VALUES ('13', '10', '1', '2105098274', 'Menu', '127', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1524640004');
INSERT INTO `xcx_action_log` VALUES ('14', '1', '1', '1018200150', 'member', '1', 'qiaoyuok在2018-04-26 17:29登录了后台', '1', '1524734944');
INSERT INTO `xcx_action_log` VALUES ('15', '1', '1', '1018200150', 'member', '1', 'qiaoyuok在2018-04-27 14:59登录了后台', '1', '1524812359');
INSERT INTO `xcx_action_log` VALUES ('16', '1', '1', '1018200150', 'member', '1', 'qiaoyuok在2018-04-27 15:17登录了后台', '1', '1524813436');
INSERT INTO `xcx_action_log` VALUES ('17', '1', '1', '1018200150', 'member', '1', 'qiaoyuok在2018-04-27 15:26登录了后台', '1', '1524813960');
INSERT INTO `xcx_action_log` VALUES ('18', '1', '1', '2004591823', 'member', '1', 'qiaoyuok在2018-04-27 17:08登录了后台', '1', '1524820087');
INSERT INTO `xcx_action_log` VALUES ('19', '1', '1', '1018200150', 'member', '1', 'qiaoyuok在2018-04-27 17:20登录了后台', '1', '1524820810');
INSERT INTO `xcx_action_log` VALUES ('20', '1', '1', '1018200150', 'member', '1', 'qiaoyuok在2018-04-27 17:46登录了后台', '1', '1524822407');
INSERT INTO `xcx_action_log` VALUES ('21', '1', '1', '1018200150', 'member', '1', 'qiaoyuok在2018-04-27 18:40登录了后台', '1', '1524825612');
INSERT INTO `xcx_action_log` VALUES ('22', '1', '1', '1018200150', 'member', '1', 'qiaoyuok在2018-04-27 18:54登录了后台', '1', '1524826468');
INSERT INTO `xcx_action_log` VALUES ('23', '1', '1', '1879768204', 'member', '1', 'qiaoyuok在2018-04-27 19:30登录了后台', '1', '1524828649');
INSERT INTO `xcx_action_log` VALUES ('24', '1', '1', '1018200150', 'member', '1', 'qiaoyuok在2018-04-27 22:18登录了后台', '1', '1524838710');
INSERT INTO `xcx_action_log` VALUES ('25', '1', '1', '1018200150', 'member', '1', 'qiaoyuok在2018-04-28 09:29登录了后台', '1', '1524878946');
INSERT INTO `xcx_action_log` VALUES ('26', '1', '1', '1018200150', 'member', '1', 'qiaoyuok在2018-04-28 11:59登录了后台', '1', '1524887986');
INSERT INTO `xcx_action_log` VALUES ('27', '1', '1', '-1223857659', 'member', '1', 'qiaoyuok在2018-04-28 12:18登录了后台', '1', '1524889092');
INSERT INTO `xcx_action_log` VALUES ('28', '1', '1', '605028956', 'member', '1', 'qiaoyuok在2018-04-28 15:57登录了后台', '1', '1524902239');
INSERT INTO `xcx_action_log` VALUES ('29', '1', '1', '-899308290', 'member', '1', 'qiaoyuok在2018-04-28 16:03登录了后台', '1', '1524902637');
INSERT INTO `xcx_action_log` VALUES ('30', '1', '1', '1942541639', 'member', '1', 'qiaoyuok在2018-04-28 18:38登录了后台', '1', '1524911913');
INSERT INTO `xcx_action_log` VALUES ('31', '1', '2', '1942541639', 'member', '2', 'wahaha在2018-04-28 18:41登录了后台', '1', '1524912102');
INSERT INTO `xcx_action_log` VALUES ('32', '1', '1', '1942541639', 'member', '1', 'qiaoyuok在2018-04-28 18:42登录了后台', '1', '1524912175');
INSERT INTO `xcx_action_log` VALUES ('33', '1', '2', '1942541639', 'member', '2', 'wahaha在2018-04-28 18:45登录了后台', '1', '1524912309');
INSERT INTO `xcx_action_log` VALUES ('34', '1', '2', '1942541639', 'member', '2', 'wahaha在2018-04-28 18:49登录了后台', '1', '1524912583');
INSERT INTO `xcx_action_log` VALUES ('35', '1', '1', '1879768204', 'member', '1', 'qiaoyuok在2018-04-29 11:13登录了后台', '1', '1524971608');
INSERT INTO `xcx_action_log` VALUES ('36', '1', '3', '1879768204', 'member', '3', 'Marvin1在2018-04-29 11:15登录了后台', '1', '1524971733');
INSERT INTO `xcx_action_log` VALUES ('37', '1', '3', '1901642796', 'member', '3', 'Marvin1在2018-04-29 11:16登录了后台', '1', '1524971789');
INSERT INTO `xcx_action_log` VALUES ('38', '1', '1', '1879768204', 'member', '1', 'qiaoyuok在2018-04-29 11:26登录了后台', '1', '1524972419');

-- ----------------------------
-- Table structure for xcx_addons
-- ----------------------------
DROP TABLE IF EXISTS `xcx_addons`;
CREATE TABLE `xcx_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of xcx_addons
-- ----------------------------
INSERT INTO `xcx_addons` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0');
INSERT INTO `xcx_addons` VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}', 'thinkphp', '0.1', '1379512015', '0');
INSERT INTO `xcx_addons` VALUES ('3', 'DevTeam', '开发团队信息', '开发团队成员信息', '1', '{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512022', '0');
INSERT INTO `xcx_addons` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0');
INSERT INTO `xcx_addons` VALUES ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1379830910', '0');
INSERT INTO `xcx_addons` VALUES ('6', 'Attachment', '附件', '用于文档模型上传附件', '1', 'null', 'thinkphp', '0.1', '1379842319', '1');
INSERT INTO `xcx_addons` VALUES ('9', 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '1', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_data_list_duoshuo\":\"\"}', 'thinkphp', '0.1', '1380273962', '0');

-- ----------------------------
-- Table structure for xcx_attachment
-- ----------------------------
DROP TABLE IF EXISTS `xcx_attachment`;
CREATE TABLE `xcx_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of xcx_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for xcx_attribute
-- ----------------------------
DROP TABLE IF EXISTS `xcx_attribute`;
CREATE TABLE `xcx_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- ----------------------------
-- Records of xcx_attribute
-- ----------------------------
INSERT INTO `xcx_attribute` VALUES ('1', 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1384508362', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xcx_attribute` VALUES ('2', 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', '1', '', '1', '0', '1', '1383894743', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xcx_attribute` VALUES ('3', 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', '1', '', '1', '0', '1', '1383894778', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xcx_attribute` VALUES ('4', 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', '0', '', '1', '0', '1', '1384508336', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xcx_attribute` VALUES ('5', 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', '1', '', '1', '0', '1', '1383894927', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xcx_attribute` VALUES ('6', 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', '0', '', '1', '0', '1', '1384508323', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xcx_attribute` VALUES ('7', 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', '0', '', '1', '0', '1', '1384508543', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xcx_attribute` VALUES ('8', 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', '0', '', '1', '0', '1', '1384508350', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xcx_attribute` VALUES ('9', 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', '1', '1:目录\r\n2:主题\r\n3:段落', '1', '0', '1', '1384511157', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xcx_attribute` VALUES ('10', 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', '1', '1:列表推荐\r\n2:频道页推荐\r\n4:首页推荐', '1', '0', '1', '1383895640', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xcx_attribute` VALUES ('11', 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', '1', '', '1', '0', '1', '1383895757', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xcx_attribute` VALUES ('12', 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', '1', '', '1', '0', '1', '1384147827', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xcx_attribute` VALUES ('13', 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', '1', '0:不可见\r\n1:所有人可见', '1', '0', '1', '1386662271', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `xcx_attribute` VALUES ('14', 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', '1', '', '1', '0', '1', '1387163248', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `xcx_attribute` VALUES ('15', 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1387260355', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `xcx_attribute` VALUES ('16', 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895835', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xcx_attribute` VALUES ('17', 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895846', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xcx_attribute` VALUES ('18', 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', '0', '', '1', '0', '1', '1384508264', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xcx_attribute` VALUES ('19', 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', '1', '', '1', '0', '1', '1383895894', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xcx_attribute` VALUES ('20', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '1', '0', '1', '1383895903', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xcx_attribute` VALUES ('21', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '0', '', '1', '0', '1', '1384508277', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xcx_attribute` VALUES ('22', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', '1', '0', '1', '1384508496', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `xcx_attribute` VALUES ('23', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '2', '0', '1', '1384511049', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `xcx_attribute` VALUES ('24', 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', '1', '', '2', '0', '1', '1383896225', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `xcx_attribute` VALUES ('25', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', '1', '', '2', '0', '1', '1383896190', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `xcx_attribute` VALUES ('26', 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '2', '0', '1', '1383896103', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `xcx_attribute` VALUES ('27', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '3', '0', '1', '1387260461', '1383891252', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `xcx_attribute` VALUES ('28', 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', '1', '', '3', '0', '1', '1383896438', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `xcx_attribute` VALUES ('29', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '3', '0', '1', '1383896429', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `xcx_attribute` VALUES ('30', 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', '1', '', '3', '0', '1', '1383896415', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `xcx_attribute` VALUES ('31', 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '3', '0', '1', '1383896380', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `xcx_attribute` VALUES ('32', 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', '1', '', '3', '0', '1', '1383896371', '1383891252', '', '0', '', '', '', '0', '');

-- ----------------------------
-- Table structure for xcx_auth_extend
-- ----------------------------
DROP TABLE IF EXISTS `xcx_auth_extend`;
CREATE TABLE `xcx_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
-- Records of xcx_auth_extend
-- ----------------------------
INSERT INTO `xcx_auth_extend` VALUES ('1', '1', '1');
INSERT INTO `xcx_auth_extend` VALUES ('1', '1', '2');
INSERT INTO `xcx_auth_extend` VALUES ('1', '2', '1');
INSERT INTO `xcx_auth_extend` VALUES ('1', '2', '2');
INSERT INTO `xcx_auth_extend` VALUES ('1', '3', '1');
INSERT INTO `xcx_auth_extend` VALUES ('1', '3', '2');
INSERT INTO `xcx_auth_extend` VALUES ('1', '4', '1');
INSERT INTO `xcx_auth_extend` VALUES ('1', '37', '1');

-- ----------------------------
-- Table structure for xcx_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `xcx_auth_group`;
CREATE TABLE `xcx_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xcx_auth_group
-- ----------------------------
INSERT INTO `xcx_auth_group` VALUES ('1', 'admin', '1', '默认用户组', '', '1', '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106');
INSERT INTO `xcx_auth_group` VALUES ('2', 'admin', '1', '测试用户', '测试用户', '1', '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');
INSERT INTO `xcx_auth_group` VALUES ('3', 'admin', '1', '管理员组', '后台添加的管理员，拥有所有权限', '1', '1,3,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,88,94,95,107,108,109,110,217,218,219,220,221,222,223');

-- ----------------------------
-- Table structure for xcx_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `xcx_auth_group_access`;
CREATE TABLE `xcx_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xcx_auth_group_access
-- ----------------------------
INSERT INTO `xcx_auth_group_access` VALUES ('2', '3');
INSERT INTO `xcx_auth_group_access` VALUES ('3', '3');

-- ----------------------------
-- Table structure for xcx_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `xcx_auth_rule`;
CREATE TABLE `xcx_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=224 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xcx_auth_rule
-- ----------------------------
INSERT INTO `xcx_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/mydocument', '内容', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('5', 'admin', '2', 'Admin/Config/group', '系统', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('17', 'admin', '1', 'Admin/article/index', '文档列表', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('26', 'admin', '1', 'Admin/User/index', '管理员', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '权限管理', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('74', 'admin', '1', 'Admin/Category/index', '分类管理', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('195', 'admin', '2', 'Admin/other', '其他', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `xcx_auth_rule` VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('217', 'admin', '1', 'Admin/Device/index', '设备管理', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('218', 'admin', '1', 'Admin/Device/map', '设备地图', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('219', 'admin', '1', 'Admin/Background/index', '背景图', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('220', 'admin', '1', 'Admin/Device/scene', '模式时间', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('221', 'admin', '1', 'Admin/User/user', '普通用户', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('222', 'admin', '2', 'Admin/Device/index', '设备', '1', '');
INSERT INTO `xcx_auth_rule` VALUES ('223', 'admin', '2', 'Admin/Background/index', '背景图', '1', '');

-- ----------------------------
-- Table structure for xcx_base_device
-- ----------------------------
DROP TABLE IF EXISTS `xcx_base_device`;
CREATE TABLE `xcx_base_device` (
  `device_id` varchar(255) NOT NULL DEFAULT '' COMMENT '微信端的设备ID',
  `device_token` varchar(32) NOT NULL DEFAULT '' COMMENT '设备对应的二维码标志位',
  `create_time` varchar(11) NOT NULL DEFAULT '' COMMENT '设备添加时间',
  `scene` tinyint(1) NOT NULL DEFAULT '0' COMMENT '设备场景模式，默认0,1：家庭模式，2：办公室，3：公共场所；4：自定义',
  `last_line` varchar(11) NOT NULL DEFAULT '' COMMENT '设备上次在线时间',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT '设备ip地址',
  `update_time` varchar(11) NOT NULL DEFAULT '' COMMENT '设备上次配网时间',
  `unionid` varchar(50) NOT NULL DEFAULT '' COMMENT '联合id号',
  UNIQUE KEY `设备id号` (`device_id`) USING HASH
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xcx_base_device
-- ----------------------------
INSERT INTO `xcx_base_device` VALUES ('DC4F22C2F34C', 'k6B7O', '1523513929', '0', '', '60.176.128.86', '1524554342', 'oujWavxdQEx44mv551oDCrFvvzuk');
INSERT INTO `xcx_base_device` VALUES ('600194A2A957', 'TnluZ', '1523605634', '1', '1524044882', '62.176.128.87', '1524122382', 'oujWav2ojedpBCjpIdi25V6LAhUs');
INSERT INTO `xcx_base_device` VALUES ('600194A2A8B3', '', '1523605722', '4', '', '111.8.191.146', '1524728410', 'oujWav2ojedpBCjpIdi25V6LAhUs');
INSERT INTO `xcx_base_device` VALUES ('DC4F22C2F3EC', 'jkVUA', '', '1', '', '88.255.201.129', '1524701871', 'oujWav09Stcn37dunQVqvSbXW8RM');
INSERT INTO `xcx_base_device` VALUES ('DC4F22C2F34B', '79n4y', '1524194191', '3', '', '113.88.196.125', '1524973123', 'oujWavxp_TxSsZ_6Ot6hftpVQrts');
INSERT INTO `xcx_base_device` VALUES ('DC4F22C2F3EB', 'qeBdt', '1524299070', '2', '', '113.195.3.250', '1524614285', 'oujWav9TNDvX1qIyEZWBkniCR7hU');
INSERT INTO `xcx_base_device` VALUES ('600194A2A958', '', '1524656704', '3', '', '114.247.50.2', '1524727348', 'oujWav2ojedpBCjpIdi25V6LAhUs');
INSERT INTO `xcx_base_device` VALUES ('600194A2A8B6', 'tRFja', '1524829308', '3', '', '113.88.196.44', '1524972684', 'oujWavxp_TxSsZ_6Ot6hftpVQrts');

-- ----------------------------
-- Table structure for xcx_bg_pic
-- ----------------------------
DROP TABLE IF EXISTS `xcx_bg_pic`;
CREATE TABLE `xcx_bg_pic` (
  `id` int(10) unsigned NOT NULL,
  `bg_filename` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xcx_bg_pic
-- ----------------------------
INSERT INTO `xcx_bg_pic` VALUES ('0', '5ae025f77a554.png');

-- ----------------------------
-- Table structure for xcx_category
-- ----------------------------
DROP TABLE IF EXISTS `xcx_category`;
CREATE TABLE `xcx_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '关联模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of xcx_category
-- ----------------------------
INSERT INTO `xcx_category` VALUES ('1', 'blog', '博客', '0', '0', '10', '', '', '', '', '', '', '', '2', '2,1', '0', '0', '1', '0', '0', '1', '', '1379474947', '1382701539', '1', '0');
INSERT INTO `xcx_category` VALUES ('2', 'default_blog', '默认分类', '1', '1', '10', '', '', '', '', '', '', '', '2', '2,1,3', '0', '1', '1', '0', '1', '1', '', '1379475028', '1386839751', '1', '31');

-- ----------------------------
-- Table structure for xcx_channel
-- ----------------------------
DROP TABLE IF EXISTS `xcx_channel`;
CREATE TABLE `xcx_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xcx_channel
-- ----------------------------
INSERT INTO `xcx_channel` VALUES ('1', '0', '首页', 'Index/index', '1', '1379475111', '1379923177', '1', '0');
INSERT INTO `xcx_channel` VALUES ('2', '0', '博客', 'Article/index?category=blog', '2', '1379475131', '1379483713', '1', '0');
INSERT INTO `xcx_channel` VALUES ('3', '0', '官网', 'http://www.onethink.cn', '3', '1379475154', '1387163458', '1', '0');

-- ----------------------------
-- Table structure for xcx_config
-- ----------------------------
DROP TABLE IF EXISTS `xcx_config`;
CREATE TABLE `xcx_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xcx_config
-- ----------------------------
INSERT INTO `xcx_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1379235274', '1', 'OneThink内容管理框架', '0');
INSERT INTO `xcx_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', 'OneThink内容管理框架', '1');
INSERT INTO `xcx_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', 'ThinkPHP,OneThink', '8');
INSERT INTO `xcx_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '1');
INSERT INTO `xcx_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '2');
INSERT INTO `xcx_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '', '9');
INSERT INTO `xcx_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', '3');
INSERT INTO `xcx_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '4');
INSERT INTO `xcx_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', '1379122533', '1379235904', '1', 'default_color', '10');
INSERT INTO `xcx_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', '4');
INSERT INTO `xcx_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6');
INSERT INTO `xcx_config` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '8');
INSERT INTO `xcx_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '1');
INSERT INTO `xcx_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2');
INSERT INTO `xcx_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '10', '10');
INSERT INTO `xcx_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '3');
INSERT INTO `xcx_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3');
INSERT INTO `xcx_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `xcx_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `xcx_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9');
INSERT INTO `xcx_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `xcx_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '11');
INSERT INTO `xcx_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', '0');
INSERT INTO `xcx_config` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '0');
INSERT INTO `xcx_config` VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1387178083', '1', '10', '0');
INSERT INTO `xcx_config` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '12');
INSERT INTO `xcx_config` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '0', '1');

-- ----------------------------
-- Table structure for xcx_device
-- ----------------------------
DROP TABLE IF EXISTS `xcx_device`;
CREATE TABLE `xcx_device` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` varchar(255) NOT NULL DEFAULT '' COMMENT '设备ID号',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '设备对应的用户ID号',
  `device_name` varchar(255) NOT NULL DEFAULT '' COMMENT '设备名称',
  `create_time` varchar(11) NOT NULL DEFAULT '' COMMENT '添加时间',
  `update_time` varchar(11) NOT NULL DEFAULT '' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `owner` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是该设备的主人；默认0：不是；1：是',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=289102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xcx_device
-- ----------------------------
INSERT INTO `xcx_device` VALUES ('289096', '600194A2A957', '52', '新加设备', '1524887994', '', '0', '0');
INSERT INTO `xcx_device` VALUES ('289097', 'DC4F22C2F3EB', '55', '新加设备', '1524909104', '', '0', '0');
INSERT INTO `xcx_device` VALUES ('289083', 'DC4F22C2F3EB', '53', '新加设备', '1524823366', '', '0', '1');
INSERT INTO `xcx_device` VALUES ('289079', 'DC4F22C2F34C', '5', '新加设备', '1524815124', '', '0', '0');
INSERT INTO `xcx_device` VALUES ('289076', '600194A2A958', '48', '黑色', '1524727348', '1524727411', '0', '1');
INSERT INTO `xcx_device` VALUES ('289100', 'DC4F22C2F34B', '65', '新加设备', '1524973123', '', '0', '1');
INSERT INTO `xcx_device` VALUES ('289075', '600194A2A8B3', '48', '金色', '1524726565', '1524727400', '0', '1');

-- ----------------------------
-- Table structure for xcx_document
-- ----------------------------
DROP TABLE IF EXISTS `xcx_document`;
CREATE TABLE `xcx_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- ----------------------------
-- Records of xcx_document
-- ----------------------------
INSERT INTO `xcx_document` VALUES ('1', '1', '', 'OneThink1.0正式版发布', '2', '大家期待的OneThink正式版发布', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '8', '0', '0', '0', '1387260660', '1387263112', '1');

-- ----------------------------
-- Table structure for xcx_document_article
-- ----------------------------
DROP TABLE IF EXISTS `xcx_document_article`;
CREATE TABLE `xcx_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- ----------------------------
-- Records of xcx_document_article
-- ----------------------------
INSERT INTO `xcx_document_article` VALUES ('1', '0', '<h1>\r\n	OneThink1.0正式版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href=\"http://www.onethink.cn/download.html\" target=\"_blank\">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href=\"http://document.onethink.cn/\" target=\"_blank\">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013</strong> \r\n</p>', '', '0');

-- ----------------------------
-- Table structure for xcx_document_download
-- ----------------------------
DROP TABLE IF EXISTS `xcx_document_download`;
CREATE TABLE `xcx_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- ----------------------------
-- Records of xcx_document_download
-- ----------------------------

-- ----------------------------
-- Table structure for xcx_file
-- ----------------------------
DROP TABLE IF EXISTS `xcx_file`;
CREATE TABLE `xcx_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of xcx_file
-- ----------------------------

-- ----------------------------
-- Table structure for xcx_forget_token
-- ----------------------------
DROP TABLE IF EXISTS `xcx_forget_token`;
CREATE TABLE `xcx_forget_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `token` varchar(255) NOT NULL DEFAULT '',
  `create_time` varchar(11) NOT NULL DEFAULT '',
  `is_use` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xcx_forget_token
-- ----------------------------
INSERT INTO `xcx_forget_token` VALUES ('83', '2', '56apaYmaOF2eLvHG', '1524912375', '1');
INSERT INTO `xcx_forget_token` VALUES ('84', '1', '2kw0PSyWgLhhkyqp', '1524971520', '1');
INSERT INTO `xcx_forget_token` VALUES ('85', '1', 'SP5eK5vMdyHfv4Eg', '1524971944', '0');

-- ----------------------------
-- Table structure for xcx_hooks
-- ----------------------------
DROP TABLE IF EXISTS `xcx_hooks`;
CREATE TABLE `xcx_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xcx_hooks
-- ----------------------------
INSERT INTO `xcx_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', '');
INSERT INTO `xcx_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'ReturnTop');
INSERT INTO `xcx_hooks` VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', 'Attachment');
INSERT INTO `xcx_hooks` VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'Attachment,SocialComment');
INSERT INTO `xcx_hooks` VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '');
INSERT INTO `xcx_hooks` VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', 'Attachment');
INSERT INTO `xcx_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', 'Editor');
INSERT INTO `xcx_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin');
INSERT INTO `xcx_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SystemInfo,DevTeam');
INSERT INTO `xcx_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', 'Editor');
INSERT INTO `xcx_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', '');

-- ----------------------------
-- Table structure for xcx_login_log
-- ----------------------------
DROP TABLE IF EXISTS `xcx_login_log`;
CREATE TABLE `xcx_login_log` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `token` varchar(255) NOT NULL DEFAULT '' COMMENT '用户登录态校验码',
  `create_time` varchar(11) NOT NULL COMMENT '记录用户首次登录时间',
  `update_time` varchar(11) NOT NULL COMMENT '记录用户上次登录时间',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xcx_login_log
-- ----------------------------
INSERT INTO `xcx_login_log` VALUES ('1', 'd22dca8c16e83791c9f1002f8cb93ed6', '1522231919', '1523245566');
INSERT INTO `xcx_login_log` VALUES ('15', '38185b1bb28b9c1b3916c0ddc2243e8f', '1522232374', '');
INSERT INTO `xcx_login_log` VALUES ('16', '52a6b5881928382a19cf0887351ffab9', '1522286135', '');
INSERT INTO `xcx_login_log` VALUES ('17', 'e2ed020c11186cf033252d54b9ff676d', '1522288574', '1523354352');
INSERT INTO `xcx_login_log` VALUES ('18', 'e4f567396fd64afb35f97648cca1ce63', '1522319916', '1522825023');
INSERT INTO `xcx_login_log` VALUES ('19', 'c81418c2e48eb19d6757f1bdbdbc41ce', '1522382998', '1522848945');
INSERT INTO `xcx_login_log` VALUES ('20', '08fb95aa605f8fe16cad57634c994d0a', '1522397507', '');
INSERT INTO `xcx_login_log` VALUES ('21', '4097d1ab2520243ea38635ff2c92cb1c', '1522554208', '');
INSERT INTO `xcx_login_log` VALUES ('22', '6a60301f31bdc75e8f86a9997c3d6b6d', '1522602175', '');
INSERT INTO `xcx_login_log` VALUES ('23', 'b7bfa402caa6871eddd11e22ba0d77a9', '1523178037', '');
INSERT INTO `xcx_login_log` VALUES ('24', '99e809409dcb53eccfb2025e2c6ab2a2', '1523178038', '');
INSERT INTO `xcx_login_log` VALUES ('25', 'c15831633ec18b99e8a4a5940d533ba1', '1523178040', '');
INSERT INTO `xcx_login_log` VALUES ('26', 'c15831633ec18b99e8a4a5940d533ba1', '1523178040', '');
INSERT INTO `xcx_login_log` VALUES ('27', '66510417a2bfd6534c37bf60c7d3852a', '1523178043', '');
INSERT INTO `xcx_login_log` VALUES ('28', '3ea06fb2d7f1447184891486dd1d5983', '1523245583', '');
INSERT INTO `xcx_login_log` VALUES ('29', '1b2a21a6a2592268e43f27bc5a33aba4', '1523268775', '1523416884');
INSERT INTO `xcx_login_log` VALUES ('30', '4171ea970ad1a52eb065d4a4d0df5de8', '1523503818', '');
INSERT INTO `xcx_login_log` VALUES ('31', '1b58409416bf3627a481b395a60f19b0', '1523505083', '');
INSERT INTO `xcx_login_log` VALUES ('32', '10f42e19a8cee8ecb62c4a145e5304e5', '1523512633', '1523512888');
INSERT INTO `xcx_login_log` VALUES ('34', '939043e8d7f50fb03185c009c608e710', '1523513683', '');
INSERT INTO `xcx_login_log` VALUES ('35', '5618979d01bf887e80e7b2a3d87384f5', '1523513847', '1524448093');
INSERT INTO `xcx_login_log` VALUES ('36', '3073e32088488d879c70b47d9c53c38d', '1523587096', '');
INSERT INTO `xcx_login_log` VALUES ('37', 'b250e68830faa9e35e6faafe876f939c', '1523587176', '');
INSERT INTO `xcx_login_log` VALUES ('38', 'd92846b08a6df4bcd6d272e116e6b5d8', '1523587303', '1525066074');
INSERT INTO `xcx_login_log` VALUES ('39', '09827334e6486eb8b001c67fa57d1ca0', '1523606874', '1524830882');
INSERT INTO `xcx_login_log` VALUES ('40', 'f5ddc40cca1a30d863ea650ab2d80aff', '1523695003', '1523698299');
INSERT INTO `xcx_login_log` VALUES ('41', '01a7d5e9490e19045d758d6dafd9765d', '1524043672', '');
INSERT INTO `xcx_login_log` VALUES ('42', '01a7d5e9490e19045d758d6dafd9765d', '1524043672', '');
INSERT INTO `xcx_login_log` VALUES ('43', '01a7d5e9490e19045d758d6dafd9765d', '1524043672', '');
INSERT INTO `xcx_login_log` VALUES ('44', '3c031644377e2d303e47354cf456e40d', '1524043676', '');
INSERT INTO `xcx_login_log` VALUES ('45', 'bad569ba225354fe43e00818476e6602', '1524051086', '1524658330');
INSERT INTO `xcx_login_log` VALUES ('46', '4e90c23ad00192182912e335b64f22aa', '1524056443', '');
INSERT INTO `xcx_login_log` VALUES ('48', '88681dd15cf699b1b4d45cf537413207', '1524123747', '1524130274');
INSERT INTO `xcx_login_log` VALUES ('49', '9c15758cc693d91f6ead46c6428c1aea', '1524131720', '');
INSERT INTO `xcx_login_log` VALUES ('50', '1cb1c7c0c215cac6c429765f13762a90', '1524202984', '');
INSERT INTO `xcx_login_log` VALUES ('51', 'e91586762cf3efff1e24003c661228af', '1524448348', '');
INSERT INTO `xcx_login_log` VALUES ('52', '4a38a7ef3d3349910562c446383692d5', '1524448396', '1524912743');
INSERT INTO `xcx_login_log` VALUES ('53', '288de12d6b344e13e08c7a17dc76bafc', '1524457527', '1524504454');
INSERT INTO `xcx_login_log` VALUES ('54', '241cbaee83ae4cd739715625813672c4', '1524553601', '');
INSERT INTO `xcx_login_log` VALUES ('55', 'cc42b850227691f468f8d27ffc9adcbc', '1524557798', '');
INSERT INTO `xcx_login_log` VALUES ('56', '164637b85f593941dcbdbca1f4f972c8', '1524657294', '');
INSERT INTO `xcx_login_log` VALUES ('57', '4a420e1b932d67900090ac1f30377c12', '1524831197', '');
INSERT INTO `xcx_login_log` VALUES ('58', 'eee83510fa771a76cd648329a0552151', '1524872133', '');
INSERT INTO `xcx_login_log` VALUES ('59', '004701f284544cf20119e15ce5731e30', '1524872812', '');
INSERT INTO `xcx_login_log` VALUES ('60', 'c7350f605dcb99eefa4f9d0baaf6310a', '1524889555', '');
INSERT INTO `xcx_login_log` VALUES ('61', 'b2b8d0158bcffd64ca8c95c6d18be47a', '1524970054', '');
INSERT INTO `xcx_login_log` VALUES ('62', '4944069c39a6ffaf445678e01ae5937b', '1524970131', '');
INSERT INTO `xcx_login_log` VALUES ('63', '0a4e226fa8ef840ccb6306b14587ae78', '1524970254', '');
INSERT INTO `xcx_login_log` VALUES ('64', '7e3dfbffd48681002a4adab99c09a65f', '1524971214', '');
INSERT INTO `xcx_login_log` VALUES ('65', 'a80a81f112d306bbc96e37ee5197b8fe', '1524972735', '1524973256');
INSERT INTO `xcx_login_log` VALUES ('66', '4ffa56f5d459241371f2ee4301243ba8', '1524973599', '');
INSERT INTO `xcx_login_log` VALUES ('67', 'cb6777db6172287dc94203fa56dfa2f6', '1525164438', '');

-- ----------------------------
-- Table structure for xcx_member
-- ----------------------------
DROP TABLE IF EXISTS `xcx_member`;
CREATE TABLE `xcx_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of xcx_member
-- ----------------------------
INSERT INTO `xcx_member` VALUES ('1', 'qiao', '0', '0000-00-00', '', '50', '29', '0', '1521704725', '1879768204', '1524972419', '1');
INSERT INTO `xcx_member` VALUES ('2', 'waha', '0', '0000-00-00', '', '10', '3', '0', '0', '1942541639', '1524912583', '1');
INSERT INTO `xcx_member` VALUES ('3', 'Marvin', '0', '0000-00-00', '', '10', '2', '0', '0', '1901642796', '1524971789', '1');

-- ----------------------------
-- Table structure for xcx_menu
-- ----------------------------
DROP TABLE IF EXISTS `xcx_menu`;
CREATE TABLE `xcx_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xcx_menu
-- ----------------------------
INSERT INTO `xcx_menu` VALUES ('1', '首页', '0', '1', 'Index/index', '1', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('2', '内容', '0', '2', 'Article/mydocument', '1', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('3', '文档列表', '2', '0', 'article/index', '1', '', '内容', '0');
INSERT INTO `xcx_menu` VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('10', '复制', '3', '0', 'article/copy', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('11', '粘贴', '3', '0', 'article/paste', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('13', '回收站', '2', '0', 'article/recycle', '1', '', '内容', '0');
INSERT INTO `xcx_menu` VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('16', '用户', '0', '0', 'User/index', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('17', '普通用户', '16', '1', 'User/user', '0', '', '用户管理', '0');
INSERT INTO `xcx_menu` VALUES ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '', '0');
INSERT INTO `xcx_menu` VALUES ('19', '用户行为', '16', '0', 'User/action', '1', '', '行为管理', '0');
INSERT INTO `xcx_menu` VALUES ('20', '新增用户行为', '19', '0', 'User/addaction', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('21', '编辑用户行为', '19', '0', 'User/editaction', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0');
INSERT INTO `xcx_menu` VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0');
INSERT INTO `xcx_menu` VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0');
INSERT INTO `xcx_menu` VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0');
INSERT INTO `xcx_menu` VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0');
INSERT INTO `xcx_menu` VALUES ('27', '权限管理', '16', '0', 'AuthManager/index', '1', '', '用户管理', '0');
INSERT INTO `xcx_menu` VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0');
INSERT INTO `xcx_menu` VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0');
INSERT INTO `xcx_menu` VALUES ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '0');
INSERT INTO `xcx_menu` VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0');
INSERT INTO `xcx_menu` VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0');
INSERT INTO `xcx_menu` VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0');
INSERT INTO `xcx_menu` VALUES ('34', '授权', '27', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0');
INSERT INTO `xcx_menu` VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0');
INSERT INTO `xcx_menu` VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0');
INSERT INTO `xcx_menu` VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0');
INSERT INTO `xcx_menu` VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0');
INSERT INTO `xcx_menu` VALUES ('39', '分类授权', '27', '0', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0');
INSERT INTO `xcx_menu` VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `xcx_menu` VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0');
INSERT INTO `xcx_menu` VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `xcx_menu` VALUES ('43', '扩展', '0', '7', 'Addons/index', '1', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('44', '插件管理', '43', '1', 'Addons/index', '0', '', '扩展', '0');
INSERT INTO `xcx_menu` VALUES ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0');
INSERT INTO `xcx_menu` VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0');
INSERT INTO `xcx_menu` VALUES ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0');
INSERT INTO `xcx_menu` VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '', '0');
INSERT INTO `xcx_menu` VALUES ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '', '0');
INSERT INTO `xcx_menu` VALUES ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '', '0');
INSERT INTO `xcx_menu` VALUES ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '', '0');
INSERT INTO `xcx_menu` VALUES ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '', '0');
INSERT INTO `xcx_menu` VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '', '0');
INSERT INTO `xcx_menu` VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0');
INSERT INTO `xcx_menu` VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0');
INSERT INTO `xcx_menu` VALUES ('57', '钩子管理', '43', '2', 'Addons/hooks', '0', '', '扩展', '0');
INSERT INTO `xcx_menu` VALUES ('58', '模型管理', '68', '3', 'Model/index', '0', '', '系统设置', '0');
INSERT INTO `xcx_menu` VALUES ('59', '新增', '58', '0', 'model/add', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('60', '编辑', '58', '0', 'model/edit', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('61', '改变状态', '58', '0', 'model/setStatus', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('62', '保存数据', '58', '0', 'model/update', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('63', '属性管理', '68', '0', 'Attribute/index', '1', '网站属性配置。', '', '0');
INSERT INTO `xcx_menu` VALUES ('64', '新增', '63', '0', 'Attribute/add', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('65', '编辑', '63', '0', 'Attribute/edit', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('66', '改变状态', '63', '0', 'Attribute/setStatus', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('67', '保存数据', '63', '0', 'Attribute/update', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('68', '系统', '0', '4', 'Config/group', '1', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('69', '网站设置', '68', '1', 'Config/group', '0', '', '系统设置', '0');
INSERT INTO `xcx_menu` VALUES ('70', '配置管理', '68', '4', 'Config/index', '0', '', '系统设置', '0');
INSERT INTO `xcx_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0');
INSERT INTO `xcx_menu` VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0');
INSERT INTO `xcx_menu` VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0');
INSERT INTO `xcx_menu` VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0');
INSERT INTO `xcx_menu` VALUES ('75', '菜单管理', '68', '5', 'Menu/index', '0', '', '系统设置', '0');
INSERT INTO `xcx_menu` VALUES ('76', '导航管理', '68', '6', 'Channel/index', '0', '', '系统设置', '0');
INSERT INTO `xcx_menu` VALUES ('77', '新增', '76', '0', 'Channel/add', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('79', '删除', '76', '0', 'Channel/del', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('80', '分类管理', '68', '2', 'Category/index', '0', '', '系统设置', '0');
INSERT INTO `xcx_menu` VALUES ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '', '0');
INSERT INTO `xcx_menu` VALUES ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '', '0');
INSERT INTO `xcx_menu` VALUES ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '', '0');
INSERT INTO `xcx_menu` VALUES ('84', '移动', '80', '0', 'Category/operate/type/move', '0', '移动栏目分类', '', '0');
INSERT INTO `xcx_menu` VALUES ('85', '合并', '80', '0', 'Category/operate/type/merge', '0', '合并栏目分类', '', '0');
INSERT INTO `xcx_menu` VALUES ('86', '备份数据库', '68', '0', 'Database/index?type=export', '0', '', '数据备份', '0');
INSERT INTO `xcx_menu` VALUES ('87', '备份', '86', '0', 'Database/export', '0', '备份数据库', '', '0');
INSERT INTO `xcx_menu` VALUES ('88', '优化表', '86', '0', 'Database/optimize', '0', '优化数据表', '', '0');
INSERT INTO `xcx_menu` VALUES ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '', '0');
INSERT INTO `xcx_menu` VALUES ('90', '还原数据库', '68', '0', 'Database/index?type=import', '0', '', '数据备份', '0');
INSERT INTO `xcx_menu` VALUES ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '', '0');
INSERT INTO `xcx_menu` VALUES ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '', '0');
INSERT INTO `xcx_menu` VALUES ('93', '其他', '0', '5', 'other', '1', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('96', '新增', '75', '0', 'Menu/add', '0', '', '系统设置', '0');
INSERT INTO `xcx_menu` VALUES ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('104', '下载管理', '102', '0', 'Think/lists?model=download', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('105', '配置管理', '102', '0', 'Think/lists?model=config', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('106', '行为日志', '16', '0', 'Action/actionlog', '1', '', '行为管理', '0');
INSERT INTO `xcx_menu` VALUES ('108', '修改密码', '16', '0', 'User/updatePassword', '1', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('109', '修改昵称', '16', '0', 'User/updateNickname', '1', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('110', '查看行为日志', '106', '0', 'action/edit', '1', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('112', '新增数据', '58', '0', 'think/add', '1', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('113', '编辑数据', '58', '0', 'think/edit', '1', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('115', '生成', '58', '0', 'Model/generate', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('118', '文档排序', '3', '0', 'Article/sort', '1', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('119', '排序', '70', '0', 'Config/sort', '1', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('120', '排序', '75', '0', 'Menu/sort', '1', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('121', '排序', '76', '0', 'Channel/sort', '1', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('122', '设备', '0', '1', 'Device/index', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('123', '设备管理', '122', '0', 'Device/index', '0', '', '设备管理', '0');
INSERT INTO `xcx_menu` VALUES ('124', '设备地图', '122', '0', 'Device/map', '0', '', '设备管理', '0');
INSERT INTO `xcx_menu` VALUES ('125', '背景图', '0', '5', 'Background/index', '0', '', '', '0');
INSERT INTO `xcx_menu` VALUES ('126', '背景图', '125', '0', 'Background/index', '0', '', '背景图管理', '0');
INSERT INTO `xcx_menu` VALUES ('127', '模式时间', '122', '0', 'Device/scene', '0', '', '设备管理', '0');
INSERT INTO `xcx_menu` VALUES ('128', '管理员', '16', '0', 'User/index', '0', '', '用户管理', '0');

-- ----------------------------
-- Table structure for xcx_model
-- ----------------------------
DROP TABLE IF EXISTS `xcx_model`;
CREATE TABLE `xcx_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

-- ----------------------------
-- Records of xcx_model
-- ----------------------------
INSERT INTO `xcx_model` VALUES ('1', 'document', '基础文档', '0', '', '1', '{\"1\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题:article/index?cate_id=[category_id]&pid=[id]\r\ntype|get_document_type:类型\r\nlevel:优先级\r\nupdate_time|time_format:最后更新\r\nstatus_text:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除', '0', '', '', '1383891233', '1384507827', '1', 'MyISAM');
INSERT INTO `xcx_model` VALUES ('2', 'article', '文章', '1', '', '1', '{\"1\":[\"3\",\"24\",\"2\",\"5\"],\"2\":[\"9\",\"13\",\"19\",\"10\",\"12\",\"16\",\"17\",\"26\",\"20\",\"14\",\"11\",\"25\"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ncontent:内容', '0', '', '', '1383891243', '1387260622', '1', 'MyISAM');
INSERT INTO `xcx_model` VALUES ('3', 'download', '下载', '1', '', '1', '{\"1\":[\"3\",\"28\",\"30\",\"32\",\"2\",\"5\",\"31\"],\"2\":[\"13\",\"10\",\"27\",\"9\",\"12\",\"16\",\"17\",\"19\",\"11\",\"20\",\"14\",\"29\"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题', '0', '', '', '1383891252', '1387260449', '1', 'MyISAM');

-- ----------------------------
-- Table structure for xcx_picture
-- ----------------------------
DROP TABLE IF EXISTS `xcx_picture`;
CREATE TABLE `xcx_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xcx_picture
-- ----------------------------

-- ----------------------------
-- Table structure for xcx_set
-- ----------------------------
DROP TABLE IF EXISTS `xcx_set`;
CREATE TABLE `xcx_set` (
  `set_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `device_id` varchar(255) NOT NULL DEFAULT '' COMMENT '设备ID号',
  `create_time` varchar(11) NOT NULL DEFAULT '' COMMENT '初次配置时间',
  `w_1` varchar(500) NOT NULL DEFAULT '',
  `w_2` varchar(500) NOT NULL DEFAULT '',
  `w_3` varchar(500) NOT NULL DEFAULT '',
  `w_4` varchar(500) NOT NULL DEFAULT '',
  `w_5` varchar(500) NOT NULL DEFAULT '',
  `w_6` varchar(500) NOT NULL DEFAULT '',
  `w_7` varchar(500) NOT NULL DEFAULT '',
  `scene` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '场景值：1：家庭；2：办公室；3：公共场所；4：自定义',
  `update_time` varchar(11) NOT NULL DEFAULT '' COMMENT '上次更新时间',
  `isupload` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传设置 0:无；1：有',
  PRIMARY KEY (`set_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xcx_set
-- ----------------------------
INSERT INTO `xcx_set` VALUES ('1', '0', '0', '{\"a\":{\"group_1\":{\"on_time\":\"06:06\",\"off_time\":\"06:07\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '1', '0', '0');
INSERT INTO `xcx_set` VALUES ('27', 'DC4F22C2F34B', '1524207102', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"18:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"14:25\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"15:21\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"14:20\",\"off_time\":\"14:22\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '4', '1524214406', '1');
INSERT INTO `xcx_set` VALUES ('28', 'DC4F22C2F3EB', '1524446091', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"13:00\",\"off_time\":\"16:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:01\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '4', '1524550394', '1');
INSERT INTO `xcx_set` VALUES ('26', 'DC4F22C2F3EC', '1524118947', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"07:00\",\"off_time\":\"07:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:02\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"08:00\",\"off_time\":\"10:59\"},\"group_2\":{\"on_time\":\"13:04\",\"off_time\":\"13:04\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"11:01\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:06\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"18:01\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"16:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '4', '1524658404', '1');
INSERT INTO `xcx_set` VALUES ('29', '600194A2A958', '1524656759', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '4', '1524657857', '1');
INSERT INTO `xcx_set` VALUES ('30', '600194A2A8B3', '1524728378', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"11:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:05\",\"off_time\":\"10:05\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"13:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"07:02\",\"off_time\":\"07:02\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '4', '1524728553', '0');
INSERT INTO `xcx_set` VALUES ('2', '0', '0', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:08\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '2', '0', '0');
INSERT INTO `xcx_set` VALUES ('3', '0', '0', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '{\"a\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"10:00\"},\"group_2\":{\"on_time\":\"14:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"18:30\",\"off_time\":\"20:30\"}},\"b\":{\"group_1\":{\"on_time\":\"12:00\",\"off_time\":\"12:03\"},\"group_2\":{\"on_time\":\"\",\"off_time\":\"\"},\"group_3\":{\"on_time\":\"\",\"off_time\":\"\"}},\"c\":{\"group_1\":{\"on_time\":\"06:00\",\"off_time\":\"08:00\"},\"group_2\":{\"on_time\":\"15:00\",\"off_time\":\"17:00\"},\"group_3\":{\"on_time\":\"19:30\",\"off_time\":\"20:30\"}}}', '3', '0', '0');

-- ----------------------------
-- Table structure for xcx_ucenter_admin
-- ----------------------------
DROP TABLE IF EXISTS `xcx_ucenter_admin`;
CREATE TABLE `xcx_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of xcx_ucenter_admin
-- ----------------------------

-- ----------------------------
-- Table structure for xcx_ucenter_app
-- ----------------------------
DROP TABLE IF EXISTS `xcx_ucenter_app`;
CREATE TABLE `xcx_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of xcx_ucenter_app
-- ----------------------------

-- ----------------------------
-- Table structure for xcx_ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `xcx_ucenter_member`;
CREATE TABLE `xcx_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of xcx_ucenter_member
-- ----------------------------
INSERT INTO `xcx_ucenter_member` VALUES ('1', 'Marvin', '89251d1e7c83b432f960eb0e822eb414', '1589946526@qq.com', '', '1524813406', '1018200150', '1524972419', '1879768204', '1524813406', '1');
INSERT INTO `xcx_ucenter_member` VALUES ('2', 'wahaha', 'e4b131d0cd3d1ab53dc13d3e6092ab70', 'm17678328512@163.com', '', '1524912159', '1942541639', '1524912583', '1942541639', '1524912159', '1');
INSERT INTO `xcx_ucenter_member` VALUES ('3', 'Marvin1', '6680be2f004ef71d3238bf72b68816be', 'nipc@ifubonn.com', '', '1524971683', '1879768204', '1524971789', '1901642796', '1524971683', '1');

-- ----------------------------
-- Table structure for xcx_ucenter_setting
-- ----------------------------
DROP TABLE IF EXISTS `xcx_ucenter_setting`;
CREATE TABLE `xcx_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- ----------------------------
-- Records of xcx_ucenter_setting
-- ----------------------------

-- ----------------------------
-- Table structure for xcx_url
-- ----------------------------
DROP TABLE IF EXISTS `xcx_url`;
CREATE TABLE `xcx_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';

-- ----------------------------
-- Records of xcx_url
-- ----------------------------

-- ----------------------------
-- Table structure for xcx_user
-- ----------------------------
DROP TABLE IF EXISTS `xcx_user`;
CREATE TABLE `xcx_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `avatarurl` varchar(1000) NOT NULL DEFAULT '' COMMENT '存储用户头像',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '城市',
  `gender` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户性别0：女；1男；',
  `nickname` varchar(255) NOT NULL DEFAULT '' COMMENT '昵称',
  `openid` varchar(255) NOT NULL DEFAULT '' COMMENT '用户的openid',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省',
  `unionid` varchar(255) NOT NULL DEFAULT '' COMMENT '联合ID号',
  `create_time` varchar(11) NOT NULL DEFAULT '',
  `update_time` varchar(11) NOT NULL DEFAULT '',
  `wxopenid` varchar(255) NOT NULL DEFAULT '' COMMENT '用户在微信公众号的id',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xcx_user
-- ----------------------------
INSERT INTO `xcx_user` VALUES ('52', 'https://wx.qlogo.cn/mmopen/vi_32/ON1ia3q8kib5f66m8ibqhGT4iaTNIXaU5s1YE2PwM5fsjxbQ8ySBrhwVjpQ5rMdZAwaZ39PzTtjFVCrQlTua3iamKbw/0', 'Bozhou', '1', '雨后桥前', 'ov7C35Yn5JV6h-XJAmco7v4E-_pk', 'Anhui', 'oujWavxdQEx44mv551oDCrFvvzuk', '1524448396', '', 'og1D2w7S-YhPQj0QO6Kw4gCBWwjY');
INSERT INTO `xcx_user` VALUES ('36', 'https://wx.qlogo.cn/mmopen/vi_32/5AricnI6TcZudeG5zuPHicwfSt9mYVhHicb8DMajMJhQVqcatgicJIQBica71FCicnHVv3bHxGic8o94jgPor6icpZvj2w/0', '', '0', '古代稀', 'ov7C35V8FzG2GwLVdELdRAJLJGdU', '', 'oujWavxZoidyruT8cztK5Edj05Jk', '1523587096', '', '');
INSERT INTO `xcx_user` VALUES ('37', 'https://wx.qlogo.cn/mmopen/vi_32/rHQLqLYNRXuVd3JhKyFvGIIB1BQr7mr7CRQFicIrr2icbibrC9YagCMibtwROHt2ZuibJDZGwAFLPyWNwfpJ8lS1moA/0', 'Shenzhen', '2', '小王子@佳', 'ov7C35VvY1UdizKARoKIwnuq7k_4', 'Guangdong', 'oujWav73p0FMR_kCFgk4xE4fJ2v4', '1523587176', '', '');
INSERT INTO `xcx_user` VALUES ('38', 'https://wx.qlogo.cn/mmopen/vi_32/CEWufvUZXsWapQkpfAjm6vOMsFwMKvMk8YNVTGdicwDJjSUHicgzqVgmMibbeP0BrwJIZZibUY202IrsGR4K5AyQVw/0', 'Shenzhen', '1', '周元毕', 'ov7C35QS--H8iMZ4mfCYki2PQ9is', 'Guangdong', 'oujWav_56qo0MrhyUlE8T3nn1f6Q', '1523587303', '', '');
INSERT INTO `xcx_user` VALUES ('39', 'https://wx.qlogo.cn/mmopen/vi_32/ntz6HpE13xtFREMMJkw4XQbcia9QNDl03WZtRXIibGutogvUyjticncicAr0FgzDhM8GNmichmIswWLPwR8GEdHakSA/0', 'Sanmenxia', '1', '十个太阳', 'ov7C35R0Ib-bSO30UQphpceLL1HA', 'Henan', 'oujWav9TNDvX1qIyEZWBkniCR7hU', '1523606874', '', 'og1D2w5pg9Bm5Cc-My1JTOOtJu7U');
INSERT INTO `xcx_user` VALUES ('40', 'https://wx.qlogo.cn/mmopen/vi_32/SSRGyT82Vjc3xL13rkb1M6NenMzqYZkjTclhWodXWW0lfxLDX2Eg6j5zX8WY3o5yxzUF0QvbJ0NJaO8Xz4Kc9w/0', 'Shenzhen', '1', 'Marvin', 'ov7C35Tqgd30kqHIEnmkrv5sAPGc', 'Guangdong', 'oujWav4MB6kq4w380slBmazJ4dkY', '1523695003', '', 'og1D2w80LuFRz_dAl2DsoSbTzZn0');
INSERT INTO `xcx_user` VALUES ('57', 'https://wx.qlogo.cn/mmopen/vi_32/12kzI6xFn3AhavzhIrZ94fV6U0FHMUYzdcmSRRrhjo2uJO176o6IIaybxakmhvLP8uUUTRygISqUhIPUiaxkCCw/0', '', '0', '雨后桥前', 'ov7C35VSe81AtY5G4_467ksdigAA', '', 'oujWav8sMeE6p2rSNgHikNbsh9To', '1524831197', '', '');
INSERT INTO `xcx_user` VALUES ('48', 'https://wx.qlogo.cn/mmopen/vi_32/HjtuGCtLbseYibDBQj01S4b4hemejeOAuL72H4523xwgefbI10MJftNt88sCkZPEZeuqon8hTxEXbSlEzus3xhQ/0', 'Shenzhen', '1', '李悦宁', 'ov7C35ftQa4Vd-wnQnl5cpl2sL70', 'Guangdong', 'oujWav2ojedpBCjpIdi25V6LAhUs', '1524123747', '', 'og1D2w0CS7r98xyMvUcsoNK4WTmk');
INSERT INTO `xcx_user` VALUES ('49', 'https://wx.qlogo.cn/mmopen/vi_32/b2hnFEwGktYbeTgbHp8zJBFtmGtFKIJmJBKVhHschtHpFF65OzibbJzWaHgotMlStKxOSGAaNOIdr5fBYKjichwg/0', '', '0', '罗旭荣', 'ov7C35c1yKmD-AujZfc2jRfb4kqo', '', 'oujWav_GQFOYr1lAW8ZegIH88dMA', '1524131720', '', 'og1D2w84PtAsMtandUUmrDw2CssI');
INSERT INTO `xcx_user` VALUES ('45', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ5nKRcTbnl3Lf2jnprgxgxhfMOSCFko1ibSXCDnYpSVRzO50nIEuggqmBqHxEmwMFcMduGA0FzHCg/0', 'Quanzhou', '1', 'cxk.', 'ov7C35f13xefqK3ysXUA_WgIc0Dw', 'Fujian', 'oujWav09Stcn37dunQVqvSbXW8RM', '1524051086', '', 'og1D2w80ZMgi4EYgNn7uoTgK3_ik');
INSERT INTO `xcx_user` VALUES ('50', 'https://wx.qlogo.cn/mmopen/vi_32/QmxxZ7XS3jO84OTr4gKczWKenjScmB3doymRrCVciaLgcKenvPBl6lSlDuUj6Hmnq4WVt7ic0IJibOayLmhRo0p4g/0', 'Shenzhen', '1', '马文 尤智全球', 'ov7C35XQsYWP81imTgtm9Ia5uecQ', 'Guangdong', 'oujWav76ss0f3cqVaTed9BDUlJ2A', '1524202984', '', 'og1D2w11SBLVhYO4_ahHZVxQ5WsE');
INSERT INTO `xcx_user` VALUES ('53', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI7y20jxxAnsaKOm55VZ5awKWkL4H7pBXZtdKTdicWPjzE7gEicqQGqlP6RRzt6ic1LMD7Ebnkasvs9A/0', 'Guangzhou', '1', 'handey', 'ov7C35QWVhlLsvDNMFHXQUkyZYZU', 'Guangdong', 'oujWav9EKEhclEvUNRi2e43_Ihfs', '1524457527', '', '');
INSERT INTO `xcx_user` VALUES ('56', '', '', '0', 'rdgztest_VKFULO', 'ov7C35WglbniOBIx5mtJ5VwNU7_I', '', 'oujWav02_Tyhu2VPzR1pP74pQsPw', '1524657294', '', '');
INSERT INTO `xcx_user` VALUES ('55', 'https://wx.qlogo.cn/mmopen/vi_32/8cMCv08SgicnvwQhacT4USAxLicqYrDhc5qq8UVxIdpbVQk9Wb9taON7UYyqibJTAxP6OG7DTqVCNRtaW5hFZmC4Q/0', 'Hangzhou', '2', 'handey', 'ov7C35SYCkW-OenfBGkNocCV9Wb4', 'Zhejiang', 'oujWav7wfC-28kcTaCmqTuAJ6Tr4', '1524557798', '', '');
INSERT INTO `xcx_user` VALUES ('58', '', '', '0', 'rdgztest_ORRQIP', 'ov7C35feXVQ86D0s5z8QmtFXYBFo', '', 'oujWav_Z9VoVe6nUSOeWX-nkHOJA', '1524872133', '', '');
INSERT INTO `xcx_user` VALUES ('59', '', '', '0', 'rdgztest_KLDUVI', 'ov7C35QST2xJo8iOjXSsAEV2AjhI', '', 'oujWav_roCFsInjhx9cRpqC78zzI', '1524872812', '', '');
INSERT INTO `xcx_user` VALUES ('60', '', '', '0', 'rdgztest_BLSVGG', 'ov7C35U3geRcuDtGbRZ87BlyPxIE', '', 'oujWav5HTM1NFl4wvF5Ny3rIH2DU', '1524889555', '', '');
INSERT INTO `xcx_user` VALUES ('61', 'https://wx.qlogo.cn/mmopen/vi_32/MjQgk3OwvQibTbh06WTTkqJW2ARELdnY8O74Jj3nDJ4WFujrV4JHorCouR6y7726tl22ia3ibcKBRjo2ryX4BricibA/0', 'Shenzhen', '2', 'Ivy', 'ov7C35V0ScefZ0rv2LxehEHkCo9o', 'Guangdong', 'oujWavwIAnG-dsjtmK9erg83VQqE', '1524970054', '', '');
INSERT INTO `xcx_user` VALUES ('62', 'https://wx.qlogo.cn/mmopen/vi_32/v0ISZWeWN1UN2opZStKPhcVkMhPn1tWTq1RibUgHTbu85Dg7fhicibFVY6CRtFRDMsAe1yRLGppJJjbXUErxKxWUw/0', 'Luzhou', '1', '杜仲', 'ov7C35ZvaWb5nfPT180yvbuLhuys', 'Sichuan', 'oujWav00qdhZLlFtYDd_6xMCNvzE', '1524970131', '', '');
INSERT INTO `xcx_user` VALUES ('63', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLicwhaSVJxBVS2iaZl3kmjFZiaWOty71gQMHpssIREb8IDlqwFk3bylAyDUtykeBaRydQrVv9zr313g/0', 'Shenzhen', '1', '朱新华', 'ov7C35TtXmzegktQ5us9_VXsuKtU', 'Guangdong', 'oujWavzfPI7zw6fzcHaYCNyUi0hc', '1524970254', '', '');
INSERT INTO `xcx_user` VALUES ('64', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIiaKe5ibIE8I2xYhqzTSVO5RsjvwgBiaicGMLMDibskSPWUE3f53R5ZHEWzPJKzBUyVYiccMg7ibiczeZjnQ/0', 'Shenzhen', '2', 'Jolie', 'ov7C35VzmTZ_nkuFypjcwlBJAkOc', 'Guangdong', 'oujWav8ZFyOXVuvReXdFTZzlOye0', '1524971214', '', 'og1D2w53k6k861lqR4xmoEOGhgUY');
INSERT INTO `xcx_user` VALUES ('65', 'https://wx.qlogo.cn/mmopen/vi_32/Ob4OhIyco10IeuYNAFP2qJ3ibtn8GGKgbHzDMHH0z6nng3lqkf2ACKqW1yic313u9Vs7UsujPXtGvcGIbqoXIFwA/0', 'Shenzhen', '1', '黄国文', 'ov7C35V0Z_nKgjD7dDfwArUVNOb0', 'Guangdong', 'oujWavxp_TxSsZ_6Ot6hftpVQrts', '1524972735', '', 'og1D2w1R4pQHd56qY9k0WLnNBdLE');
INSERT INTO `xcx_user` VALUES ('66', 'https://wx.qlogo.cn/mmopen/vi_32/xAFDOQfgH8oOrRDGI3LNom3dqktgEJkFD6DHUqbXDMhHS6lE1xJrOUR5LCo0d5DsicibbYq3noq0NGrvbOv9aD5A/0', 'Chengdu', '1', 'shallwetalk', 'ov7C35WUnCiiCzVtAnsMLaS4fucg', 'Sichuan', 'oujWav5TU4QxxBXUxOKhgpCGvLxA', '1524973599', '', '');
INSERT INTO `xcx_user` VALUES ('67', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ762O6MCHynrBbop5hXQBEyuUP93fMVbPEg4KRwILrzZHeExcplOLJeIQrXee88nlse4iccQSwYrw/0', '', '1', '逻司', 'ov7C35axrmwSyYFRwZ2Lq7bPQd_8', 'Shanghai', 'oujWav5nCPhlsCEAgwxerSL_oJ0I', '1525164438', '', '');

-- ----------------------------
-- Table structure for xcx_userdata
-- ----------------------------
DROP TABLE IF EXISTS `xcx_userdata`;
CREATE TABLE `xcx_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xcx_userdata
-- ----------------------------
