//************************************************************
//		  					EXIT
//************************************************************
INSTANCE DIA_Addon_Henry_EXIT(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 999;
	condition	= DIA_Addon_Henry_EXIT_Condition;
	information	= DIA_Addon_Henry_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Henry_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Henry_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// -----------------------------------------------------------
	func void B_Henry_Gold (var int gold)
	{
		if (gold == 500)
		{
			AI_Output (self ,other,"DIA_Addon_Henry_Gold500_04_00"); //500 zla��k�.
		}
		else if (gold == 400)
		{
			AI_Output (self ,other,"DIA_Addon_Henry_Gold400_04_00"); //400 zla��k�.
		}
		else if (gold == 300)
		{
			AI_Output (self ,other,"DIA_Addon_Henry_Gold300_04_00"); //300 zla��k�.
		}
		else if (gold == 200)
		{
			AI_Output (self ,other,"DIA_Addon_Henry_Gold200_04_00"); //200 zla��k�.
		}
		else if (gold == 100)
		{
			AI_Output (self ,other,"DIA_Addon_Henry_Gold100_04_00"); //100 zla��k�.
		}
		else
		{
			B_Say_Gold (self, other, gold);
		};
		
	};
// -----------------------------------------------------------

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Henry_PICKPOCKET (C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 900;
	condition	= DIA_Addon_Henry_PICKPOCKET_Condition;
	information	= DIA_Addon_Henry_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Henry_PICKPOCKET_Condition()
{
	C_Beklauen (40, 60);
};
 
FUNC VOID DIA_Addon_Henry_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Henry_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Henry_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Henry_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Henry_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Henry_PICKPOCKET_DoIt);
};

func void DIA_Addon_Henry_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Henry_PICKPOCKET);
};
	
