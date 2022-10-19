// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Udar_EXIT(C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 999;
	condition	= DIA_Udar_EXIT_Condition;
	information	= DIA_Udar_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Udar_EXIT_Condition()
{
	if (Kapitel < 4)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Udar_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  			Hallo
// ************************************************************
INSTANCE DIA_Udar_Hello (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 2;
	condition	= DIA_Udar_Hello_Condition;
	information	= DIA_Udar_Hello_Info;
	IMPORTANT 	= TRUE;
};                       

FUNC INT DIA_Udar_Hello_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kapitel < 4)
	{	
		return TRUE;
	}; 
};
FUNC VOID DIA_Udar_Hello_Info()
{	
	AI_Output	(self ,other,"DIA_Udar_Hello_09_00");//Mia�e� cholerne szcz�cie, kiedy wszed�e�. Prawie ci� zastrzeli�em.
	AI_Output	(other,self ,"DIA_Udar_Hello_15_01");//W takim razie powinienem si� cieszy�, �e masz taki bystry wzrok.
	AI_Output	(self ,other,"DIA_Udar_Hello_09_02");//Oszcz�dzaj oddech. Porozmawiaj z Sengrathem, je�li czego� chcesz.
	
	AI_StopProcessInfos (self);
};
//***************************************
//	Armbrustlehrer	
//***************************************

INSTANCE DIA_Udar_YouAreBest (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 3;
	condition	= DIA_Udar_YouAreBest_Condition;
	information	= DIA_Udar_YouAreBest_Info;
	permanent	= FALSE;
	Description = "S�ysza�em, �e jeste� NAJLEPSZYM kusznikiem w kr�lestwie.";
};                       

FUNC INT DIA_Udar_YouAreBest_Condition()
{
	IF (Npc_KnowsInfo (other,DIA_Keroloth_Udar))
	{
		return 1;
	};
};
 
FUNC VOID DIA_Udar_YouAreBest_Info()
{	
	AI_Output	(other,self ,"DIA_Udar_YouAreBest_15_00");	//S�ysza�em, �e jeste� NAJLEPSZYM kusznikiem w kr�lestwie.
	AI_Output	(self ,other,"DIA_Udar_YouAreBest_09_01");	//Skoro tak m�wi�, to musi by� prawda. Czego chcesz?
};

//***********************************
//	Bring wir was bei!
//***********************************

INSTANCE DIA_Udar_TeachMe (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 3;
	condition	= DIA_Udar_TeachMe_Condition;
	information	= DIA_Udar_TeachME_Info;
	permanent	= FALSE;
	Description = "Naucz mnie, jak strzela� z kuszy.";
};                       

FUNC INT DIA_Udar_TeachMe_Condition()
{
	IF ((Npc_KnowsInfo (other,DIA_Udar_YouAreBest))
	&& (Udar_TeachPlayer != TRUE))
	{
		return 1;
	};
};
 
FUNC VOID DIA_Udar_TeachME_Info()
{	
	AI_Output	(other,self ,"DIA_Udar_Teacher_15_00");	//Naucz mnie, jak strzela� z kuszy.
	AI_Output	(self ,other,"DIA_Udar_Teacher_09_01");	//Zje�d�aj! Dooko�a zamku biega do�� cel�w. Po�wicz sobie na nich.

};	

//***********************************
//	Ich bin auch nicht schlecht!
//***********************************

INSTANCE DIA_Udar_ImGood (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 3;
	condition	= DIA_Udar_ImGood_Condition;
	information	= DIA_Udar_ImGood_Info;
	permanent	= FALSE;
	Description = "Ja jestem najlepszy...";
};                       

FUNC INT DIA_Udar_ImGood_Condition()
{
	IF (Npc_KnowsInfo (other,DIA_Udar_YouAreBest))
	{
		return 1;
	};
};
 
FUNC VOID DIA_Udar_ImGood_Info()
{	
	AI_Output	(other,self ,"DIA_Udar_ImGood_15_00");	//Ja jestem najlepszy...
	AI_Output	(self ,other,"DIA_Udar_ImGood_09_01");	//Masz racj�!
	AI_Output	(self ,other,"DIA_Udar_ImGood_09_02");	//No c�, skoro chcesz si� uczy�, to ci pomog�.
	
	Udar_TeachPlayer = TRUE;
	B_LogEntry		(TOPIC_Teacher_OC, "Udar mo�e mnie nauczy�, jak pos�ugiwa� si� kusz�."); 
};

//***********************************
//	Bring mir was bei
//***********************************

