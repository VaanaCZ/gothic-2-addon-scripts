///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Morgahard_EXIT   (C_INFO)
{
	npc         = BDT_1030_Morgahard;
	nr          = 999;
	condition   = DIA_Morgahard_EXIT_Condition;
	information = DIA_Morgahard_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Morgahard_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Morgahard_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_HALLO		(C_INFO)
{
	npc		 = 	BDT_1030_Morgahard;
	nr		 = 	3;
	condition	 = 	DIA_Morgahard_HALLO_Condition;
	information	 = 	DIA_Morgahard_HALLO_Info;

	description	 = 	"Jeste� Morgahard.";
};

func int DIA_Morgahard_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Morgahard_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_00"); //Jeste� Morgahard.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_01"); //Sk�d wiesz, jak si� nazywam?
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_02"); //Szuka ci� s�dzia. Uciek�e� z wi�zienia.
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_03"); //Jakie pope�ni�e� przest�pstwo? Ukrad�e� mu sakiewk�?
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_04"); //Nie jemu. Gubernatorowi. I to w dodatku na polecenie s�dziego.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_05"); //Po tym jak zaatakowali�my gubernatora, nie chcia� si� z nami podzieli� �upem, wi�c kaza� nas aresztowa�.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_06"); //Poniewa� nie chcieli�my sko�czy� na szubienicy, postanowili�my uciec.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_07"); //S�dzili�my, �e nigdy nie zdo�aj� nas z�apa�. Najwyra�niej si� pomylili�my.

	Info_ClearChoices	(DIA_Morgahard_HALLO);
	Info_AddChoice	(DIA_Morgahard_HALLO, "Przesta� j�cze� i stawaj do walki.", DIA_Morgahard_HALLO_attack );
	Info_AddChoice	(DIA_Morgahard_HALLO, "Czy mo�emy w jaki� spos�b zdemaskowa� s�dziego?", DIA_Morgahard_HALLO_richter );
	Info_AddChoice	(DIA_Morgahard_HALLO, "S�dzia kaza� mi was zabi�.", DIA_Morgahard_HALLO_tot );
	B_LogEntry (TOPIC_RichterLakai,"Znalaz�em Morgaharda, przyw�dc� zbieg�w."); 
	SCFoundMorgahard = TRUE;
	B_GivePlayerXP (XP_FoundMorgahard);
};
func void DIA_Morgahard_HALLO_tot ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_tot_15_00"); //S�dzia kaza� mi was zabi�.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_tot_07_01"); //Tak. Domy�li�em si�, �e po to tu przyszed�e�.

};

func void DIA_Morgahard_HALLO_richter ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_00"); //Czy mo�emy w jaki� spos�b zdemaskowa� s�dziego?
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_01"); //Nie. To niemo�liwe. M�drala siedzi w g�rnym mie�cie i tylko poci�ga za sznurki. Jest nietykalny.
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_02"); //Nie by�bym tego taki pewien. Potrzebny nam tylko jaki� dow�d jego udzia�u w zbrodni.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_03"); //Dow�d, powiadasz? Mam dow�d. Ale kto chcia�by s�ucha� takiego recydywisty?
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_04"); //Przeka� mi ten dow�d, a dopilnuj�, aby nikt ju� wi�cej na ciebie nie polowa�.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_05"); //Jeste� pewien, �e chcesz si� w to miesza�? Dobrze, prosz�. Oto list z podpisem s�dziego.
	B_GiveInvItems 		(self, other, ItWr_RichterKomproBrief_MIS, 1);					
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_06"); //Nawet je�li nie oczy�ci mnie to z zarzut�w, w zupe�no�ci wystarczy, aby obci��y� cz�ci� winy s�dziego.
	B_LogEntry (TOPIC_RichterLakai,"Morgahard da� mi list od s�dziego, z kt�rego jasno wynika, �e ten ostatni jest odpowiedzialny za obrabowanie Gubernatora Lariusa. S�dz�, �e w�a�nie o taki dow�d prosi� mnie Lee."); 
	AI_StopProcessInfos (self);
};
var int MorgahardSucked;
func void DIA_Morgahard_HALLO_attack ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_attack_15_00"); //Przesta� j�cze� i stawaj do walki. Najwy�szy czas po�o�y� temu kres.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_attack_07_01"); //Je�li o mnie chodzi, to i tak nie mam nic do stracenia.
	AI_StopProcessInfos (self);
	MorgahardSucked = TRUE;
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_Perm		(C_INFO)
{
	npc		 = 	BDT_1030_Morgahard;
	nr		 = 	3;
	condition	 = 	DIA_Morgahard_Perm_Condition;
	information	 = 	DIA_Morgahard_Perm_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

func int DIA_Morgahard_Perm_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (Npc_KnowsInfo(other, DIA_Morgahard_HALLO))
	&& (MorgahardSucked == FALSE)

		{
			return TRUE;
		};	
};

func void DIA_Morgahard_Perm_Info ()
{
	AI_Output			(self, other, "DIA_Morgahard_Perm_07_00"); //Mam nadziej�, �e kiedy� zobacz� t� �wini�, s�dziego, dyndaj�cego na stryczku.
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info Perm2
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_Perm2		(C_INFO)
{
	npc			 = 	BDT_1030_Morgahard;
	nr			 = 	3;
	condition	 = 	DIA_Morgahard_Perm2_Condition;
	information	 = 	DIA_Morgahard_Perm2_Info;
	important	 = 	TRUE;
	Permanent	 = 	TRUE;

};
func int DIA_Morgahard_Perm2_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
	&& (MorgahardSucked == TRUE)
		{
			return TRUE;
		};	
};
func void DIA_Morgahard_Perm2_Info ()
{
	AI_Output			(self, other, "DIA_Morgahard_Perm2_07_00"); //Czemu po prostu nie zostawisz mnie w spokoju?
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Morgahard_PICKPOCKET (C_INFO)
{
	npc			= BDT_1030_Morgahard;
	nr			= 900;
	condition	= DIA_Morgahard_PICKPOCKET_Condition;
	information	= DIA_Morgahard_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Morgahard_PICKPOCKET_Condition()
{
	C_Beklauen (73, 45);
};
 
FUNC VOID DIA_Morgahard_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Morgahard_PICKPOCKET);
	Info_AddChoice		(DIA_Morgahard_PICKPOCKET, DIALOG_BACK 		,DIA_Morgahard_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Morgahard_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Morgahard_PICKPOCKET_DoIt);
};

func void DIA_Morgahard_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Morgahard_PICKPOCKET);
};
	
func void DIA_Morgahard_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Morgahard_PICKPOCKET);
};