func void DIA_Addon_Henry_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Henry_PICKPOCKET);
};
// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************
// ------------------------------------------------------------
const string PIR_1354_Checkpoint = "ADW_PIRATECAMP_WAY_02";	
// ------------------------------------------------------------
instance DIA_Addon_Henry_Hello(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 5;
	condition	= DIA_Addon_Henry_Hello_Condition;
	information	= DIA_Addon_Henry_Hello_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Henry_Hello_Condition()
{
	if (Npc_GetDistToWP(other, PIR_1354_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self, 5);
		return FALSE;
	};
	
	if (self.aivar[AIV_Guardpassage_Status]			== GP_NONE)
	&& (self.aivar[AIV_PASSGATE]					== FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)	== TRUE)
	&& (Npc_RefuseTalk(self) 						== FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_Henry_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Henry_Hello_04_00"); //ST�T!
	AI_Output (self ,other,"DIA_Addon_Henry_Hello_04_01"); //P��tel, nebo nep��tel?
	
	Info_ClearChoices (DIA_Addon_Henry_Hello);
	Info_AddChoice (DIA_Addon_Henry_Hello,"Nep��tel!",DIA_Addon_Henry_Hello_Feind);
	Info_AddChoice (DIA_Addon_Henry_Hello,"P��tel!",DIA_Addon_Henry_Hello_Freund);
};
var int Henry_SC_Frech;
FUNC VOID DIA_Addon_Henry_Hello_Feind()
{
	AI_Output (other,self ,"DIA_Addon_Henry_Hello_Feind_15_00"); //Nep��tel!
	AI_Output (self ,other,"DIA_Addon_Henry_Hello_Feind_04_01"); //Koleduje� si vo n��ez, ty �a�ku? 
	AI_Output (self ,other,"DIA_Addon_Henry_Hello_Feind_04_02"); //Bu� vyklop, co tu chce�, nebo hezky rychle vypadni.
	
	Henry_SC_Frech = TRUE;

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,Pir_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;	
	
	Info_ClearChoices (DIA_Addon_Henry_Hello);
};

FUNC VOID DIA_Addon_Henry_Hello_Freund()
{
	AI_Output (other,self ,"DIA_Addon_Henry_Hello_Freund_15_00"); //P��tel!
	AI_Output (self ,other,"DIA_Addon_Henry_Hello_Freund_04_01"); //To by moh ��ct ka�dej! J� t� nezn�m � co tu chce�?
	
	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,Pir_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;	
	
	Info_ClearChoices (DIA_Addon_Henry_Hello);
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************
instance DIA_Addon_Henry_SecondWarn (C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 2;
	condition	= DIA_Addon_Henry_SecondWarn_Condition;
	information	= DIA_Addon_Henry_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       
FUNC INT DIA_Addon_Henry_SecondWarn_Condition()
{
	if (self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&& (self.aivar[AIV_PASSGATE]					== FALSE								) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)	== TRUE									)
	&& (Npc_GetDistToWP(other,pir_1354_Checkpoint)	<  (other.aivar[AIV_LastDistToWP]-50)	)
	{
		return TRUE;
	};
};
func void DIA_Addon_henry_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_Addon_Henry_SecondWarn_04_00"); //Je�t� krok k t�boru a je z tebe �r�dlo pro �raloky.

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,Pir_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************
instance DIA_Addon_Henry_Attack (C_INFO)
{
	npc			= Pir_1354_Addon_Henry;
	nr			= 3;
	condition	= DIA_Addon_Henry_Attack_Condition;
	information	= DIA_Addon_Henry_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       
func INT DIA_Addon_Henry_Attack_Condition()
{
	if (self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&& (self.aivar[AIV_PASSGATE]					== FALSE								) 
	&& (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)	== TRUE									)
	&& (Npc_GetDistToWP(other,Pir_1354_Checkpoint)	<  (other.aivar[AIV_LastDistToWP]-50)	)
	{
		return TRUE;
	};
};
func void DIA_Addon_Henry_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, other,"DIA_Addon_Henry_Attack_04_00"); //�ek sis vo to. 
	
	AI_StopProcessInfos	(self);
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};



// ************************************************************
// ***														***
// 						Ich will ins Lager
// ***														***
// ************************************************************
// ------------------------------------------------------------
var int Henry_Zoll_WhatFor;
// ------------------------------------------------------------
// 		  				Ich will da rein	   
// ------------------------------------------------------------
INSTANCE DIA_Addon_Henry_WantEnter(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 1;
	condition	= DIA_Addon_Henry_WantEnter_Condition;
	information	= DIA_Addon_Henry_WantEnter_Info;
	permanent	= FALSE;
	description	= "Chci dovnit�.";
};                       
FUNC INT DIA_Addon_Henry_WantEnter_Condition()
{
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Henry_WantEnter_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_WantEnter_15_00"); //Chci dovnit�.
	AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_01"); //V�n�? Zadarmo to ale nebude. 

	B_Henry_Gold (500);

	if (Henry_Zoll_WhatFor == FALSE)
	{
		AI_Output (other,self ,"DIA_Addon_Henry_WantEnter_15_02"); //Co�e? Pro�?
		AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_03"); //Se hned nemus� �ertit. 
		AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_04"); //Tady v t�bo�e je HROMADA v�c�, kter� by t� mohly zaj�mat.
		Henry_Zoll_WhatFor = TRUE;
	};
		 
	var C_Item itm; itm = Npc_GetEquippedArmor(other);
	
	if	((Hlp_IsItem(itm, ITAR_KDF_L) == TRUE)
	||	 (Hlp_IsItem(itm, ITAR_KDF_H) == TRUE)
	||   (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)
	||	 (Hlp_IsItem(itm, ITAR_MIL_L) == TRUE)
	||	 (Hlp_IsItem(itm, ITAR_MIL_M) == TRUE))
	{
		AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_07"); //A ty rozhodn� nevypad� jako ��kej chud�k. 
		AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_08"); //Tak�e men�� p��sp�vek t� nezabije. 
		AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_09"); //Nebo si ty n�bl hadry, co m� na sob�, ukrad?
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_10"); //M� p�eci zlato, �e jo?   
	};
};

// ------------------------------------------------------------
// 							500 zahlen!
// ------------------------------------------------------------
func void B_Henry_NoJoin()
{	
	AI_Output (self, other, "DIA_Addon_Henry_Add_04_00"); //Jestli se k n�m chce� p�idat, ���e, tak to m� sm�lu.
	AI_Output (self, other, "DIA_Addon_Henry_Add_04_01"); //Vo tom, kdo se k n�m p�id�, rozhoduje jedin� kapit�n, a ten te� s p�lkou pos�dky vyjel loupit na mo�e.
	AI_Output (self, other, "DIA_Addon_Henry_Add_04_02"); //Ale m��e� tu z�stat, dokud se nevr�t�.
	AI_Output (self, other, "DIA_Addon_Henry_Add_04_03"); //Kdy� tu nebude� d�lat ��dnou neplechu.
};
// ------------------------------------------------------------



instance DIA_Addon_Henry_Einigen2		(C_INFO)
{
	npc		 	= PIR_1354_Addon_Henry;
	nr		 	= 2;
	condition	= DIA_Addon_Henry_Einigen2_Condition;
	information	= DIA_Addon_Henry_Einigen2_Info;

	description	= "Tady m� sv�ch 500 zla��k�.";
};
func int DIA_Addon_Henry_Einigen2_Condition ()
{
	if (self.aivar[AIV_PASSGATE]					== FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Henry_WantEnter))
	&& (!Npc_KnowsInfo (other, DIA_Addon_Henry_Einigen))
	&& (Npc_HasItems (other,ItMi_Gold) >= 500)
	{
		return TRUE;
	};
};
func void DIA_Addon_Henry_Einigen2_Info ()
{
	AI_Output (other, self, "DIA_Addon_Henry_Einigen2_15_00"); //Tady m� t�ch 500 zlat�ch.
	B_GiveInvItems (other, self, ItMi_Gold, 500);		
	AI_Output (self, other, "DIA_Addon_Henry_Einigen2_04_01"); //Dob�e, v�tej v na�em t�bo�e!  
	B_Henry_NoJoin();
	
	self.aivar[AIV_PASSGATE] = TRUE;
};

// ------------------------------------------------------------
// 								Einigen
// ------------------------------------------------------------
instance DIA_Addon_Henry_Einigen		(C_INFO)
{
	npc		 	= PIR_1354_Addon_Henry;
	nr		 	= 3;
	condition	= DIA_Addon_Henry_Einigen_Condition;
	information	= DIA_Addon_Henry_Einigen_Info;

	description	= "Nem��eme se n�jak dohodnout?";
};

func int DIA_Addon_Henry_Einigen_Condition ()
{
	if (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Henry_WantEnter))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Einigen_Info ()
{
	AI_Output (other, self, "DIA_Addon_Henry_Einigen_15_00"); //Nem��eme se n�jak dohodnout?
	AI_Output (self, other, "DIA_Addon_Henry_Einigen_04_01"); //No, dej mi ��kej dobrej d�vod a j� ti mo�n� slev�m.
};

