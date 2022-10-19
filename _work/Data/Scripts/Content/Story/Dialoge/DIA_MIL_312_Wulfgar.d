// *************************************************
// 						EXIT
// *************************************************
INSTANCE DIA_Wulfgar_EXIT   (C_INFO)
{
	npc         = Mil_312_Wulfgar;
	nr          = 999;
	condition   = DIA_Wulfgar_EXIT_Condition;
	information = DIA_Wulfgar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Wulfgar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Wulfgar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// *************************************************
// 						Hallo
// *************************************************
instance DIA_Wulfgar_Hallo		(C_INFO)
{
	npc			 = 	Mil_312_Wulfgar;
	nr			 = 	1;
	condition	 = 	DIA_Wulfgar_Hallo_Condition;
	information	 = 	DIA_Wulfgar_Hallo_Info;
	permanent	 = 	FALSE;
	description	 = 	"Jak jde slu�ba?";
};

func int DIA_Wulfgar_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Wulfgar_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Wulfgar_Hallo_15_00"); //Jak jde slu�ba?
	AI_Output (self, other, "DIA_Wulfgar_Hallo_04_01"); //(pohrdav�) Tihle ho�i m�chaj� me�i jako n�jac� farm��i.
	AI_Output (self, other, "DIA_Wulfgar_Hallo_04_02"); //(rozhodn�) Ale a� s nimi skon��m, ka�d� z nich bude tvrd�, pevn� parchant.
};

// *************************************************
// 						WannaJoin
// *************************************************
instance DIA_Wulfgar_WannaJoin		(C_INFO)
{
	npc			 = 	Mil_312_Wulfgar;
	nr			 = 	2;
	condition	 = 	DIA_Wulfgar_WannaJoin_Condition;
	information	 = 	DIA_Wulfgar_WannaJoin_Info;
	permanent	 = 	FALSE;
	description	 = 	"Chci se p�idat k domobran�!";
};

func int DIA_Wulfgar_WannaJoin_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Wulfgar_Hallo))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_WannaJoin_Info ()
{
	AI_Output (other, self, "DIA_Wulfgar_WannaJoin_15_00"); //Chci se p�idat k domobran�!
	AI_Output (self, other, "DIA_Wulfgar_WannaJoin_04_01"); //No a? Jsi ob�anem m�sta?
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (other, self, "DIA_Wulfgar_WannaJoin_15_02"); //Ne.
		AI_Output (self, other, "DIA_Wulfgar_WannaJoin_04_03"); //V tom p��pad� t� lord Andre nep�ijme.
		AI_Output (self, other, "DIA_Wulfgar_WannaJoin_04_04"); //Samoz�ejm� �e si s n�m m��e� promluvit - ale ne�ekl bych, �e u tebe u�in� v�jimku.
	}
	else
	{
		AI_Output (other, self, "DIA_Wulfgar_WannaJoin_15_05"); //Ano.
		AI_Output (self, other, "DIA_Wulfgar_WannaJoin_04_06"); //V tom p��pad� si promluv s lordem Andrem. On rozhoduje, koho p�ijmout a koho ne.
	};
};

// *************************************************
// 						AboutMiliz
// *************************************************
instance DIA_Wulfgar_AboutMiliz		(C_INFO)
{
	npc			 = 	Mil_312_Wulfgar;
	nr			 = 	3;
	condition	 = 	DIA_Wulfgar_AboutMiliz_Condition;
	information	 = 	DIA_Wulfgar_AboutMiliz_Info;
	permanent	 = 	FALSE;
	description	 = 	"Jak to vypad� v domobran�?";
};

