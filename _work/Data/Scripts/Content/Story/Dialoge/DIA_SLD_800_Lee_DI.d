///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lee_DI_EXIT   (C_INFO)
{
	npc         = SLD_800_Lee_DI;
	nr          = 999;
	condition   = DIA_Lee_DI_EXIT_Condition;
	information = DIA_Lee_DI_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Lee_DI_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Lee_DI_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_DI_Hallo		(C_INFO)
{
	npc			 = 	SLD_800_Lee_DI;
	nr			 = 	2;
	condition	 = 	DIA_Lee_DI_Hallo_Condition;
	information	 = 	DIA_Lee_DI_Hallo_Info;

	description	 = 	"Czym chcesz si� zaj��?";
};
func int DIA_Lee_DI_Hallo_Condition ()
{	
	if  (Npc_IsDead(UndeadDragon) == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Lee_DI_Hallo_Info ()
{
	AI_Output			(other, self, "DIA_Lee_DI_Hallo_15_00"); //Czym chcesz si� zaj��?
	AI_Output			(self, other, "DIA_Lee_DI_Hallo_04_01"); //Kto� musi pilnowa� statku. Zostan� tutaj i dopilnuj�, �eby� mia� do czego wraca�.
	
};

///////////////////////////////////////////////////////////////////////
//	Info PERM6
///////////////////////////////////////////////////////////////////////

instance DIA_Lee_DI_PERM6		(C_INFO)
{
	npc			 = 	SLD_800_Lee_DI;
	nr			 = 	2;
	condition	 = 	DIA_Lee_DI_PERM6_Condition;
	information	 = 	DIA_Lee_DI_PERM6_Info;
	permanent	 = 	TRUE;

	description	 = 	"Co s�ycha� na statku?";
};

func int DIA_Lee_DI_PERM6_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Lee_DI_Hallo))
	&& (Npc_IsDead(UndeadDragon) == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Lee_DI_PERM6_Info ()
{
	AI_Output			(other, self, "DIA_Lee_DI_PERM6_15_00"); //Co s�ycha� na statku?

	if (ORkSturmDI == FALSE)
	{
		AI_Output			(self, other, "DIA_Lee_DI_PERM6_04_01"); //Bez obaw. Wszystko jest pod kontrol�.
	}
	else
	{
		AI_Output			(self, other, "DIA_Lee_DI_PERM6_04_02"); //Wszystko w porz�dku. Nie mog� si� ju� doczeka� powrotu tych t�pych ork�w. Ch�tnie spuszcz� im kolejne lanie.
	};
	
	AI_StopProcessInfos (self);
};
 
//**************************************
//			Ich will trainieren
//**************************************

INSTANCE DIA_Lee_DI_Teach(C_INFO)
{
	npc			= SLD_800_Lee_DI;
	nr			= 10;
	condition	= DIA_Lee_DI_Teach_Condition;
	information	= DIA_Lee_DI_Teach_Info;
	permanent	= TRUE;
	
	description = "Szukam dobrego nauczyciela.";
};                       

FUNC INT DIA_Lee_DI_Teach_Condition()
{
	if  (Npc_IsDead(UndeadDragon) == FALSE)
		{
				return TRUE;
		};
};
 
FUNC VOID DIA_Lee_DI_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Lee_DI_Teach_15_00"); //Szukam dobrego nauczyciela.
	AI_Output (self,other ,"DIA_Lee_DI_Teach_04_01"); //A czego dok�adnie chcia�by� si� nauczy�?
	
	Info_ClearChoices 	(DIA_Lee_DI_Teach);
	Info_AddChoice 		(DIA_Lee_DI_Teach,	DIALOG_BACK		,DIA_Lee_DI_Teach_Back);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Lee_DI_Teach_1H_5);
};

FUNC VOID DIA_Lee_DI_Teach_1H_1 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 100))
	{
			AI_Output (self ,other,"DIA_Lee_DI_Teach_1H_1_04_00"); //Twoja umiej�tno�� parowania cios�w jest jeszcze �a�osna, ale jako� sobie poradzisz.
	};
	Info_ClearChoices 	(DIA_Lee_DI_Teach);
	Info_AddChoice 		(DIA_Lee_DI_Teach,	DIALOG_BACK		,DIA_Lee_DI_Teach_Back);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Lee_DI_Teach_1H_5);
	
};

FUNC VOID DIA_Lee_DI_Teach_1H_5 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 100))
	{
			AI_Output (self ,other,"DIA_Lee_DI_Teach_1H_5_04_00"); //Jeste� za sztywny w nadgarstkach. Nie �ciskaj broni tak kurczowo.
	};
	Info_ClearChoices 	(DIA_Lee_DI_Teach);
	Info_AddChoice 		(DIA_Lee_DI_Teach,	DIALOG_BACK		,DIA_Lee_DI_Teach_Back);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Lee_DI_Teach_1H_5);
	
};