// ------------------------------------------------------------
// 		  			Grund 1 - Fleisch f�r Morgan
// ------------------------------------------------------------
INSTANCE DIA_Addon_Henry_MeatForMorgan(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 4;
	condition	= DIA_Addon_Henry_MeatForMorgan_Condition;
	information	= DIA_Addon_Henry_MeatForMorgan_Info;
	permanent	= FALSE;
	description	= "Tohle maso m�m zan�st Morganovi.";
};                       
FUNC INT DIA_Addon_Henry_MeatForMorgan_Condition()
{
	if  (self.aivar[AIV_PASSGATE] == FALSE)
	&&  (Npc_KnowsInfo (other, DIA_Addon_Henry_Einigen))
	&& 	(MIS_AlligatorJack_BringMeat == LOG_RUNNING)
	&&	(Npc_HasItems (other,ItFoMuttonRaw) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_Henry_MeatForMorgan_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_MeatForMorgan_15_00"); //M�m Morganovi zan�st tohle maso.
	AI_Output (self ,other,"DIA_Addon_Henry_MeatForMorgan_04_01"); //(odm��en�) Aha, a kdo t� pos�l�?  
	AI_Output (other,self ,"DIA_Addon_Henry_MeatForMorgan_15_02"); //Krokod�l Jack, tvrd�, �e Morgan u� na to �ek�.
	AI_Output (self ,other,"DIA_Addon_Henry_MeatForMorgan_04_03"); //Ch�pu, a jemu se sem nechce, co?  
};

// ------------------------------------------------------------
// 		  			Grund 2 - Holz von Malcom
// ------------------------------------------------------------
instance DIA_Addon_Henry_Malcom		(C_INFO)
{
	npc		 	= PIR_1354_Addon_Henry;
	nr		 	= 5;
	condition	= DIA_Addon_Henry_Malcom_Condition;
	information	= DIA_Addon_Henry_Malcom_Info;

	description	= "Pos�l� m� Malcom.";
};
func int DIA_Addon_Henry_Malcom_Condition ()
{
	if  (self.aivar[AIV_PASSGATE]	== FALSE)
	&&  (Npc_KnowsInfo (other, DIA_Addon_Henry_Einigen))
	&&  (MalcomBotschaft == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Henry_Malcom_Info ()
{
	AI_Output (other, self, "DIA_Addon_Henry_Malcom_15_00"); //Pos�l� m� Malcolm, pr� to d�evo m��e chv�li trvat.
	AI_Output (self, other, "DIA_Addon_Henry_Malcom_04_01"); //(�brbl�) No jo, to jsem si moh myslet. To snad potrv� do soudn�ho dne.

	B_MalcomExident();
};

// ------------------------------------------------------------
// 		  			Grund 3 - Paket f�r Skip
// ------------------------------------------------------------
instance DIA_Addon_Henry_BaltramPack		(C_INFO)
{
	npc		 	= PIR_1354_Addon_Henry;
	nr		 	= 6;
	condition	= DIA_Addon_Henry_BaltramPack_Condition;
	information	= DIA_Addon_Henry_BaltramPack_Info;

	description	= "M�m tu n�co pro Skipa, je tady?";
};
func int DIA_Addon_Henry_BaltramPack_Condition ()
{
	if (self.aivar[AIV_PASSGATE]	== FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Henry_Einigen))
	&& (Npc_HasItems (other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
};
func void DIA_Addon_Henry_BaltramPack_Info ()
{
	AI_Output (other, self, "DIA_Addon_Henry_BaltramPack_15_00"); //Nesu z�silku pro Skipa, je tady?
	AI_Output (self, other, "DIA_Addon_Henry_BaltramPack_04_01"); //Jo, Skip je tady. A co te�?
};

// ------------------------------------------------------------
// 						ICH WILL JETZT REIN
// ------------------------------------------------------------
var int Henry_Amount;
// ------------------------------------------------------------
instance DIA_Addon_Henry_Tribut		(C_INFO)
{
	npc		 	= PIR_1354_Addon_Henry;
	nr		 	= 7;
	condition	= DIA_Addon_Henry_Tribut_Condition;
	information	= DIA_Addon_Henry_Tribut_Info;
	permanent	= TRUE;
	description = "Pus� m� dovnit�.";
};
func int DIA_Addon_Henry_Tribut_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Henry_Einigen))
	&& (self.aivar[AIV_PASSGATE] == FALSE)		
	{
		return TRUE;
	};
};
func void DIA_Addon_Henry_Tribut_Info ()
{
	Henry_Amount = 500;

	AI_Output	(other, self, "DIA_Addon_Henry_Tribut_15_00"); //Pus� m� dovnit�.
	
	AI_Output	(self, other, "DIA_Addon_Henry_Tribut_04_01"); //Hmmm.

	if (Npc_KnowsInfo (other, DIA_Addon_Henry_Malcom))
	{
		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_04_02"); //P�ines jsi mi zpr�vu vod na�ich d�evorubc�.
		Henry_Amount = (Henry_Amount - 100);
	};	

	if (Npc_KnowsInfo (other, DIA_Addon_Henry_MeatForMorgan))
	{
		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_04_03"); //Chce� d�lat posl��ka Krokod�lu Jackovi a zan�st Morganovi mo��lov� krysy.
		Henry_Amount = (Henry_Amount - 100);
	};
	
	if (Npc_KnowsInfo (other, DIA_Addon_Henry_BaltramPack))
	{
		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_04_04"); //M� bal��ek pro Skipa.
		Henry_Amount = (Henry_Amount - 100);
	};

	if (MIS_Henry_FreeBDTTower == LOG_SUCCESS)
	{
		if (Henry_Amount < 500) //schon was anderes gesagt
		{
			AI_Output	(self, other, "DIA_Addon_Henry_Tribut_Add_04_00"); //A co je nejlep��,
		};
		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_Add_04_01"); //zlikvidoval jsi ty smrady, co n�m za z�dama voxidovali ve v�i.
		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_Add_04_02"); //Nikdy jsem nev��il, �e to v�ecko zm�kne� s�m.
		Henry_Amount = (Henry_Amount - 200);
	};

	if (Henry_Amount <= 0)
	{
		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_Add_04_03"); //Tak v� co? B� dovnit� zadarmo.
		
		//patch M.F. 
		self.aivar[AIV_PASSGATE] = TRUE; 
		Info_ClearChoices	(DIA_Addon_Henry_Tribut);
	}
	else
	{
		B_Henry_Gold (Henry_Amount);   

		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_04_05"); //Nebo vypadni. Je to jednoduch�.

		Info_ClearChoices	(DIA_Addon_Henry_Tribut);
		Info_AddChoice	(DIA_Addon_Henry_Tribut, "Mysl�m, �e to je moc.", DIA_Addon_Henry_Tribut_nein );

		if (Npc_HasItems (other,ItMi_Gold) >= Henry_Amount)
		{
			Info_AddChoice	(DIA_Addon_Henry_Tribut, "No dob�e, tady m� sv� zlato.", DIA_Addon_Henry_Tribut_ja );
		};
	};
};
func void DIA_Addon_Henry_Tribut_ja ()
{
	AI_Output (other, self, "DIA_Addon_Henry_Tribut_ja_15_00"); //Dob�e, tady m� to zlato.
	B_GiveInvItems (other, self, ItMi_Gold, Henry_Amount);		
	AI_Output (self, other, "DIA_Addon_Henry_Tribut_ja_04_01"); //D�ky. V�tej u n�s v t�bo�e.
	B_Henry_NoJoin();
	
	Info_ClearChoices	(DIA_Addon_Henry_Tribut);
	self.aivar[AIV_PASSGATE] = TRUE; 
};
func void DIA_Addon_Henry_Tribut_nein ()
{
	AI_Output (other, self, "DIA_Addon_Henry_Tribut_nein_15_00"); //Mysl�m, �e je to moc.
	if (Henry_Amount < 500)
	{
		AI_Output (self, other, "DIA_Addon_Henry_Tribut_nein_04_03"); //No tak, u� jsem ti slevil.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Henry_Tribut_nein_04_04"); //Tak teda vypadni.
	};
	
	Info_ClearChoices	(DIA_Addon_Henry_Tribut);
};



// ************************************************************
// ***														***
// 				Palisade - Banditen - Turmbanditen
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 		  				Hallo 2 	(Was machst du)	   
// ------------------------------------------------------------
INSTANCE DIA_Addon_Henry_Palisade(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 11;
	condition	= DIA_Addon_Henry_Palisade_Condition;
	information	= DIA_Addon_Henry_Palisade_Info;
	permanent	= FALSE;
	description	= "Co tady d�l�?";
};                       
FUNC INT DIA_Addon_Henry_Palisade_Condition()
{
	if (GregIsBack == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Henry_Palisade_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_Palisade_15_00"); //Co tady d�l�?   
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_04_01"); //Co si mysl�? Mus�m dohl�et, aby tihle mizern� darmo�lapov� v�as dostav�li palis�du.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_04_02"); //Jestli to nedod�laj, tak m� kapit�n Greg nakope tak, �e si tejden nesednu.   
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_04_03"); //A taky se star�m vo to, aby sem nelozili ��dn� cizinci.
};

// ------------------------------------------------------------
// 		  				Palisade + Turmbanditen
// ------------------------------------------------------------
INSTANCE DIA_Addon_Henry_Palisade_WhatFor(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 12;
	condition	= DIA_Addon_Henry_Palisade_WhatFor_Condition;
	information	= DIA_Addon_Henry_Palisade_WhatFor_Info;
	permanent	= FALSE;
	description	= "Pro� tu stav�te tu palis�du?";
};                       
FUNC INT DIA_Addon_Henry_Palisade_WhatFor_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Henry_Palisade))
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Henry_Palisade_WhatFor_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_Palisade_WhatFor_15_00"); //Pro� stav�te tu palis�du?
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_WhatFor_04_10"); //No, nechcem, aby to banditi m�li moc jednoduch�!
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_WhatFor_04_02"); //Ti �mejdi jsou den ode dne drzej��. Te� u� se p�r dn� pl�ej kolem t�bora jako �raloci kolem ztroskotan� lod�. 
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_WhatFor_04_11"); //P�r t�ch budi�kni�em� se usadilo ve v�i kousek na jih odsud.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_WhatFor_04_12"); //Ale to je ur�it� jenom p�edsunut� hl�dka.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_WhatFor_04_03"); //Jestli jsou v�n� tak pitom� a napadnou n�s, p�iv�t�me je tak, �e na to nezapomenou.

	Log_CreateTopic (TOPIC_Addon_BanditsTower,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_BanditsTower,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BanditsTower,"Ve v�i ji�n� od pir�tsk�ho t�bora se usadilo p�r bandit� a opevnili ji.");

};