func int DIA_Wulfgar_AboutMiliz_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Wulfgar_Hallo))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_AboutMiliz_Info ()
{
	AI_Output (other, self, "DIA_Wulfgar_AboutMiliz_15_00"); //Jak to vypad� v domobran�?
	AI_Output (self, other, "DIA_Wulfgar_AboutMiliz_04_01"); //Na��m velitelem je te� lord Andre.
	AI_Output (self, other, "DIA_Wulfgar_AboutMiliz_04_02"); //Domobrana se d��v zodpov�dala m�stodr��c�mu. (sm�je se) Ten nem�l pon�t�, co tady d�l�me.
	AI_Output (self, other, "DIA_Wulfgar_AboutMiliz_04_03"); //Ale lord Andre dob�e v�, co d�l�. O chlapy se star� v�n� dob�e.
	AI_Output (self, other, "DIA_Wulfgar_AboutMiliz_04_04"); //Ka�d�, kdo tady za��n�, dostane slu�nou zbroj a dobrou zbra�.
	AI_Output (self, other, "DIA_Wulfgar_AboutMiliz_04_05"); //A kdy� odv�d� dobrou pr�ci, dostane� n�co nav�c. Za ka�d�ho lapen�ho krimin�ln�ka dostane� odm�nu.
};

// *************************************************
// 						CanYouTrain
// *************************************************
instance DIA_Wulfgar_CanYouTrain		(C_INFO)
{
	npc			 = 	Mil_312_Wulfgar;
	nr			 = 	4;
	condition	 = 	DIA_Wulfgar_CanYouTrain_Condition;
	information	 = 	DIA_Wulfgar_CanYouTrain_Info;
	permanent	 = 	FALSE;
	description	 = 	"M��e� u�it v boji s me�em i m�?";
};

func int DIA_Wulfgar_CanYouTrain_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Wulfgar_Hallo))
	&& (other.guild != GIL_MIL)
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_CanYouTrain_Info ()
{
	AI_Output (other, self, "DIA_Wulfgar_CanYouTrain_15_00"); //M��e� u�it boji s me�em i m�?
	AI_Output (self, other, "DIA_Wulfgar_CanYouTrain_04_01"); //Lord Andre mi p�ik�zal, abych cvi�il ka�d�ho, kdo by mohl b�t schopen br�nit m�sto.
	if (other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Wulfgar_CanYouTrain_04_02"); //To ov�em neplat� pro �old�ky. Zmiz.
	}
	else
	{
		AI_Output (self, other, "DIA_Wulfgar_CanYouTrain_04_03"); //To ov�em plat� jen pro bojov� v�cvik. V�echny ostatn� druhy v�cviku jsou vyhrazeny domobran�.
		AI_Output (self, other, "DIA_Wulfgar_CanYouTrain_04_04"); //Um� aspo� trochu ovl�dat zbra�?
		AI_Output (other, self, "DIA_Wulfgar_CanYouTrain_15_05"); //�ekl bych, �e ano.
		AI_Output (self, other, "DIA_Wulfgar_CanYouTrain_04_06"); //(povzdychne si) Dobr� - m��eme za��t, a� se na to bude� c�tit.
		Log_CreateTopic (Topic_CityTeacher, LOG_NOTE);
		B_LogEntry (Topic_CityTeacher, "Wulfgar, �len m�stsk� gardy, m� m��e vycvi�it v jednoru�n�m i obouru�n�m boji.");
		Wulfgar_Teach1H = TRUE;	
	};
};

// *************************************************
// 						Advantage
// *************************************************
instance DIA_Wulfgar_Advantage		(C_INFO)
{
	npc			 = 	Mil_312_Wulfgar;
	nr			 = 	5;
	condition	 = 	DIA_Wulfgar_Advantage_Condition;
	information	 = 	DIA_Wulfgar_Advantage_Info;
	permanent	 = 	FALSE;
	description	 = 	"Jak� jsou v�hody jednoru�n�ch a obouru�n�ch zbran�?";
};

