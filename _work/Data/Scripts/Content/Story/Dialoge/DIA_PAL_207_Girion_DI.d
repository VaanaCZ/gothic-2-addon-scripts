///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Girion_DI_XIT   (C_INFO)
{
	npc         = PAL_207_Girion_DI;
	nr          = 999;
	condition   = DIA_Girion_DI_EXIT_Condition;
	information = DIA_Girion_DI_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Girion_DI_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Girion_DI_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Girion_DI_Hallo		(C_INFO)
{
	npc			 = 	PAL_207_Girion_DI;
	nr			 = 	2;
	condition	 = 	DIA_Girion_DI_Hallo_Condition;
	information	 = 	DIA_Girion_DI_Hallo_Info;
	PERMANENT 	 =  TRUE;

	description	 = 	"Wszystko w porządku?";
};
func int DIA_Girion_DI_Hallo_Condition ()
{	
	if (Npc_IsDead(UndeadDragon)== FALSE)
	{
		return TRUE;
	};
};
func void DIA_Girion_DI_Hallo_Info ()
{
	AI_Output			(other, self, "DIA_Girion_DI_Hallo_15_00"); //Czy wszystko w porządku?

	if (ORkSturmDI == TRUE)
		{
			AI_Output			(self, other, "DIA_Girion_DI_Hallo_08_01"); //Orkowie wykazali się sporą odwagą, stając przeciwko mnie.
			AI_Output			(self, other, "DIA_Girion_DI_Hallo_08_02"); //Wdanie się w walkę z królewskim paladynem nie było z ich strony zbyt mądre.
		}
	else if (hero.guild == GIL_PAL)
		{
			AI_Output			(self, other, "DIA_Girion_DI_Hallo_08_03"); //Tak myślę. Jak dużo czasu potrzeba ci na wypełnienie misji?
		}
	else
		{
			AI_Output			(self, other, "DIA_Girion_DI_Hallo_08_04"); //Nie traktuj mnie jak idioty. Rób, co musisz, a potem oddawaj statek.
		};
};

//**************************************
//			Ich will trainieren
//**************************************
INSTANCE DIA_Girion_DI_Teach(C_INFO)
{
	npc			= PAL_207_Girion_DI;
	nr			= 5;
	condition	= DIA_Girion_DI_Teach_Condition;
	information	= DIA_Girion_DI_Teach_Info;
	permanent	= TRUE;
	description = "Nauczaj mnie - szybciej się stąd wszyscy wydostaniemy!";
};                       

FUNC INT DIA_Girion_DI_Teach_Condition()
{
	if (Npc_IsDead(UndeadDragon)== FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Girion_DI_Teach_Info()
{	
	AI_Output (other,self 	,"DIA_Girion_DI_Teach_15_00"); //Jeśli mnie wytrenujesz, będziemy mogli szybciej opuścić to miejsce.
	AI_Output (self ,other 	,"DIA_Girion_DI_Teach_08_01"); //Wygląda na to, że nie mam innego wyboru.
	
	Info_ClearChoices 	(DIA_Girion_DI_Teach);
	Info_AddChoice 		(DIA_Girion_DI_Teach,	DIALOG_BACK		,DIA_Girion_DI_Teach_Back);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))		,DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Girion_DI_Teach_1H_5);
	
};
//***************************************************************************
// ARMBRUST
//***************************************************************************
// ------ 1% Waffentalent ------
func void DIA_Girion_DI_Teach_CROSSBOW_1()
{
	if B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 1, 90)
	{
			AI_Output (self ,other,"DIA_Girion_DI_Teach_CROSSBOW_1_08_00"); //Nigdy nie podnoś łokci. Powoduje to usztywnienie nadgarstków, co z kolei wpływa na obniżenie celności.
	};
	
	Info_ClearChoices 	(DIA_Girion_DI_Teach);
	Info_AddChoice 		(DIA_Girion_DI_Teach,	DIALOG_BACK		,DIA_Girion_DI_Teach_Back);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))		,DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Girion_DI_Teach_1H_5);
	
};