// ------------------------------------------------------------
// 		  				Turmbanditen Report
// ------------------------------------------------------------
func void B_Henry_WhereIsTower()
{	
	AI_Output (other,self ,"DIA_Addon_Francis_BanditsDead_15_08"); //Kde p�esn� le�� ta v�?
	AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_07"); //Kdy� odsud vyjde�, dr� se doprava.
	AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_08"); //Na mal�m �tesu tam uvid� v�.
};
// ------------------------------------------------------------
INSTANCE DIA_Addon_Henry_Turmbanditen(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 13;
	condition	= DIA_Addon_Henry_Turmbanditen_WhatFor_Condition;
	information	= DIA_Addon_Henry_Turmbanditen_WhatFor_Info;
	permanent	= TRUE;
	description	= "Co se t��e t�ch bandit� ve v�i...";
};                       
FUNC INT DIA_Addon_Henry_Turmbanditen_WhatFor_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Henry_Palisade_WhatFor))
	&& (MIS_Henry_FreeBDTTower != LOG_SUCCESS)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Henry_Turmbanditen_WhatFor_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_Turmbanditen_15_00"); //Co se t��e t�ch bandit� ve v�i...
	
	if (C_TowerBanditsDead() == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_01"); //Ano?
		AI_Output (other,self ,"DIA_Addon_Francis_BanditsDead_15_01"); //U� je po nich.
		if (MIS_Henry_FreeBDTTower == LOG_RUNNING)
		{
			AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_02"); //V�born�! Tak�e m�me o probl�m m��!
		}
		else //auf eigene Faust
		{
			AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_03"); //To jsi je v�ecky zlikvidoval s�m? Tak to v�echna �est!
			AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_04"); //Mo�n� �e z tebe jednou bude pravej pir�t.
		};
		//-----------------------------------------			
		SawPirate.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(SawPirate,"START");
		HammerPirate.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(HammerPirate,"START");
		//-----------------------------------------	
		MIS_Henry_FreeBDTTower = LOG_SUCCESS;
		
		B_LogEntry (TOPIC_Addon_BanditsTower,"Banditi ve v�i jsou mrtv�.");
		
		B_GivePlayerXP (XP_Addon_Henry_FreeBDTTower);
	}
	else if (MIS_Henry_FreeBDTTower == LOG_RUNNING)
	{
		AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_07"); //Co je�t� pot�ebuje�?
		B_Henry_WhereIsTower();
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_05"); //Jestli je ale chce� zlikvidovat v�ecky S�M, tak na to rovnou zapome�!
		AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_06"); //Za chv�li tam po�lu dva lidi z m�ho p�epadov�ho odd�lu. Ti si s nima porad�.
		Knows_HenrysEntertrupp = TRUE;
	};
};

