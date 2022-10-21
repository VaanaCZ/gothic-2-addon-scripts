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
			AI_Output (self ,other,"DIA_Addon_Henry_Gold500_04_00"); //500 sztuk z�ota.
		}
		else if (gold == 400)
		{
			AI_Output (self ,other,"DIA_Addon_Henry_Gold400_04_00"); //400 sztuk z�ota.
		}
		else if (gold == 300)
		{
			AI_Output (self ,other,"DIA_Addon_Henry_Gold300_04_00"); //300 sztuk z�ota.
		}
		else if (gold == 200)
		{
			AI_Output (self ,other,"DIA_Addon_Henry_Gold200_04_00"); //200 sztuk z�ota.
		}
		else if (gold == 100)
		{
			AI_Output (self ,other,"DIA_Addon_Henry_Gold100_04_00"); //100 sztuk z�ota.
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
	AI_Output (self ,other,"DIA_Addon_Henry_Hello_04_00"); //St�j, kto idzie?
	AI_Output (self ,other,"DIA_Addon_Henry_Hello_04_01"); //Sw�j czy wr�g?
	
	Info_ClearChoices (DIA_Addon_Henry_Hello);
	Info_AddChoice (DIA_Addon_Henry_Hello,"Wr�g!",DIA_Addon_Henry_Hello_Feind);
	Info_AddChoice (DIA_Addon_Henry_Hello,"Sw�j!",DIA_Addon_Henry_Hello_Freund);
};
var int Henry_SC_Frech;
FUNC VOID DIA_Addon_Henry_Hello_Feind()
{
	AI_Output (other,self ,"DIA_Addon_Henry_Hello_Feind_15_00"); //Wr�g!
	AI_Output (self ,other,"DIA_Addon_Henry_Hello_Feind_04_01"); //Spryciarz... Chcesz, �ebym ci porachowa� ko�ci? 
	AI_Output (self ,other,"DIA_Addon_Henry_Hello_Feind_04_02"); //M�w, co masz do powiedzenia, albo odejd�.
	
	Henry_SC_Frech = TRUE;

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,Pir_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;	
	
	Info_ClearChoices (DIA_Addon_Henry_Hello);
};

FUNC VOID DIA_Addon_Henry_Hello_Freund()
{
	AI_Output (other,self ,"DIA_Addon_Henry_Hello_Freund_15_00"); //Sw�j!
	AI_Output (self ,other,"DIA_Addon_Henry_Hello_Freund_04_01"); //Ka�dy tak mo�e powiedzie�. Nie znam ci�. Czego tutaj szukasz?
	
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
	AI_Output (self, other,"DIA_Addon_Henry_SecondWarn_04_00"); //Jeszcze jeden krok i rzuc� ci� rekinom na po�arcie!

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
	
	AI_Output (self, other,"DIA_Addon_Henry_Attack_04_00"); //Sam tego chcia�e�. 
	
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
	description	= "Chc� wej��!";
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
	AI_Output (other,self ,"DIA_Addon_Henry_WantEnter_15_00"); //Chc� wej��!
	AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_01"); //Naprawd�? To ci� b�dzie kosztowa�... 

	B_Henry_Gold (500);

	if (Henry_Zoll_WhatFor == FALSE)
	{
		AI_Output (other,self ,"DIA_Addon_Henry_WantEnter_15_02"); //Niby czemu?
		AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_03"); //Musisz wszystko komplikowa�? 
		AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_04"); //W tym obozie jest wiele rzeczy, kt�re mog� ci� zainteresowa�.
		Henry_Zoll_WhatFor = TRUE;
	};
		 
	var C_Item itm; itm = Npc_GetEquippedArmor(other);
	
	if	((Hlp_IsItem(itm, ITAR_KDF_L) == TRUE)
	||	 (Hlp_IsItem(itm, ITAR_KDF_H) == TRUE)
	||   (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)
	||	 (Hlp_IsItem(itm, ITAR_MIL_L) == TRUE)
	||	 (Hlp_IsItem(itm, ITAR_MIL_M) == TRUE))
	{
		AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_07"); //A ty wygl�dasz na kogo�, kto ma pieni�dze. 
		AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_08"); //Nie zedr� przecie� z ciebie ostatniej koszuli. Zobaczysz, op�aci ci si�. 
		AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_09"); //No, chyba �e ten str�j ukrad�e�.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Henry_WantEnter_04_10"); //Masz przy sobie pieni�dze, prawda?   
	};
};

