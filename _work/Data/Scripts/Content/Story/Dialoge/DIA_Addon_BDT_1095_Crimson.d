//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Crimson_EXIT   (C_INFO)
{
	npc         = BDT_1095_Addon_Crimson;
	nr          = 999;
	condition   = DIA_Addon_Crimson_EXIT_Condition;
	information = DIA_Addon_Crimson_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Crimson_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Crimson_EXIT_Info()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Crimson_PICKPOCKET (C_INFO)
{
	npc			= BDT_1095_Addon_Crimson;
	nr			= 900;
	condition	= DIA_Addon_Crimson_PICKPOCKET_Condition;
	information	= DIA_Addon_Crimson_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       
FUNC INT DIA_Addon_Crimson_PICKPOCKET_Condition()
{
	C_Beklauen (66, 66);
};
 
FUNC VOID DIA_Addon_Crimson_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Crimson_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Crimson_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Crimson_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Crimson_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Crimson_PICKPOCKET_DoIt);
};

func void DIA_Addon_Crimson_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Crimson_PICKPOCKET);
};
	
func void DIA_Addon_Crimson_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Crimson_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Crimson_Hi   (C_INFO)
{
	npc         = BDT_1095_Addon_Crimson;
	nr          = 2;
	condition   = DIA_Addon_Crimson_Hi_Condition;
	information = DIA_Addon_Crimson_Hi_Info;
	permanent   = FALSE;
	description = "Co robisz? Topisz z³oto?";
};
FUNC INT DIA_Addon_Crimson_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Crimson_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Crimson_Hi_15_00");//Co robisz? Topisz z³oto?
	AI_Output (self, other, "DIA_Addon_Crimson_Hi_10_01");//Nie, siekam cebulkê. Oczywiœcie, ¿e topiê z³oto i robiê z niego monety.
	AI_Output (self, other, "DIA_Addon_Crimson_Hi_10_02");//Pewnego piêknego popo³udnia zza rogu wyszed³ Kruk i da³ mi matrycê do wybijania monet.
	AI_Output (self, other, "DIA_Addon_Crimson_Hi_10_03");//Z jednego samorodka mogê wybiæ wiele monet - s¹ tak dobre, ¿e nikt nie zauwa¿y ró¿nicy.
};
//---------------------------------------------------------------------
//	Info How
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Crimson_How   (C_INFO)
{
	npc         = BDT_1095_Addon_Crimson;
	nr          = 2;
	condition   = DIA_Addon_Crimson_How_Condition;
	information = DIA_Addon_Crimson_How_Info;
	permanent   = FALSE;
	description = "Ile monet dasz mi za samorodek?";
};
FUNC INT DIA_Addon_Crimson_How_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Crimson_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Crimson_How_Info()
{
	AI_Output (other, self, "DIA_Addon_Crimson_How_15_00");//Ile monet dasz mi za samorodek?
	AI_Output (self, other, "DIA_Addon_Crimson_How_10_01");//Nie znam ciê za dobrze, ale dam ci cenê jak dla przyjaciela. Za samorodek dostaniesz....
	B_Say_Gold (self, other, 10);
};	
//---------------------------------------------------------------------
//	Info Feilsch
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Crimson_Feilsch   (C_INFO)
{
	npc         = BDT_1095_Addon_Crimson;
	nr          = 2;
	condition   = DIA_Addon_Crimson_Feilsch_Condition;
	information = DIA_Addon_Crimson_Feilsch_Info;
	permanent   = FALSE;
	description = "Umowa stoi!";
};
FUNC INT DIA_Addon_Crimson_Feilsch_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Crimson_How)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Crimson_Feilsch_Info()
{
	AI_Output (other, self, "DIA_Addon_Crimson_Feilsch_15_00");//Umowa stoi!
	AI_Output (self, other, "DIA_Addon_Crimson_Feilsch_10_01");//Hmm. Nie. To normalna cena.
	AI_Output (other, self, "DIA_Addon_Crimson_Feilsch_15_02");//Myœla³em, ¿e to cena dla przyjació³.
	AI_Output (self, other, "DIA_Addon_Crimson_Feilsch_10_03");//Bo tak jest. Wszyscy tu jesteœmy przyjació³mi.
};	
//---------------------------------------------------------------------
//	Info Gold tauschen
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Crimson_Gold   (C_INFO)
{
	npc         = BDT_1095_Addon_Crimson;
	nr          = 99;
	condition   = DIA_Addon_Crimson_Gold_Condition;
	information = DIA_Addon_Crimson_Gold_Info;
	permanent   = TRUE;
	description = "Wymieñ samorodki z³ota...";
};
FUNC INT DIA_Addon_Crimson_Gold_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Crimson_How)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Crimson_Gold_Info()
{
	AI_Output (other, self, "DIA_Addon_Crimson_Gold_15_00");//Pohandlujmy.
	
	Info_ClearChoices (DIA_Addon_Crimson_Gold);
	Info_AddChoice (DIA_Addon_Crimson_Gold,DIALOG_BACK,DIA_Addon_Crimson_Gold_BACK);
	
	if (Npc_HasItems (other,ItMi_GoldNugget_Addon ) >= 1)
	{
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Wymieñ wszystkie samorodki z³ota ",DIA_Addon_Crimson_Gold_ALLE);
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Wymieñ 1 samorodek z³ota",DIA_Addon_Crimson_Gold_1);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Crimson_Gold_10_01");//Ale nie masz ¿adnych samorodków.
	};
};	
FUNC VOID DIA_Addon_Crimson_Gold_BACK()
{
	Info_ClearChoices (DIA_Addon_Crimson_Gold);
};
FUNC VOID DIA_Addon_Crimson_Gold_ALLE()
{
	var int CurrentNuggets;
	CurrentNuggets = Npc_HasItems (other, ItMi_GoldNugget_Addon);
	
	B_GiveInvItems (other, self, ItMi_GoldNugget_Addon, CurrentNuggets);
	B_GiveInvItems (self, other, ItMI_Gold, (CurrentNuggets * 10));
	
	Info_ClearChoices (DIA_Addon_Crimson_Gold);
	Info_AddChoice (DIA_Addon_Crimson_Gold,DIALOG_BACK,DIA_Addon_Crimson_Gold_BACK);
	
	if (Npc_HasItems (other,ItMi_GoldNugget_Addon ) >= 1)
	{
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Wymieñ wszystkie samorodki z³ota ",DIA_Addon_Crimson_Gold_ALLE);
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Wymieñ 1 samorodek z³ota",DIA_Addon_Crimson_Gold_1);
	};
};
FUNC VOID DIA_Addon_Crimson_Gold_1()
{
	B_GiveInvItems (other, self, ItMi_GoldNugget_Addon, 1);
	B_GiveInvItems (self, other, ItMI_Gold, 10);
	
	Info_ClearChoices (DIA_Addon_Crimson_Gold);
	Info_AddChoice (DIA_Addon_Crimson_Gold,DIALOG_BACK,DIA_Addon_Crimson_Gold_BACK);
	
	if (Npc_HasItems (other,ItMi_GoldNugget_Addon ) >= 1)
	{
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Wymieñ wszystkie samorodki z³ota ",DIA_Addon_Crimson_Gold_ALLE);
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Wymieñ 1 samorodek z³ota",DIA_Addon_Crimson_Gold_1);
	};
};
FUNC VOID B_Say_CrimsonBeliar()
{
	AI_Output (self, other, "DIA_Addon_Crimson_FATAGN_LOS_10_00");//KHARDIMON FATAGN SCHATAR FATAGN BELIAR.
};