// ------------------------------------------------------------
// 		  			Warum Krieg mit Banditen
// ------------------------------------------------------------
INSTANCE DIA_Addon_Henry_Palisade_Bandits(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 14;
	condition	= DIA_Addon_Henry_Palisade_Bandits_Condition;
	information	= DIA_Addon_Henry_Palisade_Bandits_Info;
	permanent	= FALSE;
	description	= "Pro� by na tebe m�li banditi �to�it?";
};                       
FUNC INT DIA_Addon_Henry_Palisade_Bandits_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Henry_Palisade_WhatFor))
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Henry_Palisade_Bandits_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_Palisade_Bandits_15_00"); //Pro� by na v�s m�li banditi �to�it?
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_04"); //Proto�e spolu V�L��ME! Co si mysl�?
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_05"); //Nap�ed to bylo v�ecko p�kn� � p�ivezli jsme je sem, oni si odpochodovali rovnou do t� sv� ba�iny a n�s tady nechali.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_06"); //Ale te� ti parchanti za�to�ej na ka�d�ho, kdo k nim nepat��.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_07"); //Kdo v�, co je to popadlo.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_08"); //Mo�n� jdou po na�ich lod�ch. Proto�e jinak se odsu� nedostanou. 
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_09"); //Na tohle by ses m�l zeptat Skipa. B�val s nima � a sotva zachr�nil holej �ivot, kdy� od nich zdrhal.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_10"); //Je to celkem zaj�mavej p��b�h.
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_11"); //(zlomysln�) �koda �e ho neusly��. Beztak jsi nezaplatil m�tn�.
		Henry_Zoll_WhatFor = TRUE;
	};
};



// ************************************************************
// ***														***
// 							Entertrupp
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 		  		Ich will in deinen Entertrupp
// ------------------------------------------------------------
var int Henry_EnterCrewMember;
// ------------------------------------------------------------
instance DIA_Addon_Henry_Entercrew(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 31;
	condition	= DIA_Addon_Henry_Entercrew_Condition;
	information	= DIA_Addon_Henry_Entercrew_Info;
	permanent	= TRUE;
	description	= "Chci se p�idat do tv� n�jezdnick� party.";
};                       
FUNC INT DIA_Addon_Henry_Entercrew_Condition()
{
	if (Knows_HenrysEntertrupp == TRUE)
	&& (Henry_EnterCrewMember == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Henry_Entercrew_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_Entercrew_15_00"); //Chci se p�idat k va�emu n�jezdnick�mu odd�lu.
	
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_00"); //(sm�je se) P�ese m� tak lehko neprojde�, hochu!
		AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_01"); //Nap�ed si promluvme, jestli se v�bec dostane� DO T�BORA!
		Henry_Zoll_WhatFor = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Henry_Entercrew_04_06"); //Tak t� teda v�t�m ve sv� n�jezdnick� skupin�!
		AI_Output (self ,other,"DIA_Addon_Henry_Entercrew_04_07"); //Dal�� bojovn�k, kterej n�m pom��e dr�et bandity od t�la. 
		if (MIS_Henry_FreeBDTTower == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Addon_Henry_Entercrew_Add_04_02"); //Hmm, cht�l jsem ��ct, aby sis vzal n�koho z kluk� a vykou�il ty �mejdy z t� jejich v�e.
			AI_Output (self, other, "DIA_Addon_Henry_Entercrew_Add_04_03"); //Jen�e ty u� jsi to ud�lal.
		}
		else 
		{
			if (Npc_IsDead(SawPirate))
			&& (Npc_IsDead(HammerPirate))
			{
				AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_04"); //No, oba m� chlapi jsou mrtv�, tak�e to bude� muset ud�lat s�m.
				AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_05"); //Zlikviduj ty bandity ve v�i!
				
				B_LogEntry (TOPIC_Addon_BanditsTower,"Henry chce, abych bandity vyhnal z v�e, ale nem��e mi v tom nijak pomoci.");
			}
			else
			{
				AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_06"); //Vem si n�koho z chlap� a ud�lejte s t�ma banditama ve v�i kr�tkej proces.
				Henry_GetPartyMember = TRUE;
			
				B_LogEntry (TOPIC_Addon_BanditsTower,"Henry chce, abych bandity vyhnal z v�e. P�itom s sebou m��u vz�t jednoho z jeho chlap�.");
			};

			B_Henry_WhereIsTower();
			
			AI_Output (other,self ,"DIA_Addon_Henry_Entercrew_15_09"); //Rozkaz, pane!
	
			MIS_Henry_FreeBDTTower = LOG_RUNNING;
		};
		Henry_EnterCrewMember = TRUE;
	};
};