func int DIA_Wulfgar_Advantage_Condition ()
{
	if (Wulfgar_Teach1H == TRUE)
	|| (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Advantage_Info ()
{
	AI_Output (other, self, "DIA_Wulfgar_Advantage_15_00"); //Jak� jsou v�hody jednoru�n�ch a obouru�n�ch zbran�?
	AI_Output (self, other, "DIA_Wulfgar_Advantage_04_01"); //Je to prost�. S jednoru�n� zbran� jsi rychlej��. To m��e b�t v bitv� pom�rn� zna�n� v�hoda.
	AI_Output (self, other, "DIA_Wulfgar_Advantage_04_02"); //Obouru�n� zbran� jsou t�kop�dn�j��. Mus� bojovat obez�etn� - p�i z�sahu v�ak zp�sob� mnohem v�t�� zran�n�.
};

// *************************************************
// 						HowToBegin
// *************************************************
instance DIA_Wulfgar_HowToBegin	(C_INFO)
{
	npc			 = 	Mil_312_Wulfgar;
	nr			 = 	6;
	condition	 = 	DIA_Wulfgar_HowToBegin_Condition;
	information	 = 	DIA_Wulfgar_HowToBegin_Info;
	permanent	 = 	FALSE;
	description	 = 	"U �eho m�m za��t? U jednoru�n�ch, nebo obouru�n�ch zbran�?";
};

func int DIA_Wulfgar_HowToBegin_Condition ()
{
	if (Wulfgar_Teach1H == TRUE)
	|| (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_HowToBegin_Info ()
{
	AI_Output (other, self, "DIA_Wulfgar_HowToBegin_15_00"); //U �eho m�m za��t? U jednoru�n�ch, nebo obouru�n�ch zbran�?
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_01"); //To je jen a pouze na tob�.
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_02"); //Pokud se zam��� jen na jeden typ zbran�, bude� se z�rove� u�it i ten druh�.
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_03"); //Jestli�e jsi nap��klad dobr� v boji s jednoru�n�mi me�i, ale jsi st�le za��te�n�k v boji s obouru�n�mi zbran�mi...
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_04"); //...tv� dovednosti s obouru�n�mi zbran�mi se zv���, i kdy� tr�nuje� s jednoru�n� zbran�.
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_05"); //V takov�m p��pad� je v�cvik n�ro�n�j��, ne� kdy� se u�� s ob�ma typy zbran�.
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_06"); //Za�n�me a brzy s�m zjist�, o �em to mluv�m.
};

// *************************************************
// 						TRAIN
// *************************************************
INSTANCE DIA_Wulfgar_Teach(C_INFO)
{
	npc			= Mil_312_Wulfgar;
	nr			= 7;
	condition	= DIA_Wulfgar_Teach_Condition;
	information	= DIA_Wulfgar_Teach_Info;
	permanent	= TRUE;
	description = "Za�n�me s v�cvikem.";
};                       

FUNC INT DIA_Wulfgar_Teach_Condition()
{
	if (Wulfgar_Teach1H == TRUE)
	|| (other.guild == GIL_MIL)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Wulfgar_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Wulfgar_Teach_15_00"); //Za�n�me s v�cvikem.
	
	if (other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Wulfgar_Add_04_00"); //�old�ky necvi��m!
	}
	else
	{
		if (other.guild == GIL_KDF)
		{
			AI_Output (self, other, "DIA_Wulfgar_Add_04_01"); //Jist�, ctihodnosti.
		};
		
		Info_ClearChoices 	(DIA_Wulfgar_Teach);
		Info_AddChoice 		(DIA_Wulfgar_Teach,	DIALOG_BACK		,DIA_Wulfgar_Teach_Back);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))		,DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))		,DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Wulfgar_Teach_1H_5);
	};
};

FUNC VOID DIA_Wulfgar_Teach_Back ()
{
	Info_ClearChoices (DIA_Wulfgar_Teach);
};

FUNC VOID DIA_Wulfgar_Teach_1H_1 ()
{
	if B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 75)
	{
		Info_ClearChoices 	(DIA_Wulfgar_Teach);
		Info_AddChoice 		(DIA_Wulfgar_Teach,	DIALOG_BACK		,DIA_Wulfgar_Teach_Back);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))		,DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))		,DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Wulfgar_Teach_1H_5);
	};
};
FUNC VOID DIA_Wulfgar_Teach_1H_5 ()
{
	if B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 75)
	{
		Info_ClearChoices 	(DIA_Wulfgar_Teach);
		Info_AddChoice 		(DIA_Wulfgar_Teach,	DIALOG_BACK		,DIA_Wulfgar_Teach_Back);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Wulfgar_Teach_1H_5);
	};	
};