FUNC VOID DIA_Lee_DI_Teach_2H_1 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 100))
	{
		AI_Output(self,other,"DIA_DIA_Lee_DI_Teach_2H_1_04_00"); //Pami�taj: si�a ciosu bierze si� z bioder, a nie z ramion.
	};
	Info_ClearChoices 	(DIA_Lee_DI_Teach);
	Info_AddChoice 		(DIA_Lee_DI_Teach,	DIALOG_BACK		,DIA_Lee_DI_Teach_Back);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Lee_DI_Teach_1H_5);
	
};

FUNC VOID DIA_Lee_DI_Teach_2H_5 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 100))
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_2H_5_04_00"); //Najsilniejszy cios nic nie znaczy, je�li nie trafi w cel. U�ywaj swojej si�y z wi�kszym wyczuciem.
	};
	Info_ClearChoices 	(DIA_Lee_DI_Teach);
	Info_AddChoice 		(DIA_Lee_DI_Teach,	DIALOG_BACK		,DIA_Lee_DI_Teach_Back);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Lee_DI_Teach_1H_5);
	
};

FUNC VOID DIA_Lee_DI_Teach_Back ()
{
	Info_ClearChoices (DIA_Lee_DI_Teach);
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_DI_UndeadDragonDead		(C_INFO)
{
	npc			 = 	SLD_800_Lee_DI;
	nr			 = 	2;
	condition	 = 	DIA_Lee_DI_UndeadDragonDead_Condition;
	information	 = 	DIA_Lee_DI_UndeadDragonDead_Info;
	permanent	 = 	TRUE;
	
	description = 	"Mo�emy rusza� w drog�.";
};

func int DIA_Lee_DI_UndeadDragonDead_Condition ()
{	
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

var int DIA_Lee_DI_UndeadDragonDead_OneTime;
func void DIA_Lee_DI_UndeadDragonDead_Info ()
{
	AI_Output			(other ,self, "DIA_Lee_DI_UndeadDragonDead_15_00"); //Mo�emy rusza�. Nieprzyjaciel zosta� pokonany.
	AI_Output			(self ,other, "DIA_Lee_DI_UndeadDragonDead_04_01"); //�wietnie! W takim razie ka� kapitanowi podnosi� kotwic�.

	if (DIA_Lee_DI_UndeadDragonDead_OneTime == FALSE)
	&& (hero.guild == GIL_DJG)
		{
			AI_Output			(self ,other, "DIA_Lee_DI_UndeadDragonDead_04_02"); //Ale zabierzesz mnie na kontynent, prawda?
			AI_Output			(other ,self, "DIA_Lee_DI_UndeadDragonDead_15_03"); //Oczywi�cie. Khorinis jako� sobie poradzi bez ciebie.
			//AI_Output			(self ,other, "DIA_Lee_DI_UndeadDragonDead_04_04"); //Dann kann ich dem K�nig endlich meine lang ersehnte Aufwartung machen. Er ist schon zu lange vor mir davon gelaufen.
			AI_Output (self ,other, "DIA_Lee_Add_04_26"); //A potem mog� z�o�y� niezapowiedzian� wizyt� naszemu Kr�lowi.
			AI_Output (self ,other, "DIA_Lee_Add_04_27"); //D�ugo czeka�em na tak� okazj�...
			AI_Output			(self ,other, "DIA_Lee_DI_UndeadDragonDead_04_05"); //Jak my�lisz? Cierpliwo�� chyba zas�uguje na nagrod�.
			AI_Output			(other ,self, "DIA_Lee_DI_UndeadDragonDead_15_06"); //Cierpliwo�� i odpowiednio mocne... argumenty.
			AI_Output			(self ,other, "DIA_Lee_DI_UndeadDragonDead_04_07"); //No w�a�nie! Tym razem nie obejdzie si� bez rozr�by. Walka u twojego boku to prawdziwy zaszczyt.
			DIA_Lee_DI_UndeadDragonDead_OneTime = TRUE;
		};

	AI_Output			(self ,other, "DIA_Lee_DI_UndeadDragonDead_04_08"); //Mam nadziej�, �e nasze drogi jeszcze si� kiedy� skrzy�uj�.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Lee_DI_PICKPOCKET (C_INFO)
{
	npc			= SLD_800_Lee_DI;
	nr			= 900;
	condition	= DIA_Lee_DI_PICKPOCKET_Condition;
	information	= DIA_Lee_DI_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       

FUNC INT DIA_Lee_DI_PICKPOCKET_Condition()
{
	C_Beklauen (110, 570);
};
 
FUNC VOID DIA_Lee_DI_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Lee_DI_PICKPOCKET);
	Info_AddChoice		(DIA_Lee_DI_PICKPOCKET, DIALOG_BACK 		,DIA_Lee_DI_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Lee_DI_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Lee_DI_PICKPOCKET_DoIt);
};

func void DIA_Lee_DI_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Lee_DI_PICKPOCKET);
};
	
func void DIA_Lee_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Lee_DI_PICKPOCKET);
};