// ------------------------------------------------------------
// 						Dann geh zu Owen
// ------------------------------------------------------------
instance DIA_Addon_Henry_Owen		(C_INFO)
{
	npc		 	= PIR_1354_Addon_Henry;
	nr		 	= 32;
	condition	= DIA_Addon_Henry_Owen_Condition;
	information	= DIA_Addon_Henry_Owen_Info;

	description	= "Pot�ebuje� ode m� je�t� n�co?";
};
func int DIA_Addon_Henry_Owen_Condition ()
{
	if (MIS_Henry_FreeBDTTower == LOG_SUCCESS)
	&& (Henry_EnterCrewMember == TRUE)
	&& (!Npc_IsDead (Malcom))
	{
		return TRUE;
	};
};
func void DIA_Addon_Henry_Owen_Info ()
{
	AI_Output (other, self, "DIA_Addon_Henry_Owen_15_01"); //Pot�ebuje� ode m� je�t� n�co?
	AI_Output (self, other, "DIA_Addon_Henry_Owen_04_01"); //U� cel� dny �ek�m na d�evo na na�i palis�du. 
	AI_Output (self, other, "DIA_Addon_Henry_Owen_04_05"); //Malcolm a Owen u� se m�li p�ed �asem vr�tit.
	if (!Npc_KnowsInfo (other, DIA_Addon_Henry_Malcom))
	{
		AI_Output (self, other, "DIA_Addon_Henry_Owen_04_06"); //D�evorubeckej t�bor nen� daleko, v �dol� na jihov�chod.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Henry_Owen_04_07"); //Malcolm �ek, �e to potrv� CHV�LI, ne V��NOST!
	};
	
	AI_Output (self, other, "DIA_Addon_Henry_Owen_04_08"); //Vy�i� jim, �e tu na to d�evo �ek�me!
	AI_Output (self, other, "DIA_Addon_Henry_Owen_04_09"); //Ne, po�kej, �ekni to OWENOVI. Malcolm je moc nespolehlivej.
	
	
	B_MalcomExident();
	
	MIS_Henry_HolOwen = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Addon_HolOwen,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_HolOwen,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_HolOwen,"Henry �ek� na d�evo na palis�du. M�m o tom informovat Owena, kter�ho najdu u Malcolma u �dol�.");  
};