INSTANCE DIA_Udar_Teach (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 3;
	condition	= DIA_Udar_Teach_Condition;
	information	= DIA_Udar_Teach_Info;
	permanent	= TRUE;
	Description = "Chc� si� od ciebie uczy�.";
};                       

FUNC INT DIA_Udar_Teach_Condition()
{
	IF (Udar_TeachPlayer== TRUE)
	{
		return 1;
	};
};
 
FUNC VOID DIA_Udar_Teach_Info()
{	
	AI_Output	(other,self ,"DIA_Udar_Teach_15_00");	//Chc� si� od ciebie uczy�.
	AI_Output	(self ,other,"DIA_Udar_Teach_09_01");   //Dobra, strzelaj.
	
	Info_ClearChoices (DIA_Udar_Teach);
	
	Info_AddChoice		(DIA_Udar_Teach,DIALOG_BACK,DIA_Udar_Teach_Back);
	Info_AddChoice		(DIA_Udar_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))			,DIA_Udar_Teach_CROSSBOW_1);
	Info_AddChoice		(DIA_Udar_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, 			B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))			,DIA_Udar_Teach_CROSSBOW_5);
};

FUNC VOID DIA_Udar_Teach_BACK()
{
	Info_ClearChoices (DIA_Udar_Teach);
};

FUNC VOID B_Udar_TeachNoMore1 ()
{
	AI_Output(self,other,"B_Udar_TeachNoMore1_09_00"); //Znasz ju� podstawy. Nie mamy czasu na wi�cej.
};

FUNC VOID B_Udar_TeachNoMore2 ()
{
	AI_Output(self,other,"B_Udar_TeachNoMore2_09_00"); //Aby sprawniej w�ada� broni�, musisz znale�� odpowiedniego nauczyciela.
};

FUNC VOID DIA_Udar_Teach_Crossbow_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 1, 60);
	
	if (other.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{
		B_Udar_TeachNoMore1 ();
		
		if (Npc_GetTalentSkill (other, NPC_TALENT_CROSSBOW) == 1)
		{
			B_Udar_TeachNoMore2 ();
		};
	};
	Info_AddChoice		(DIA_Udar_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))			,DIA_Udar_Teach_Crossbow_1);
};

FUNC VOID DIA_Udar_Teach_Crossbow_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 5, 60);
	
	if (other.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{
		B_Udar_TeachNoMore1 ();
	
		if (Npc_GetTalentSkill (other, NPC_TALENT_CROSSBOW) == 1)
		{
			B_Udar_TeachNoMore2 ();
		};
	};
	Info_AddChoice		(DIA_Udar_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5))			,DIA_Udar_Teach_Crossbow_5);
};
//***********************************
//	Perm
//***********************************