// ------ 5% Waffentalent ------
func void DIA_Girion_DI_Teach_CROSSBOW_5()
{
	if B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 5, 90)
	{
			AI_Output (self ,other,"DIA_Girion_DI_Teach_CROSSBOW_5_08_00"); //Zawsze przed strzałem rozluźnij lewe ramię. Dzięki temu będziesz mógł lepiej wycelować.
	};
	
	Info_ClearChoices 	(DIA_Girion_DI_Teach);
	Info_AddChoice 		(DIA_Girion_DI_Teach,	DIALOG_BACK		,DIA_Girion_DI_Teach_Back);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))		,DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Girion_DI_Teach_1H_5);
	
};
FUNC VOID DIA_Girion_DI_Teach_1H_1 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 90))
	{
			AI_Output (self ,other,"DIA_Girion_DI_Teach_1H_1_08_00"); //Twoje ostrze musi być szybkie niczym wiatr.
	};
	Info_ClearChoices 	(DIA_Girion_DI_Teach);
	Info_AddChoice 		(DIA_Girion_DI_Teach,	DIALOG_BACK		,DIA_Girion_DI_Teach_Back);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))		,DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Girion_DI_Teach_1H_5);
	
};

FUNC VOID DIA_Girion_DI_Teach_1H_5 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 90))
	{
			AI_Output (self ,other,"DIA_Girion_DI_Teach_1H_5_08_00"); //Pamiętaj, że rozwiązania siłowe z reguły są nieskuteczne. Zamiast machać mieczem na oślep, musisz precyzyjnie wyliczyć każdy cios.
	};
	Info_ClearChoices 	(DIA_Girion_DI_Teach);
	Info_AddChoice 		(DIA_Girion_DI_Teach,	DIALOG_BACK		,DIA_Girion_DI_Teach_Back);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))		,DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Girion_DI_Teach_1H_5);
	
};

FUNC VOID DIA_Girion_DI_Teach_2H_1 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 90))
	{
		AI_Output(self,other,"DIA_DIA_Girion_DI_Teach_2H_1_08_00"); //Nie trzymaj rękojeści tak kurczowo, wtedy masz większe szanse trafienia.
	};
	Info_ClearChoices 	(DIA_Girion_DI_Teach);
	Info_AddChoice 		(DIA_Girion_DI_Teach,	DIALOG_BACK		,DIA_Girion_DI_Teach_Back);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))		,DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Girion_DI_Teach_1H_5);
	
};

FUNC VOID DIA_Girion_DI_Teach_2H_5 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_2H_5_08_00"); //Pamiętaj o kontrataku. Najlepszą obronę zapewnią ci uniki.
	};
	Info_ClearChoices 	(DIA_Girion_DI_Teach);
	Info_AddChoice 		(DIA_Girion_DI_Teach,	DIALOG_BACK		,DIA_Girion_DI_Teach_Back);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))		,DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, 		  B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))	,DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Girion_DI_Teach_1H_5);
	
};

FUNC VOID DIA_Girion_DI_Teach_Back ()
{
	Info_ClearChoices (DIA_Girion_DI_Teach);
};

///////////////////////////////////////////////////////////////////////
//	Info OrcEliteRing
///////////////////////////////////////////////////////////////////////
instance DIA_Girion_DI_OrcEliteRing		(C_INFO)
{
	npc			 = 	PAL_207_Girion_DI;
	nr          = 	99;	
	condition	 = 	DIA_Girion_DI_OrcEliteRing_Condition;
	information	 = 	DIA_Girion_DI_OrcEliteRing_Info;
	permanent	 = 	TRUE;

	description	 = 	"Mam tu pierścień orkowego herszta.";
};

func int DIA_Girion_DI_OrcEliteRing_Condition ()
{	
	if  (Npc_HasItems (other,ItRi_OrcEliteRing))
		{
				return TRUE;
		};
};

