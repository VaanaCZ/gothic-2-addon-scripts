///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Fed_EXIT   (C_INFO)
{
	npc         = STRF_1106_Fed;
	nr          = 999;
	condition   = DIA_Fed_EXIT_Condition;
	information = DIA_Fed_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Fed_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fed_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Fed_HALLO		(C_INFO)
{
	npc		 	 = 	STRF_1106_Fed;
	nr 			 =  2;
	condition	 = 	DIA_Fed_HALLO_Condition;
	information	 = 	DIA_Fed_HALLO_Info;
	permanent 	 =  FALSE;
	important 	 =  TRUE;
};

func int DIA_Fed_HALLO_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (MIS_Fajeth_Kill_Snapper != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Fed_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Fed_HALLO_08_00"); //Co ode mê chceš? Nikam nejdu!
	AI_Output (other, self, "DIA_Fed_HALLO_15_01"); //Klídek, v pohodê - nikdo po tobê nechce, abys nêkam chodil.
	AI_Output (self, other, "DIA_Fed_HALLO_08_02"); //Díky Innosovi. Však víš, bêhem nêkolika posledních dní opustilo pár chlapù tábor - a nikdo z nich se nevrátil.
	AI_Output (self, other, "DIA_Fed_HALLO_08_03"); //Všechny je sežrali chàapavci. Ale mê ne. Prostê tady zùstanu do tý doby, než to skonèí.
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Fed_Snapper	(C_INFO)
{
	npc		 	 = 	STRF_1106_Fed;
	nr 			 =  3;
	condition	 = 	DIA_Fed_Snapper_Condition;
	information	 = 	DIA_Fed_Snapper_Info;
	permanent	 =  FALSE;
	description	 = 	"Co víš o chàapavcích?";
};
func int DIA_Fed_Snapper_Condition ()
{	
	if (MIS_Fajeth_Kill_Snapper == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Fed_Snapper_Info ()
{
	AI_Output (other, self, "DIA_Fed_Snapper_15_00"); //Co víš o chàapavcích?
	AI_Output (self, other, "DIA_Fed_Snapper_08_01"); //Bilgot je v noci vídá. Nêkolik z nich jich je dole u jezírka pod tmavou vêží.
	AI_Output (self, other, "DIA_Fed_Snapper_08_02"); //Ostatní jsou pâímo nad náma - nahoâe na skále. Jen èekají, až se úplnê vyèerpáme.
	AI_Output (self, other, "DIA_Fed_Snapper_08_03"); //Jsme tady v pasti. Brzo napadnou tábor - a udêlají si krvavé hody.
	AI_Output (other, self, "DIA_Fed_Snapper_15_04"); //Aha.
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Fed_Perm	(C_INFO)
{
	npc		 	 = 	STRF_1106_Fed;
	nr 			 =  5;
	condition	 = 	DIA_Fed_Perm_Condition;
	information	 = 	DIA_Fed_Perm_Info;
	permanent	 =  TRUE;
	description	 = 	"Copak ses zbláznil?";
};
func int DIA_Fed_Perm_Condition ()
{	
		return TRUE;
};
func void DIA_Fed_Perm_Info ()
{
	AI_Output (other, self, "DIA_Fed_Perm_15_00"); //Jsi v poâádku?
	
	if (MIS_Fajeth_Kill_Snapper != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Fed_Perm_08_01"); //Venku jsou chàapavci. Cítíš je...? Já je cítím...
	}
	else 
	{
		AI_Output (self, other, "DIA_Fed_Perm_08_02"); //Vypadá to, že se chàapavci stáhli. Ale to ještê nic neznamená. Oni se vrátí - nebo vlci nebo ještêâi nebo skâeti.
		AI_Output (self, other, "DIA_Fed_Perm_08_03"); //A dâív nebo pozdêji nás dostanou a pošmáknou si na našich mrtvolách.
	};
	AI_StopProcessInfos(self);
	

};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fed_PICKPOCKET (C_INFO)
{
	npc			= STRF_1106_Fed;
	nr			= 900;
	condition	= DIA_Fed_PICKPOCKET_Condition;
	information	= DIA_Fed_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Fed_PICKPOCKET_Condition()
{
	C_Beklauen (32, 8);
};
 
FUNC VOID DIA_Fed_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fed_PICKPOCKET);
	Info_AddChoice		(DIA_Fed_PICKPOCKET, DIALOG_BACK 		,DIA_Fed_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fed_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fed_PICKPOCKET_DoIt);
};

func void DIA_Fed_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fed_PICKPOCKET);
};
	
func void DIA_Fed_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fed_PICKPOCKET);
};




