//---------------------------------------------------------------------
//	Info Raven
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Crimson_Raven   (C_INFO)
{
	npc         = BDT_1095_Addon_Crimson;
	nr          = 9;
	condition   = DIA_Addon_Crimson_Raven_Condition;
	information = DIA_Addon_Crimson_Raven_Info;
	permanent   = FALSE;
	description = "Co wiesz o Kruku?";
};
FUNC INT DIA_Addon_Crimson_Raven_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Crimson_How)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Crimson_Raven_Info()
{
	AI_Output (other, self, "DIA_Addon_Crimson_Raven_15_00");//Co wiesz o Kruku?
	AI_Output (self, other, "DIA_Addon_Crimson_Raven_10_01");//Nie uwierzysz w to... Widzia³em, co robi³ w krypcie!
	AI_Output (self, other, "DIA_Addon_Crimson_Raven_10_02");//Mamrota³ i wypowiada³ dziwne s³owa... Powtarza³ wszystko wiele razy...
	B_Say_CrimsonBeliar();
	AI_Output (self, other, "DIA_Addon_Crimson_Raven_10_03");//Potem z krypty wystrzeli³o jaskrawe œwiat³o i us³ysza³em KRZYK.
	AI_Output (self, other, "DIA_Addon_Crimson_Raven_10_04");//O bogowie, ten g³os! Brzmia³ niczym ryk koñca œwiata.
	AI_Output (self, other, "DIA_Addon_Crimson_Raven_10_05");//Kruk z nim rozmawia³ - Kruk i TEN g³os!
	AI_Output (self, other, "DIA_Addon_Crimson_Raven_10_06");//Nie pamiêtam, o czym mówili. Mog³em siê ruszyæ dopiero wiele godzin póŸniej.
};	
//---------------------------------------------------------------------
//	Info FATAGN
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Crimson_FATAGN   (C_INFO)
{
	npc         = BDT_1095_Addon_Crimson;
	nr          = 98;
	condition   = DIA_Addon_Crimson_FATAGN_Condition;
	information = DIA_Addon_Crimson_FATAGN_Info;
	permanent   = TRUE;
	description = "Mo¿esz jeszcze raz powtórzyæ s³owa Kruka?";
};
FUNC INT DIA_Addon_Crimson_FATAGN_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Crimson_Raven)
	&& (Crimson_SayBeliar < 4)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Crimson_FATAGN_Info()
{
	Crimson_SayBeliar = (Crimson_SayBeliar +1);
	
	AI_Output (other, self, "DIA_Addon_Crimson_FATAGN_15_00");//Mo¿esz jeszcze raz powtórzyæ s³owa Kruka?
	
	if (Crimson_SayBeliar <= 3)
	{
		AI_Output (self, other, "DIA_Addon_Crimson_FATAGN_10_01");//Pewnie! Gotowy?
		
		Info_ClearChoices (DIA_Addon_Crimson_FATAGN);
		Info_AddChoice (DIA_Addon_Crimson_FATAGN,"Tak.",DIA_Addon_Crimson_FATAGN_LOS);	
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Crimson_FATAGN_10_02");//Myœlê, ¿e lepiej daæ temu spokój.
	};
};	
FUNC VOID DIA_Addon_Crimson_FATAGN_LOS()
{
	Snd_Play ("Mystery_09");
	B_Say_CrimsonBeliar();
	
	if (Crimson_SayBeliar == 3)
	{
		Wld_PlayEffect("FX_EARTHQUAKE",  self, self, 0, 0, 0, FALSE );
		Wld_PlayEffect("DEMENTOR_FX",  self, self, 0, 0, 0, FALSE );
	};
	Info_ClearChoices (DIA_Addon_Crimson_FATAGN);
};