var int DIA_Girion_DI_OrcEliteRing_OneTime;
func void DIA_Girion_DI_OrcEliteRing_Info ()
{
	AI_Output			(other, self, "DIA_Girion_DI_OrcEliteRing_15_00"); //Mam tu pierścień orkowego herszta.

	if (DIA_Girion_DI_OrcEliteRing_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Girion_DI_OrcEliteRing_08_01"); //Przypuszczam, że mógłby się przydać Lordowi Hagenowi.
		DIA_Girion_DI_OrcEliteRing_OneTime = TRUE;
	};

	AI_Output			(self, other, "DIA_Girion_DI_OrcEliteRing_08_02"); //Daj go mnie, a ja dostarczę go Hagenowi.

	Info_ClearChoices	(DIA_Girion_DI_OrcEliteRing);
	Info_AddChoice	(DIA_Girion_DI_OrcEliteRing, "Wolałbym go raczej zatrzymać dla siebie.", DIA_Girion_DI_OrcEliteRing_behalten );
	Info_AddChoice	(DIA_Girion_DI_OrcEliteRing, "Proszę, weź go.", DIA_Girion_DI_OrcEliteRing_geben );
};
func void DIA_Girion_DI_OrcEliteRing_geben ()
{
	AI_Output			(other, self, "DIA_Girion_DI_OrcEliteRing_geben_15_00"); //Proszę, weź go.
	AI_Output			(self, other, "DIA_Girion_DI_OrcEliteRing_geben_08_01"); //Dziękuję. I tak nie mam co z nim zrobić.
	Info_ClearChoices	(DIA_Girion_DI_OrcEliteRing);
	B_GiveInvItems (other, self, ItRi_OrcEliteRing,1);
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Girion_DI_OrcEliteRing_behalten ()
{
	AI_Output			(other, self, "DIA_Girion_DI_OrcEliteRing_behalten_15_00"); //Wolałbym go raczej zatrzymać dla siebie.
	AI_Output			(self, other, "DIA_Girion_DI_OrcEliteRing_behalten_08_01"); //Bardzo proszę. I tak nic z nim nie zrobisz.
	Info_ClearChoices	(DIA_Girion_DI_OrcEliteRing);
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_Girion_DI_UndeadDragonDead		(C_INFO)
{
	npc			 = 	PAL_207_Girion_DI;
	nr			 = 	2;
	condition	 = 	DIA_Girion_DI_UndeadDragonDead_Condition;
	information	 = 	DIA_Girion_DI_UndeadDragonDead_Info;
	permanent	 = 	TRUE;
	
	description = 	"Możemy odpływać.";
};

func int DIA_Girion_DI_UndeadDragonDead_Condition ()
{	
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

var int DIA_Girion_DI_UndeadDragonDead_OneTime;
func void DIA_Girion_DI_UndeadDragonDead_Info ()
{
	AI_Output			(other ,self, "DIA_Girion_DI_UndeadDragonDead_15_00"); //Możemy odpływać.
	AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_01"); //Najwyższy czas. Już myślałem, że przyjdzie mi spędzić resztę życia na tym klifie.

	if (DIA_Girion_DI_UndeadDragonDead_OneTime == FALSE)
		{
			AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_02"); //A teraz przekaż mi dowodzenie nad okrętem.
			AI_Output			(other ,self, "DIA_Girion_DI_UndeadDragonDead_15_03"); //Nie dotarliśmy jeszcze do Khorinis. A skoro już o tym mowa, to wcale nie mam ochoty tam wracać.
			AI_Output			(other ,self, "DIA_Girion_DI_UndeadDragonDead_15_04"); //Mam już dość tego miejsca.
			AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_05"); //Też o tym myślałem. Ale to nie miejsce ani czas na takie dyskusje. Pogadamy na ten temat, kiedy znajdziemy się na morzu.
			AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_06"); //Niezależnie od wszystkiego cieszę się, że udało ci się wrócić na statek w jednym kawałku.
			
			if (hero.guild == GIL_PAL)
			{
				AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_07"); //Jesteś prawdziwym wojownikiem Innosa. Nie mam co do tego żadnych wątpliwości. Cieszę się, że jesteśmy po tej samej stronie.
			}
			else
			{
				AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_08"); //Nawet jeśli jesteś draniem, tym razem postąpiłeś właściwie.
			};
			
			DIA_Girion_DI_UndeadDragonDead_OneTime = TRUE;
		};

	AI_Output			(self ,other, "DIA_Girion_DI_UndeadDragonDead_08_09"); //Dobrze. A teraz idź do kapitana i każ mu odpłynąć z tego miejsca.
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Girion_DI_PICKPOCKET (C_INFO)
{
	npc			= PAL_207_Girion_DI;
	nr			= 900;
	condition	= DIA_Girion_DI_PICKPOCKET_Condition;
	information	= DIA_Girion_DI_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Girion_DI_PICKPOCKET_Condition()
{
	C_Beklauen (71, 260);
};
 
FUNC VOID DIA_Girion_DI_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Girion_DI_PICKPOCKET);
	Info_AddChoice		(DIA_Girion_DI_PICKPOCKET, DIALOG_BACK 		,DIA_Girion_DI_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Girion_DI_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Girion_DI_PICKPOCKET_DoIt);
};

func void DIA_Girion_DI_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Girion_DI_PICKPOCKET);
};
	
func void DIA_Girion_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Girion_DI_PICKPOCKET);
};