FUNC VOID DIA_Wulfgar_Teach_2H_1 ()
{
	if B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 75)
	{
		Info_ClearChoices 	(DIA_Wulfgar_Teach);
		Info_AddChoice 		(DIA_Wulfgar_Teach,	DIALOG_BACK		,DIA_Wulfgar_Teach_Back);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Wulfgar_Teach_1H_5);
	};
};
FUNC VOID DIA_Wulfgar_Teach_2H_5 ()
{
	if B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 75)
	{
		Info_ClearChoices 	(DIA_Wulfgar_Teach);
		Info_AddChoice 		(DIA_Wulfgar_Teach,	DIALOG_BACK		,DIA_Wulfgar_Teach_Back);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Wulfgar_Teach_1H_5);
	};	
};

// ************************************************************
// 			  				Als Miliz
// ************************************************************

INSTANCE DIA_Wulfgar_AlsMil (C_INFO)
{
	npc			= Mil_312_Wulfgar;
	nr			= 1;
	condition	= DIA_Wulfgar_AlsMil_Condition;
	information	= DIA_Wulfgar_AlsMil_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Wulfgar_AlsMil_Condition()
{
	if (other.guild == GIL_MIL)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Wulfgar_AlsMil_Info()
{	
	AI_Output (self, other, "DIA_Wulfgar_AlsMil_04_00"); //Tak�e t� lord Andre p�ijal!
	AI_Output (self, other, "DIA_Wulfgar_AlsMil_04_01"); //P�edpokl�d�m, �e sem bude� chodit cvi�it pravideln�.
	AI_Output (self, other, "DIA_Wulfgar_AlsMil_04_02"); //Ruga t� bude u�it v um�n� st�elby z ku�e a Mortis ti pom��e zv��it s�lu.
	AI_Output (self, other, "DIA_Wulfgar_AlsMil_04_03"); //Ale nejd�le�it�j�� pro tebe je po��dn� se nau�it zach�zet s me�em.
	AI_Output (self, other, "DIA_Wulfgar_AlsMil_04_04"); //Je�t� z tebe ud�l�m dobr�ho bijce!
};

///////////////////////////////////////////////////////////////////////
//	Info Bonus
///////////////////////////////////////////////////////////////////////
instance DIA_Wulfgar_Bonus		(C_INFO)
{
	npc			 = 	Mil_312_Wulfgar;
	nr			 = 	2;
	condition	 = 	DIA_Wulfgar_Bonus_Condition;
	information	 = 	DIA_Wulfgar_Bonus_Info;
	permanent	 = 	FALSE;
	important	 = 	TRUE;
};

func int DIA_Wulfgar_Bonus_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (Wld_IsTime (05,02,06,54))
	{
		return TRUE;
	};
};
func void DIA_Wulfgar_Bonus_Info ()
{
	AI_Output (self, other, "DIA_Wulfgar_Bonus_04_00"); //Tak brzy a ji� na nohou? V tuhle denn� dobu tady b�v�m v�t�inou s�m. Ale kdy� u� jsi tady, m��e� se n��emu p�iu�it.
	AI_Output (self, other, "DIA_Wulfgar_Bonus_04_01"); //Tak d�vej pozor. N�kter� protivn�ky m��e� zm�st, kdy� se jejich �der�m vyhne� a pak v pravou chv�li ude��.
	AI_Output (self, other, "DIA_Wulfgar_Bonus_04_02"); //Pamatuj na to ve sv�m p��t�m boji!
	
	B_RaiseFightTalent (other, NPC_TALENT_1H, 2);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Wulfgar_PICKPOCKET (C_INFO)
{
	npc			= Mil_312_Wulfgar;
	nr			= 900;
	condition	= DIA_Wulfgar_PICKPOCKET_Condition;
	information	= DIA_Wulfgar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Wulfgar_PICKPOCKET_Condition()
{
	C_Beklauen (58, 80);
};
 
FUNC VOID DIA_Wulfgar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Wulfgar_PICKPOCKET);
	Info_AddChoice		(DIA_Wulfgar_PICKPOCKET, DIALOG_BACK 		,DIA_Wulfgar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Wulfgar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Wulfgar_PICKPOCKET_DoIt);
};

func void DIA_Wulfgar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Wulfgar_PICKPOCKET);
};
	
func void DIA_Wulfgar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Wulfgar_PICKPOCKET);
};