INSTANCE DIA_Udar_Perm (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 11;
	condition	= DIA_Udar_Perm_Condition;
	information	= DIA_Udar_Perm_Info;
	permanent	= FALSE;
	Description = "Jak si� maj� sprawy w zamku?";
};                       
FUNC INT DIA_Udar_Perm_Condition()
{
	if (Kapitel <= 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Udar_Perm_Info()
{	
	AI_Output	(other,self ,"DIA_Udar_Perm_15_00");	//Jak maj� si� sprawy w zamku?
	AI_Output	(self ,other,"DIA_Udar_Perm_09_01");	//Paru ch�opak�w �wiczy, ale generalnie rzecz bior�c, wszyscy czekamy, a� co� si� stanie.
	AI_Output	(self ,other,"DIA_Udar_Perm_09_02");	//Ta niepewno�� nas dobija. To strategia tych przekl�tych ork�w. Poczekaj�, a� b�dziemy mieli nerwy w strz�pach.
};	
//***********************************
//	Ring 
//***********************************

INSTANCE DIA_Udar_Ring (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 11;
	condition	= DIA_Udar_Ring_Condition;
	information	= DIA_Udar_Ring_Info;
	permanent	= FALSE;
	Description = "Prosz�, przynosz� ci pier�cie� Tengrona.";
};                       
FUNC INT DIA_Udar_Ring_Condition()
{
	if (Npc_HasItems (other,ItRi_Tengron) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Udar_Ring_Info()
{	
	AI_Output	(other,self ,"DIA_Udar_Ring_15_00");	//Prosz�, przynosz� ci pier�cie� Tengrona. Powinien ci� ochroni�. Tengron powiedzia�, �e przyjdzie po niego, kiedy tylko wr�ci.
	AI_Output	(self ,other,"DIA_Udar_Ring_09_01");	//Co? Wiesz, co to za pier�cie�? Dosta� go w nagrod� za odwag� w bitwie.
	AI_Output	(self ,other,"DIA_Udar_Ring_09_02");	//M�wisz, �e chce go z powrotem? Je�li taka jest wola Innosa, to tak si� stanie. Je�li taka jest wola Innosa...
	
	B_GiveInvItems (other,self,ItRi_Tengron,1);
	TengronRing = TRUE;
	B_GivePlayerXP (XP_TengronRing);
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Udar_KAP4_EXIT(C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 999;
	condition	= DIA_Udar_KAP4_EXIT_Condition;
	information	= DIA_Udar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Udar_KAP4_EXIT_Condition()
{
	if	(Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Udar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info 
///////////////////////////////////////////////////////////////////////
instance DIA_Udar_Kap4WiederDa		(C_INFO)
{
	npc		 = 	PAL_268_Udar;
	nr		 = 	40;
	condition	 = 	DIA_Udar_Kap4WiederDa_Condition;
	information	 = 	DIA_Udar_Kap4WiederDa_Info;
	important	 = 	TRUE;
};

func int DIA_Udar_Kap4WiederDa_Condition ()
{
	if	(Kapitel >= 4)	
		{
				return TRUE;
		};
};

func void DIA_Udar_Kap4WiederDa_Info ()
{
	AI_Output			(self, other, "DIA_Udar_Kap4WiederDa_09_00"); //Dobrze, �e przyszed�e�. Mamy tu istne piek�o.

	if (hero.guild != GIL_DJG)
	{
		AI_Output			(other, self, "DIA_Udar_Kap4WiederDa_15_01"); //Co si� sta�o?
		AI_Output			(self, other, "DIA_Udar_Kap4WiederDa_09_02"); //�owcy pusz� si� w zamku i przechwalaj�, �e potrafi� za�atwi� problem ze smokiem.
		AI_Output			(self, other, "DIA_Udar_Kap4WiederDa_09_03"); //Powiem ci jednak, �e nie wygl�daj� na takich, co by sobie poradzili cho�by ze starym, schorowanym z�baczem.
	};

	AI_Output			(self, other, "DIA_Udar_Kap4WiederDa_09_04"); //Coraz wi�cej z nas zaczyna si� powa�nie obawia�, czy uda nam si� wyj�� z tego ca�o.
};

///////////////////////////////////////////////////////////////////////
//	Info Sengrath
///////////////////////////////////////////////////////////////////////
instance DIA_Udar_Sengrath		(C_INFO)
{
	npc		 = 	PAL_268_Udar;
	nr		 = 	41;
	condition	 = 	DIA_Udar_Sengrath_Condition;
	information	 = 	DIA_Udar_Sengrath_Info;

	description	 = 	"Czy nie jest was tutaj dw�ch na stra�y?";
};

func int DIA_Udar_Sengrath_Condition ()
{
	if	(Kapitel >= 4)	
		&& (Npc_KnowsInfo(other, DIA_Udar_Kap4WiederDa))
		&& (Sengrath_Missing == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Udar_Sengrath_Info ()
{
	AI_Output			(other, self, "DIA_Udar_Sengrath_15_00"); //Czy nie jest was tutaj dw�ch na stra�y?
	AI_Output			(self, other, "DIA_Udar_Sengrath_09_01"); //Ju� nie. Sengrath sta� tutaj, na blankach, gdy nagle zasn��.
	AI_Output			(self, other, "DIA_Udar_Sengrath_09_02"); //Gdy to si� sta�o, jego kusza spad�a na d�.
	AI_Output			(self, other, "DIA_Udar_Sengrath_09_03"); //Widzieli�my, jak jeden z ork�w j� z�apa� i znikn�� w ciemno�ciach.
	AI_Output			(self, other, "DIA_Udar_Sengrath_09_04"); //Wtedy Sengrath obudzi� si� i pobieg� w noc, w stron� orkowskiej palisady. Od tamtej pory go nie widziano.
	AI_Output			(self, other, "DIA_Udar_Sengrath_09_05"); //Chro� nas Innosie!

	Log_CreateTopic (TOPIC_Sengrath_Missing, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Sengrath_Missing, LOG_RUNNING);
	B_LogEntry (TOPIC_Sengrath_Missing,"Udar, stra�nik na zamku, t�skni za Sengrathem. Ostatnio widzia� go p�n� noc�, kiedy ten bieg� w stron� orkowych umocnie�, aby odzyska� sw� kusz�."); 
};


///////////////////////////////////////////////////////////////////////
//	Info SENGRATHgefunden
///////////////////////////////////////////////////////////////////////
instance DIA_Udar_SENGRATHGEFUNDEN		(C_INFO)
{
	npc		 = 	PAL_268_Udar;
	nr		 = 	42;
	condition	 = 	DIA_Udar_SENGRATHGEFUNDEN_Condition;
	information	 = 	DIA_Udar_SENGRATHGEFUNDEN_Info;

	description	 = 	"Znalaz�em Sengratha.";
};

func int DIA_Udar_SENGRATHGEFUNDEN_Condition ()
{
	if	(Kapitel >= 4)	
		&& (Npc_KnowsInfo(other, DIA_Udar_Sengrath))
		&& (Npc_HasItems (other,ItRw_SengrathsArmbrust_MIS))
		{
				return TRUE;
		};
};

func void DIA_Udar_SENGRATHGEFUNDEN_Info ()
{
	AI_Output			(other, self, "DIA_Udar_SENGRATHGEFUNDEN_15_00"); //Znalaz�em Sengratha.
	AI_Output			(self, other, "DIA_Udar_SENGRATHGEFUNDEN_09_01"); //Naprawd�? Gdzie on jest?
	AI_Output			(other, self, "DIA_Udar_SENGRATHGEFUNDEN_15_02"); //Nie �yje. Oto jego kusza. Mia� j� przy sobie.
	AI_Output			(self, other, "DIA_Udar_SENGRATHGEFUNDEN_09_03"); //Musia� odzyska� swoj� kusz�, ale wygl�da na to, �e orkowie jednak go zabili.
	AI_Output			(self, other, "DIA_Udar_SENGRATHGEFUNDEN_09_04"); //Przekl�ty g�upiec. Wiedzia�em, �e tak b�dzie. Wszyscy zginiemy.

	TOPIC_END_Sengrath_Missing = TRUE;
	B_GivePlayerXP (XP_SengrathFound);
};

///////////////////////////////////////////////////////////////////////
//	Info BadFeeling
///////////////////////////////////////////////////////////////////////
instance DIA_Udar_BADFEELING		(C_INFO)
{
	npc		 = 	PAL_268_Udar;
	nr		 = 	50;
	condition	 = 	DIA_Udar_BADFEELING_Condition;
	information	 = 	DIA_Udar_BADFEELING_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Udar_BADFEELING_Condition ()
{
		if 	(Npc_RefuseTalk(self) == FALSE)
			&& (Npc_IsInState (self,ZS_Talk))
			&& (Npc_KnowsInfo(other, DIA_Udar_SENGRATHGEFUNDEN))
			&& (Kapitel >= 4)	
		{
				return TRUE;
		};			
};

func void DIA_Udar_BADFEELING_Info ()
{
	if (MIS_OCGateOpen == TRUE)
	{
	AI_Output			(self, other, "DIA_Udar_BADFEELING_09_00"); //Jeszcze jeden taki atak i b�dzie po nas.
	}
	else if (MIS_AllDragonsDead == TRUE)
	{
	AI_Output			(self, other, "DIA_Udar_BADFEELING_09_01"); //Orkowie s� bardzo zaniepokojeni. Co� ich nie�le przestraszy�o. Czuj� to.
	}
	else 
	{
	AI_Output			(self, other, "DIA_Udar_BADFEELING_09_02"); //Mam co do tego naprawd� z�e przeczucia.
	};
	
	Npc_SetRefuseTalk (self,30);
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Udar_KAP5_EXIT(C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 999;
	condition	= DIA_Udar_KAP5_EXIT_Condition;
	information	= DIA_Udar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Udar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Udar_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Udar_KAP6_EXIT(C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 999;
	condition	= DIA_Udar_KAP6_EXIT_Condition;
	information	= DIA_Udar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Udar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Udar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Udar_PICKPOCKET (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 900;
	condition	= DIA_Udar_PICKPOCKET_Condition;
	information	= DIA_Udar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Udar_PICKPOCKET_Condition()
{
	C_Beklauen (20, 15);
};
 
FUNC VOID DIA_Udar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Udar_PICKPOCKET);
	Info_AddChoice		(DIA_Udar_PICKPOCKET, DIALOG_BACK 		,DIA_Udar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Udar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Udar_PICKPOCKET_DoIt);
};

func void DIA_Udar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Udar_PICKPOCKET);
};
	
func void DIA_Udar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Udar_PICKPOCKET);
};



































