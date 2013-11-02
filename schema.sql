-- ----------------------------------------------------------
-- MDB Tools - A library for reading MS Access database files
-- Copyright (C) 2000-2011 Brian Bruns and others.
-- Files in libmdb are licensed under LGPL and the utilities under
-- the GPL, see COPYING.LIB and COPYING files respectively.
-- Check out http://mdbtools.sourceforge.net
-- ----------------------------------------------------------

-- That file uses encoding UTF-8

CREATE TABLE `ABBREV`
 (
	`NDB_No`			varchar (10), 
	`Shrt_Desc`			varchar (120), 
	`Water_(g)`			float, 
	`Energ_Kcal`			int, 
	`Protein_(g)`			float, 
	`Lipid_Tot_(g)`			float, 
	`Ash_(g)`			float, 
	`Carbohydrt_(g)`			float, 
	`Fiber_TD_(g)`			float, 
	`Sugar_Tot_(g)`			float, 
	`Calcium_(mg)`			int, 
	`Iron_(mg)`			float, 
	`Magnesium_(mg)`			float, 
	`Phosphorus_(mg)`			int, 
	`Potassium_(mg)`			int, 
	`Sodium_(mg)`			int, 
	`Zinc_(mg)`			float, 
	`Copper_mg)`			float, 
	`Manganese_(mg)`			float, 
	`Selenium_(ug)`			float, 
	`Vit_C_(mg)`			float, 
	`Thiamin_(mg)`			float, 
	`Riboflavin_(mg)`			float, 
	`Niacin_(mg)`			float, 
	`Panto_Acid_mg)`			float, 
	`Vit_B6_(mg)`			float, 
	`Folate_Tot_(ug)`			float, 
	`Folic_Acid_(ug)`			float, 
	`Food_Folate_(ug)`			float, 
	`Folate_DFE_(ug)`			float, 
	`Choline_Tot_ (mg)`			float, 
	`Vit_B12_(ug)`			float, 
	`Vit_A_IU`			int, 
	`Vit_A_RAE`			float, 
	`Retinol_(ug)`			float, 
	`Alpha_Carot_(ug)`			float, 
	`Beta_Carot_(ug)`			float, 
	`Beta_Crypt_(ug)`			float, 
	`Lycopene_(ug)`			float, 
	`Lut+Zea_ (ug)`			float, 
	`Vit_E_(mg)`			float, 
	`Vit_D_ug`			float, 
	`Vit_D_IU`			float, 
	`Vit_K_(ug)`			float, 
	`FA_Sat_(g)`			float, 
	`FA_Mono_(g)`			float, 
	`FA_Poly_(g)`			float, 
	`Cholestrl_(mg)`			int, 
	`GmWt_1`			float, 
	`GmWt_Desc1`			varchar (240), 
	`GmWt_2`			float, 
	`GmWt_Desc2`			varchar (240), 
	`Refuse_Pct`			int
);

CREATE TABLE `DATA_SRC`
 (
	`DataSrc_ID`			varchar (12), 
	`Authors`			varchar (510), 
	`Title`			varchar (510), 
	`Year`			varchar (8), 
	`Journal`			varchar (270), 
	`Vol_City`			varchar (32), 
	`Issue_State`			varchar (10), 
	`Start_Page`			varchar (10), 
	`End_Page`			varchar (10)
);

CREATE TABLE `DATSRCLN`
 (
	`NDB_No`			varchar (510), 
	`Nutr_No`			varchar (510), 
	`DataSrc_ID`			varchar (510)
);

CREATE TABLE `DERIV_CD`
 (
	`Deriv_CD`			varchar (8), 
	`Deriv_Desc`			varchar (240)
);

CREATE TABLE `FD_GROUP`
 (
	`FdGrp_CD`			varchar (8), 
	`FdGrp_Desc`			varchar (120)
);

CREATE TABLE `FOOD_DES`
 (
	`NDB_No`			varchar (10), 
	`FdGrp_Cd`			varchar (8), 
	`Long_Desc`			varchar (400), 
	`Shrt_Desc`			varchar (120), 
	`ComName`			varchar (200), 
	`ManufacName`			varchar (130), 
	`Survey`			varchar (2), 
	`Ref_Desc`			varchar (270), 
	`Refuse`			int, 
	`SciName`			varchar (130), 
	`N_Factor`			float, 
	`Pro_Factor`			float, 
	`Fat_Factor`			float, 
	`CHO_Factor`			float
);

CREATE TABLE `FOOTNOTE`
 (
	`NDB_No`			varchar (10), 
	`Footnt_No`			varchar (8), 
	`Footnot_Typ`			varchar (2), 
	`Nutr_No`			varchar (6), 
	`Footnot_Txt`			varchar (400)
);

CREATE TABLE `LANGDESC`
 (
	`Factor`			varchar (12), 
	`Description`			varchar (500)
);

CREATE TABLE `NUT_DATA`
 (
	`NDB_No`			varchar (10), 
	`Nutr_No`			varchar (6), 
	`Nutr_Val`			float, 
	`Num_Data_Pts`			int, 
	`Std_Error`			float, 
	`Src_Cd`			varchar (4), 
	`Deriv_Cd`			varchar (8), 
	`Ref_NDB_No`			varchar (10), 
	`Add_Nutr_Mark`			varchar (2), 
	`Num_Studies`			int, 
	`Min`			float, 
	`Max`			float, 
	`DF`			float, 
	`Low_EB`			float, 
	`Up_EB`			float, 
	`Stat_Cmt`			varchar (20), 
	`AddMod_Date`			varchar (20)
);

CREATE TABLE `NUTR_DEF`
 (
	`Nutr_No`			varchar (6), 
	`Units`			varchar (14), 
	`Tagname`			varchar (40), 
	`NutrDesc`			varchar (120), 
	`Num_Dec`			varchar (2), 
	`SR_Order`			float
);

CREATE TABLE `SRC_CD`
 (
	`Src_Cd`			varchar (4), 
	`SrcCd_Desc`			varchar (120)
);

CREATE TABLE `WEIGHT`
 (
	`NDB_No`			varchar (10), 
	`Seq`			varchar (4), 
	`Amount`			float, 
	`Msre_Desc`			varchar (168), 
	`Gm_Wgt`			float, 
	`Num_Data_Pts`			int, 
	`Std_Dev`			float
);

CREATE TABLE `ADD_FTNT`
 (
	`NDB_NO`			varchar (510), 
	`Footnt_No`			varchar (510), 
	`Footnot_Typ`			varchar (510), 
	`Nutr_No`			varchar (510), 
	`Footnot_Txt`			varchar (510)
);

CREATE TABLE `LANGUAL`
 (
	`NDB_No`			varchar (10), 
	`Factor`			varchar (12)
);