// ------------------------------------------------------------
// 							500 zahlen!
// ------------------------------------------------------------
func void B_Henry_NoJoin()
{	
	AI_Output (self, other, "DIA_Addon_Henry_Add_04_00"); //Je�li chcesz do nas do��czy�, to mam dla ciebie z�� wiadomo��, ch�opcze.
	AI_Output (self, other, "DIA_Addon_Henry_Add_04_01"); //Kapitan wyp�yn�� w rejs, a tylko on decyduje, kogo przyjmie si� do za�ogi.
	AI_Output (self, other, "DIA_Addon_Henry_Add_04_02"); //Ale mo�esz tu zosta� do jego powrotu.
	AI_Output (self, other, "DIA_Addon_Henry_Add_04_03"); //Je�li nie b�dziesz sprawia� k�opot�w, rzecz jasna.
};
// ------------------------------------------------------------



instance DIA_Addon_Henry_Einigen2		(C_INFO)
{
	npc		 	= PIR_1354_Addon_Henry;
	nr		 	= 2;
	condition	= DIA_Addon_Henry_Einigen2_Condition;
	information	= DIA_Addon_Henry_Einigen2_Info;

	description	= "Oto twoje 500 sztuk z�ota.";
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
	AI_Output (other, self, "DIA_Addon_Henry_Einigen2_15_00"); //Oto twoje 500 sztuk z�ota.
	B_GiveInvItems (other, self, ItMi_Gold, 500);		
	AI_Output (self, other, "DIA_Addon_Henry_Einigen2_04_01"); //Wspaniale. Witamy w naszym skromnym obozie.  
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

	description	= "Mo�e si� potargujemy?";
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
	AI_Output (other, self, "DIA_Addon_Henry_Einigen_15_00"); //Mo�e si� potargujemy?
	AI_Output (self, other, "DIA_Addon_Henry_Einigen_04_01"); //C�, daj mi jaki� pow�d, dla kt�rego mia�bym opu�ci� cen�.
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
	description	= "Mam mi�so dla Morgana.";
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
	AI_Output (other,self ,"DIA_Addon_Henry_MeatForMorgan_15_00"); //Mam mi�so dla Morgana.
	AI_Output (self ,other,"DIA_Addon_Henry_MeatForMorgan_04_01"); //Aha. A kto ci� przysy�a?  
	AI_Output (other,self ,"DIA_Addon_Henry_MeatForMorgan_15_02"); //Jack Aligator. M�wi, �e Morgan czeka na dostaw�.
	AI_Output (self ,other,"DIA_Addon_Henry_MeatForMorgan_04_03"); //Tak, tak.. Jakby sam nie m�g� si� ruszy�...  
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

	description	= "Malcolm mnie przysy�a. ";
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
	AI_Output (other, self, "DIA_Addon_Henry_Malcom_15_00"); //Malcolm mnie przysy�a. M�wi�, �e na drewno przyjdzie troch� poczeka�.
	AI_Output (self, other, "DIA_Addon_Henry_Malcom_04_01"); //Tak, tak... Powinienem by� wiedzie�. Jak zwykle, b�dziemy czeka� ca�e wieki.

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

	description	= "Mam przesy�k� dla Skipa.";
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
	AI_Output (other, self, "DIA_Addon_Henry_BaltramPack_15_00"); //Mam przesy�k� dla Skipa. Jest w �rodku?
	AI_Output (self, other, "DIA_Addon_Henry_BaltramPack_04_01"); //Tak, jest w �rodku. Co� jeszcze?
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
	description = "Wpu�� mnie.";
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

	AI_Output	(other, self, "DIA_Addon_Henry_Tribut_15_00"); //Wpu�� mnie.
	
	AI_Output	(self, other, "DIA_Addon_Henry_Tribut_04_01"); //Hmm...

	if (Npc_KnowsInfo (other, DIA_Addon_Henry_Malcom))
	{
		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_04_02"); //Przynios�e� mi wiadomo�� od drwali.
		Henry_Amount = (Henry_Amount - 100);
	};	

	if (Npc_KnowsInfo (other, DIA_Addon_Henry_MeatForMorgan))
	{
		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_04_03"); //Jeste� pomocnikiem Jacka Aligatora i masz mi�so dla Morgana.
		Henry_Amount = (Henry_Amount - 100);
	};
	
	if (Npc_KnowsInfo (other, DIA_Addon_Henry_BaltramPack))
	{
		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_04_04"); //Masz paczk� dla Skipa.
		Henry_Amount = (Henry_Amount - 100);
	};

	if (MIS_Henry_FreeBDTTower == LOG_SUCCESS)
	{
		if (Henry_Amount < 500) //schon was anderes gesagt
		{
			AI_Output	(self, other, "DIA_Addon_Henry_Tribut_Add_04_00"); //A co najciekawsze...
		};
		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_Add_04_01"); //Uda�o ci si� pokona� tych bandzior�w z wie�y.
		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_Add_04_02"); //Nie my�la�em, �e uda ci si� tego dokona�!
		Henry_Amount = (Henry_Amount - 200);
	};

	if (Henry_Amount <= 0)
	{
		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_Add_04_03"); //Wiesz, co ci powiem? Wchod� za darmo...
		
		//patch M.F. 
		self.aivar[AIV_PASSGATE] = TRUE; 
		Info_ClearChoices	(DIA_Addon_Henry_Tribut);
	}
	else
	{
		B_Henry_Gold (Henry_Amount);   

		AI_Output	(self, other, "DIA_Addon_Henry_Tribut_04_05"); //...albo odejd�.

		Info_ClearChoices	(DIA_Addon_Henry_Tribut);
		Info_AddChoice	(DIA_Addon_Henry_Tribut, "To zbyt wiele.", DIA_Addon_Henry_Tribut_nein );

		if (Npc_HasItems (other,ItMi_Gold) >= Henry_Amount)
		{
			Info_AddChoice	(DIA_Addon_Henry_Tribut, "Dobrze. Tu jest twoje z�oto.", DIA_Addon_Henry_Tribut_ja );
		};
	};
};
func void DIA_Addon_Henry_Tribut_ja ()
{
	AI_Output (other, self, "DIA_Addon_Henry_Tribut_ja_15_00"); //Dobrze. Tu jest twoje z�oto.
	B_GiveInvItems (other, self, ItMi_Gold, Henry_Amount);		
	AI_Output (self, other, "DIA_Addon_Henry_Tribut_ja_04_01"); //Dzi�ki. Witamy w naszych skromnych progach.
	B_Henry_NoJoin();
	
	Info_ClearChoices	(DIA_Addon_Henry_Tribut);
	self.aivar[AIV_PASSGATE] = TRUE; 
};
func void DIA_Addon_Henry_Tribut_nein ()
{
	AI_Output (other, self, "DIA_Addon_Henry_Tribut_nein_15_00"); //To zbyt wiele.
	if (Henry_Amount < 500)
	{
		AI_Output (self, other, "DIA_Addon_Henry_Tribut_nein_04_03"); //No co ty? I tak ju� spu�ci�em z ceny.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Henry_Tribut_nein_04_04"); //Daj mi spok�j, co?
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
	description	= "Co robisz?";
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
	AI_Output (other,self ,"DIA_Addon_Henry_Palisade_15_00"); //Co robisz?   
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_04_01"); //A na co to wygl�da? Nadzoruj� budow� palisady, �eby te lenie zrobi�y to na czas.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_04_02"); //Je�li tego nie doko�czymy, to kapitan Greg da nam popali�.   
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_04_03"); //Pilnuj� te�, aby nikt niepowo�any tu nie wszed�.
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
	description	= "Po co stawiacie t� palisad�?";
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
	AI_Output (other,self ,"DIA_Addon_Henry_Palisade_WhatFor_15_00"); //Po co stawiacie t� palisad�?
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_WhatFor_04_10"); //Cho�by po to, �eby utrudni� �ycie bandytom!
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_WhatFor_04_02"); //Te sukinkoty podchodz� coraz bli�ej. Zupe�nie jak rekiny okr��aj�ce rozbitka na pe�nym morzu. 
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_WhatFor_04_11"); //Kilku z nich zaszy�o si� w wie�y na po�udniu.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_WhatFor_04_12"); //Ale s�dz�, �e to tylko zwiad.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_WhatFor_04_03"); //Tak wi�c, je�li w ko�cu zaatakuj�, b�dziemy przygotowani.

	Log_CreateTopic (TOPIC_Addon_BanditsTower,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_BanditsTower,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BanditsTower,"W wie�y na po�udniu od obozu pirat�w siedzi grupa bandyt�w.");

};