// ------------------------------------------------------------
// 						Owen2 Report
// ------------------------------------------------------------
func void B_Addon_Henry_MalcomsDead()
{	
	AI_Output (self, other, "DIA_Addon_Henry_Owen2_Add_04_00"); //Co je s Malcolmem?
	AI_Output (other, self, "DIA_Addon_Henry_Owen2_Add_15_01"); //Je mrtv�.
	AI_Output (self, other, "DIA_Addon_Henry_Owen2_Add_04_02"); //Hm, to m�l teda sm�lu.
		
};
// ------------------------------------------------------------
instance DIA_Addon_Henry_Owen2		(C_INFO)
{
	npc		 	= 	PIR_1354_Addon_Henry;
	nr		 	= 	33;
	condition	= 	DIA_Addon_Henry_Owen2_Condition;
	information	= 	DIA_Addon_Henry_Owen2_Info;
	permanent	= 	TRUE;
	description	= 	"Co se t��e toho d�evorubce Owena...";
};
func int DIA_Addon_Henry_Owen2_Condition ()
{
	if (MIS_Henry_HolOwen == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Henry_Owen2_Info ()
{
	AI_Output (other, self, "DIA_Addon_Henry_Owen2_15_00"); //Co se t��e d�evorubce Owena...
	
	if ((Npc_IsDead(PIR_1367_Addon_Owen)) == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Henry_Owen2_15_01"); //Je mrtv�.
		AI_Output (self, other, "DIA_Addon_Henry_Owen2_04_02"); //Sakra! Tak to nejsp� budu muset poslat n�koho dal��ho!
		AI_Output (self, other, "DIA_Addon_Henry_Owen2_04_03"); //(brbl�) Nejvy��� �as, aby Morgan kone�n� vyrazil a zlikvidoval tady ty potvory.
		B_Addon_Henry_MalcomsDead();
		//AI_Output (self, other, "DIA_Addon_Henry_Owen2_Add_04_01"); //Was? Er auch? Verdammte Mistviecher!
		MIS_Henry_HolOwen = LOG_OBSOLETE;
	
		B_LogEntry	(TOPIC_Addon_HolOwen,"Owen i Malcom jsou mrtv�.");	
		Log_SetTopicStatus (TOPIC_Addon_HolOwen,LOG_OBSOLETE);
	  
	}
	else if (Owen_ComesToHenry == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Henry_Owen2_15_03"); //Owen ti p�inese d�evo.
		AI_Output (self, other, "DIA_Addon_Henry_Owen2_04_04"); //V�born�. A taky v hodin� dvan�ct�.
		B_Addon_Henry_MalcomsDead();
		AI_Output (self, other, "DIA_Addon_Henry_Owen2_04_05"); //Tady m� odm�nu.
		B_GiveInvItems (self, other, ItMi_Gold, 200);
		B_StartOtherRoutine	(PIR_1367_Addon_Owen,"PostStart");
		
		
		B_LogEntry	(TOPIC_Addon_HolOwen,"Owen p�ed� d�evo Henrymu.");
		
		MIS_Henry_HolOwen = LOG_SUCCESS;
		
		B_GivePlayerXP (XP_Addon_Owen_ComesToHenry);
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Henry_Owen2_15_06"); //M��e� mi je�t� zopakovat, kde le�� ten jeho t�bor?
		AI_Output (self, other, "DIA_Addon_Henry_Owen2_04_07"); //Nen� to daleko odsud, na jihov�chod pod�l �dol�.
	};
};

// ************************************************************
// 		  						PERM
// ************************************************************
var int Henry_PERM_Once;
// ------------------------------------------------------------
instance DIA_Addon_Henry_Palisade_CanHelp(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 34;
	condition	= DIA_Addon_Henry_Palisade_CanHelp_Condition;
	information	= DIA_Addon_Henry_Palisade_CanHelp_Info;
	permanent	= TRUE;
	description	= "Pot�ebuje� pomoct?";
};                       
FUNC INT DIA_Addon_Henry_Palisade_CanHelp_Condition()
{
	if (MIS_Henry_HolOwen == LOG_SUCCESS)
	|| (MIS_Henry_HolOwen == LOG_OBSOLETE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Henry_Palisade_CanHelp_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_Palisade_CanHelp_15_00"); //Pot�ebuje� pomoc?
	if (Henry_PERM_Once == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Henry_Palisade_CanHelp_04_01"); //V� n�co o stavb� palis�d? 
		AI_Output (other,self ,"DIA_Addon_Henry_Palisade_CanHelp_15_02"); //Ne, moc ne.
		AI_Output (self ,other,"DIA_Addon_Henry_Palisade_CanHelp_04_03"); //Pak mi tu k ni�emu nejsi. B� rad�i pom�hat n�komu jin�mu.
		Henry_PERM_Once = TRUE;
	};
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_CanHelp_04_04"); //Klidn� se t�eba zpij do n�moty, ale neple� se tu mejm d�ln�k�m. 
};



// ************************************************************
// 							Teach 2h
// ************************************************************
// ------------------------------------------------------------
// 		  					Wanna Learn
// ------------------------------------------------------------
INSTANCE DIA_Addon_Henry_WhatTeach(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 21;
	condition	= DIA_Addon_Henry_WhatTeach_Condition;
	information	= DIA_Addon_Henry_WhatTeach_Info;
	permanent	= TRUE;
	description	= "M��e� ze m� ud�lat lep��ho bojovn�ka?";
};                       
FUNC INT DIA_Addon_Henry_WhatTeach_Condition()
{
	if (Knows_HenrysEntertrupp == TRUE)
	&& (Henry_Addon_TeachPlayer == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Henry_WhatTeach_Info()
{	
	AI_Output (other, self, "DIA_Addon_Henry_WhatTeach_Add_15_00"); //M��e� mi vysv�tlit, jak se st�t lep��m bojovn�kem:
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Henry_WhatTeach_Add_04_01"); //(sm�je se) Nap�ed zapla� mejto. Pak si teprve promluv�me vo boji.
		AI_Output (self ,other,"DIA_Addon_Henry_WhatTeach_Add_04_02"); //(�ibalsky) V�ecko je v cen�.
		Henry_Zoll_WhatFor = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Henry_WhatTeach_Add_04_03"); //Jasn�, pro� ne?
		Henry_Addon_TeachPlayer = TRUE;
		
		Log_CreateTopic (Topic_Addon_PIR_Teacher,LOG_NOTE);
		B_LogEntry (Topic_Addon_PIR_Teacher,Log_Text_Addon_HenryTeach);
	};
};

// ------------------------------------------------------------
// 		  					Teach 2h
// ------------------------------------------------------------
var int Henry_merke2h;
var int Henry_Labercount;
// ------------------------------------------------------------
func VOID B_Henry_CommentFightSkill ()
{
	if (Henry_Labercount == 0)
	{
		AI_Output (self,other,"DIA_Addon_Henry_CommentFightSkill_04_01"); //U�� se rychle, mo�n� z tebe jednou bude opravdickej pir�t.  
		Henry_Labercount = 1;
	}
	else if (Henry_Labercount == 1)
	{
		AI_Output (self,other,"DIA_Addon_Henry_CommentFightSkill_04_02"); //Kdy� to takhle p�jde d�l, brzo si na lodi vysta�� �pln� s�m.
		Henry_Labercount = 2;
	}
	else if (Henry_Labercount == 2)
	{
		AI_Output (self,other,"DIA_Addon_Henry_CommentFightSkill_04_03"); //A nezapome�, �e kdo vykrejv� �toky, �ije d�l! 
		Henry_Labercount = 0;
	};
};
// ------------------------------------------------------------
instance DIA_Addon_Henry_Teach(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 6;
	condition	= DIA_Addon_Henry_Teach_Condition;
	information	= DIA_Addon_Henry_Teach_Info;
	permanent	= TRUE;
	description	= "Chci se n�co nau�it!";
};                       
FUNC INT DIA_Addon_Henry_Teach_Condition()
{
	if (Henry_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Henry_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_Teach_15_00"); //Nau� m� n�co!
					
	Henry_merke2h = other.HitChance[NPC_TALENT_2H];  
	
	Info_ClearChoices 	(DIA_Addon_Henry_Teach);
	Info_AddChoice 		(DIA_Addon_Henry_Teach,	DIALOG_BACK		,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h1		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))		,DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h5		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*5)		,DIA_Addon_Henry_Teach_2H_5);	
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))	,DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Addon_Henry_Teach_CB_5);
};
FUNC VOID DIA_Addon_Henry_Teach_Back()
{
	if (other.HitChance[NPC_TALENT_2H] > Henry_Merke2h)
	{
		B_Henry_CommentFightSkill ();
	}
	else if  (other.HitChance[NPC_TALENT_2H] >= 90)
	{
		AI_Output (self ,other,"DIA_Addon_Henry_Teach_Back_04_00"); //Za��n� bejt fakt dobrej.
	};
	Info_ClearChoices (DIA_Addon_henry_Teach);
};