// ------------------------------------------------------------
// 		  				Turmbanditen Report
// ------------------------------------------------------------
func void B_Henry_WhereIsTower()
{	
	AI_Output (other,self ,"DIA_Addon_Francis_BanditsDead_15_08"); //Gdzie jest ta wie�a?
	AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_07"); //Je�li wyruszysz st�d i b�dziesz trzyma� si� prawej strony...
	AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_08"); //...to po pewnym czasie powiniene� zobaczy� wie�� na ma�ym klifie.
};
// ------------------------------------------------------------
INSTANCE DIA_Addon_Henry_Turmbanditen(C_INFO)
{
	npc			= PIR_1354_Addon_Henry;
	nr			= 13;
	condition	= DIA_Addon_Henry_Turmbanditen_WhatFor_Condition;
	information	= DIA_Addon_Henry_Turmbanditen_WhatFor_Info;
	permanent	= TRUE;
	description	= "Je�li chodzi o tych bandyt�w z wie�y...";
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
	AI_Output (other,self ,"DIA_Addon_Henry_Turmbanditen_15_00"); //Je�li chodzi o tych bandyt�w z wie�y...
	
	if (C_TowerBanditsDead() == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_01"); //Tak?
		AI_Output (other,self ,"DIA_Addon_Francis_BanditsDead_15_01"); //Ju� nie b�d� sprawia� k�opot�w.
		if (MIS_Henry_FreeBDTTower == LOG_RUNNING)
		{
			AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_02"); //Wspaniale! Jeden problem z g�owy.
		}
		else //auf eigene Faust
		{
			AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_03"); //Pokona�e� ich w pojedynk�? Panowie, czapki z g��w!
			AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_04"); //Kto wie, mo�e kiedy� b�dziesz prawdziwym piratem!
		};
		//-----------------------------------------			
		SawPirate.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(SawPirate,"START");
		HammerPirate.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine	(HammerPirate,"START");
		//-----------------------------------------	
		MIS_Henry_FreeBDTTower = LOG_SUCCESS;
		
		B_LogEntry (TOPIC_Addon_BanditsTower,"Bandyci w wie�y nie �yj�.");
		
		B_GivePlayerXP (XP_Addon_Henry_FreeBDTTower);
	}
	else if (MIS_Henry_FreeBDTTower == LOG_RUNNING)
	{
		AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_07"); //Co teraz?
		B_Henry_WhereIsTower();
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_05"); //Tylko nie my�l, �eby p�j�� tam samemu!
		AI_Output (self ,other,"DIA_Addon_Henry_Turmbanditen_04_06"); //P�niej wy�l� tam dw�ch ch�opak�w z mojej grupy aborda�owej. Oni poradz� sobie z bandytami.
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
	description	= "Dlaczego zostali�cie zaatakowani przez bandyt�w?";
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
	AI_Output (other,self ,"DIA_Addon_Henry_Palisade_Bandits_15_00"); //Dlaczego zostali�cie zaatakowani przez bandyt�w?
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_04"); //A jak s�dzisz? Wojujemy z nimi od jakiego� czasu.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_05"); //Na pocz�tku wszystko by�o w porz�dku. Przywie�li�my ich tutaj, a oni odeszli w g��b bagien i nie niepokoili nas wi�cej.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_06"); //Niestety, p�niej zacz�li napada� na ka�dego, kto nie nale�a� do ich bandy.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_07"); //Nie mam poj�cia, co za demony ich op�ta�y!
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_08"); //My�l�, �e chc� zabra� nasze �odzie, bo to chyba jedyny spos�b, by si� st�d wyrwa�. 
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_09"); //Porozmawiaj ze Skipem. By� w ich obozie i omal nie przyp�aci� tego �yciem.
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_10"); //To bardzo ciekawa historia!
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Bandits_04_11"); //Niestety, nie b�dziesz m�g� jej wys�ucha�, bo nie zap�aci�e� myta.
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
	description	= "Chc� do��czy� do waszej grupy aborda�owej.";
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
	AI_Output (other,self ,"DIA_Addon_Henry_Entercrew_15_00"); //Chc� do��czy� do waszej grupy aborda�owej.
	
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_00"); //Tym si� nie wykpisz, ch�opcze!
		AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_01"); //Najpierw musimy ustali�, czy w og�le zas�ugujesz na wpuszczenie ci� do obozu!
		Henry_Zoll_WhatFor = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Henry_Entercrew_04_06"); //Witam w mojej grupie!
		AI_Output (self ,other,"DIA_Addon_Henry_Entercrew_04_07"); //Przyda nam si� dodatkowe rami�, kiedy b�dziemy walczy� z bandytami. 
		if (MIS_Henry_FreeBDTTower == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Addon_Henry_Entercrew_Add_04_02"); //Hmm... Jak powiedzia�em, we� jednego z ch�opc�w i wykurz bandzior�w z wie�y.
			AI_Output (self, other, "DIA_Addon_Henry_Entercrew_Add_04_03"); //Ale ju� to zrobi�e�.
		}
		else 
		{
			if (Npc_IsDead(SawPirate))
			&& (Npc_IsDead(HammerPirate))
			{
				AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_04"); //Obaj moi ludzie nie �yj�. Wygl�da na to, �e b�dziesz musia� p�j�� tam sam.
				AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_05"); //Pozb�d� si� bandyt�w z wie�y!
				
				B_LogEntry (TOPIC_Addon_BanditsTower,"Henry chce, �ebym usun�� bandyt�w z wie�y. Nie mo�e jednak da� mi �adnego wsparcia.");
			}
			else
			{
				AI_Output (self ,other, "DIA_Addon_Henry_Entercrew_Add_04_06"); //We� jednego z moich ch�opc�w i pozb�d� si� bandyt�w z wie�y.
				Henry_GetPartyMember = TRUE;
			
				B_LogEntry (TOPIC_Addon_BanditsTower,"Henry chce, �ebym usun�� bandyt�w z wie�y. Mog� zabra� ze sob� jednego z jego ch�opak�w.");
			};

			B_Henry_WhereIsTower();
			
			AI_Output (other,self ,"DIA_Addon_Henry_Entercrew_15_09"); //Tak jest!
	
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

	description	= "Mog� wam jeszcze jako� pom�c?";
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
	AI_Output (other, self, "DIA_Addon_Henry_Owen_15_01"); //Mog� wam jeszcze jako� pom�c?
	AI_Output (self, other, "DIA_Addon_Henry_Owen_04_01"); //Od wielu dni czekamy na drewno potrzebne do budowy palisady. 
	AI_Output (self, other, "DIA_Addon_Henry_Owen_04_05"); //Malcolm i Owen powinni byli dostarczy� je ju� dawno temu.
	if (!Npc_KnowsInfo (other, DIA_Addon_Henry_Malcom))
	{
		AI_Output (self, other, "DIA_Addon_Henry_Owen_04_06"); //Ob�z drwali nie jest zbyt daleko - nad jeziorem le��cym w kotlinie na po�udniowym wschodzie.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Henry_Owen_04_07"); //Malcolm powiedzia�, �e dostawa si� op�ni, ale my ju� czekamy ca�e wieki!
	};
	
	AI_Output (self, other, "DIA_Addon_Henry_Owen_04_08"); //Powiedz im, �e czekamy na drewno!
	AI_Output (self, other, "DIA_Addon_Henry_Owen_04_09"); //Nie, czekaj... Powiedz to Owenowi. Malcolm jest ma�o wiarygodny.
	
	
	B_MalcomExident();
	
	MIS_Henry_HolOwen = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Addon_HolOwen,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_HolOwen,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_HolOwen,"Henry czeka przy palisadzie na drewno. Mam powiadomi� o tym Owena, kt�ry razem z Malcolmem przebywa w kotlinie.");  
};

// ------------------------------------------------------------
// 						Owen2 Report
// ------------------------------------------------------------
func void B_Addon_Henry_MalcomsDead()
{	
	AI_Output (self, other, "DIA_Addon_Henry_Owen2_Add_04_00"); //Co si� dzieje z Malcolmem?
	AI_Output (other, self, "DIA_Addon_Henry_Owen2_Add_15_01"); //Nie �yje.
	AI_Output (self, other, "DIA_Addon_Henry_Owen2_Add_04_02"); //Mia� nielichego pecha, co?
		
};
// ------------------------------------------------------------
instance DIA_Addon_Henry_Owen2		(C_INFO)
{
	npc		 	= 	PIR_1354_Addon_Henry;
	nr		 	= 	33;
	condition	= 	DIA_Addon_Henry_Owen2_Condition;
	information	= 	DIA_Addon_Henry_Owen2_Info;
	permanent	= 	TRUE;
	description	= 	"Je�li chodzi o drwala Owena...";
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
	AI_Output (other, self, "DIA_Addon_Henry_Owen2_15_00"); //Je�li chodzi o drwala Owena...
	
	if ((Npc_IsDead(PIR_1367_Addon_Owen)) == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Henry_Owen2_15_01"); //Nie �yje...
		AI_Output (self, other, "DIA_Addon_Henry_Owen2_04_02"); //Szlag by to trafi�! Teraz b�d� musia� wys�a� kogo� innego.
		AI_Output (self, other, "DIA_Addon_Henry_Owen2_04_03"); //Chyba ju� pora, �eby Morgan ruszy� ty�ek i pozby� si� tych stwor�w.
		B_Addon_Henry_MalcomsDead();
		//AI_Output (self, other, "DIA_Addon_Henry_Owen2_Add_04_01"); //Was? Er auch? Verdammte Mistviecher!
		MIS_Henry_HolOwen = LOG_OBSOLETE;
	
		B_LogEntry	(TOPIC_Addon_HolOwen,"Owen i Malcom nie �yj�.");	
		Log_SetTopicStatus (TOPIC_Addon_HolOwen,LOG_OBSOLETE);
	  
	}
	else if (Owen_ComesToHenry == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Henry_Owen2_15_03"); //Owen dostarczy drewno.
		AI_Output (self, other, "DIA_Addon_Henry_Owen2_04_04"); //Doskonale. Czas ju� najwy�szy.
		B_Addon_Henry_MalcomsDead();
		AI_Output (self, other, "DIA_Addon_Henry_Owen2_04_05"); //Oto twoja nagroda.
		B_GiveInvItems (self, other, ItMi_Gold, 200);
		B_StartOtherRoutine	(PIR_1367_Addon_Owen,"PostStart");
		
		
		B_LogEntry	(TOPIC_Addon_HolOwen,"Owen dostarczy drewno Henry'emu.");
		
		MIS_Henry_HolOwen = LOG_SUCCESS;
		
		B_GivePlayerXP (XP_Addon_Owen_ComesToHenry);
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Henry_Owen2_15_06"); //Gdzie jest ten ob�z?
		AI_Output (self, other, "DIA_Addon_Henry_Owen2_04_07"); //Kawa�ek na po�udniowy wsch�d, nieopodal kotliny.
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
	description	= "Potrzebujesz pomocy?";
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
	AI_Output (other,self ,"DIA_Addon_Henry_Palisade_CanHelp_15_00"); //Potrzebujesz pomocy?
	if (Henry_PERM_Once == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Henry_Palisade_CanHelp_04_01"); //Masz jakie� do�wiadczenie w stawianiu palisad? 
		AI_Output (other,self ,"DIA_Addon_Henry_Palisade_CanHelp_15_02"); //Niezbyt du�e.
		AI_Output (self ,other,"DIA_Addon_Henry_Palisade_CanHelp_04_03"); //W takim razie nie mam dla ciebie �adnej pracy. Poszukaj sobie innego zaj�cia.
		Henry_PERM_Once = TRUE;
	};
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_CanHelp_04_04"); //R�b, co chcesz, tylko nie przeszkadzaj mi w pracy, jasne? 
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
	description	= "Mo�esz mnie podszkoli� w walce?";
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
	AI_Output (other, self, "DIA_Addon_Henry_WhatTeach_Add_15_00"); //Mo�esz mnie podszkoli� w walce?
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Henry_WhatTeach_Add_04_01"); //Najpierw obowi�zek, potem przyjemno��. Zr�b co� po�ytecznego, to ci� naucz� walczy�.
		AI_Output (self ,other,"DIA_Addon_Henry_WhatTeach_Add_04_02"); //Wszystko jest wliczone w cen�.
		Henry_Zoll_WhatFor = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Henry_WhatTeach_Add_04_03"); //Pewnie, czemu nie?
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
		AI_Output (self,other,"DIA_Addon_Henry_CommentFightSkill_04_01"); //Szybko si� uczysz, zupe�nie jak prawdziwy pirat.  
		Henry_Labercount = 1;
	}
	else if (Henry_Labercount == 1)
	{
		AI_Output (self,other,"DIA_Addon_Henry_CommentFightSkill_04_02"); //Je�li tak dalej p�jdzie, to sam b�dziesz si� rwa� do aborda�y.
		Henry_Labercount = 2;
	}
	else if (Henry_Labercount == 2)
	{
		AI_Output (self,other,"DIA_Addon_Henry_CommentFightSkill_04_03"); //Pami�taj, �e najd�u�ej �yj� ci, kt�rzy opanowali sztuk� parowania. 
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
	description	= "Ucz mnie.";
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
	AI_Output (other,self ,"DIA_Addon_Henry_Teach_15_00"); //Ucz mnie.
					
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
		AI_Output (self ,other,"DIA_Addon_Henry_Teach_Back_04_00"); //Masz przed sob� du�o nauki.
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
	description	= "Greg jest twoim szefem?";
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
	AI_Output (other,self ,"DIA_Addon_Henry_Palisade_Train_15_00"); //Greg jest twoim szefem?
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Train_04_01"); //Zgadza si�. Ale dla ciebie to jest Kapitan Greg. Rozumiemy si�?   
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Train_04_02"); //To wielki cz�owiek. Kiedy go spotkasz, nawet nie my�l, by zrobi� co� g�upiego. Nie spodoba ci si� jego reakcja na takie zachowanie. 
	
	if (PIR_1300_Addon_Greg_NW.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (other,self ,"DIA_Addon_Henry_Palisade_Train_15_03"); //Ju� z nim rozmawia�em.
		AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Train_04_04"); //W takim razie wiesz, o czym m�wi�.   
	};

	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Train_04_05"); //Niestety, nie ma go w tej chwili w obozie.  
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Train_04_06"); //Jego zast�pc� jest Francis.   
	AI_Output (self ,other,"DIA_Addon_Henry_Palisade_Train_04_07"); //Ca�ymi dniami siedzi przed chat� Grega i gapi si� na nas jak sroka w gnat. 
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
	AI_Output (self ,other,"DIA_Addon_Henry_Add_04_04"); //Kapitan powierzy� ci dow�dztwo nad grup� uderzeniow�?
	AI_Output (self ,other,"DIA_Addon_Henry_Add_04_05"); //Ch�opakom przyda si� troch� pracy!
	AI_StopProcessInfos (self);
};



/*
AI_Output (other,self ,"DIA_Addon_Henry_HenrysCrew_15_00"); //Wer geh�rt zu deinem Trupp?
AI_Output (other,self ,"DIA_Addon_Henry_Morgan_15_00"); //Wo finde ich Morgan?
*/