func void DIA_Addon_Henry_Teach_CB_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 1, 75);
	
	Info_ClearChoices 	(DIA_Addon_Henry_Teach);
	Info_AddChoice 		(DIA_Addon_Henry_Teach,	DIALOG_BACK		,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h1		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))		,DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h5		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*5)		,DIA_Addon_Henry_Teach_2H_5);	
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))	,DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Addon_Henry_Teach_CB_5);
};

func void DIA_Addon_Henry_Teach_CB_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 5, 75);
	
	Info_ClearChoices 	(DIA_Addon_Henry_Teach);
	Info_AddChoice 		(DIA_Addon_Henry_Teach,	DIALOG_BACK		,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h1		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))		,DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h5		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*5)		,DIA_Addon_Henry_Teach_2H_5);	
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))	,DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Addon_Henry_Teach_CB_5);
};

func VOID DIA_Addon_Henry_Teach_2H_1()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 90);

	Info_ClearChoices 	(DIA_Addon_Henry_Teach);
	Info_AddChoice 		(DIA_Addon_Henry_Teach,	DIALOG_BACK		,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h1		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))		,DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h5		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*5)		,DIA_Addon_Henry_Teach_2H_5);	
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))	,DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Addon_Henry_Teach_CB_5);
};
FUNC VOID DIA_Addon_Henry_Teach_2H_5()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 90);
		
	Info_ClearChoices 	(DIA_Addon_Henry_Teach);
	Info_AddChoice 		(DIA_Addon_Henry_Teach,	DIALOG_BACK		,DIA_Addon_Henry_Teach_Back);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h1		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))		,DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h5		, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)*5)		,DIA_Addon_Henry_Teach_2H_5);	
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))	,DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice		(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Addon_Henry_Teach_CB_5);
};



// ************************************************************
// 		  						Greg
// ************************************************************
INSTANCE DIA_Addon_Henry_Palisade_Train(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 11;
	condition	= DIA_Addon_Henry_Palisade_Train_Condition;
	information	= DIA_Addon_Henry_Palisade_Train_Info;
	permanent	= FALSE;
	description	= "Greg je tv�j ��f?";
};                       
FUNC INT DIA_Addon_Henry_Palisade_Train_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Henry_Palisade))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Henry_Palisade_Train_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Henry_Palisade_Train_15_00"); //Greg je tv�j ��f?
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Train_04_01"); //Jasn� �e jo. A pro tebe je to KAPIT�N Greg, je to jasn�?   
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Train_04_02"); //Je to skv�lej chlap. A� ho potk�, dej si bacha, abys ho nena�tval - nejsp� bys pak skapal d��v, ne� bys toho moh litovat. 
	
	if (PIR_1300_Addon_Greg_NW.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (other,self ,"DIA_Addon_Henry_Palisade_Train_15_03"); //U� jsem se s n�m setkal.
		AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Train_04_04"); //T�m l�p. Tak�e v�, vo �em mluv�m.   
	};

	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Train_04_05"); //Te� ale v t�bo�e nen�.  
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Train_04_06"); //Prozat�m to tu vede Francis.   
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Train_04_07"); //Cel� dny vysed�v� naproti Gregovy chatr�e a sleduje n�s p�i pr�ci. 
};

// ************************************************************
// 		  				Dein eigener Entertrupp
// ************************************************************
INSTANCE DIA_Addon_Henry_YourOwnTrupp (C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 1;
	condition	= DIA_Addon_Henry_YourOwnTrupp_Condition;
	information	= DIA_Addon_Henry_YourOwnTrupp_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Henry_YourOwnTrupp_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Henry_YourOwnTrupp_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Henry_Add_04_04"); //Kapit�n ti dal tv�j vlastn� odd�l, ne?
	AI_Output (self ,other,"DIA_Addon_Henry_Add_04_05"); //Tak dohl�dni, aby tv� ho�i m�li co d�lat!
	AI_StopProcessInfos (self);
};



/*
AI_Output (other,self ,"DIA_Addon_Henry_HenrysCrew_15_00"); //Wer geh�rt zu deinem Trupp?
AI_Output (other,self ,"DIA_Addon_Henry_Morgan_15_00"); //Wo finde ich Morgan?
*/
