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
	AI_Output	(self ,other,"DIA_Udar_Hello_09_00");//Když jsi vešel, męl jsi zatracené štęstí. Málem jsem tę zastâelil.
	AI_Output	(other,self ,"DIA_Udar_Hello_15_01");//V tom pâípadę bych asi męl být rád, že máš tak skvęlý zrak.
	AI_Output	(self ,other,"DIA_Udar_Hello_09_02");//Šetâi si dech. Jestli nęco chceš, promluv si se Sengrathem.
	
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
	Description = "Slyšel jsem, že jsi ten NEJLEPŠÍ stâelec z kuše...";
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
	AI_Output	(other,self ,"DIA_Udar_YouAreBest_15_00");	//Slyšel jsem, že jsi NEJLEPŠÍ stâelec z kuše široko daleko.
	AI_Output	(self ,other,"DIA_Udar_YouAreBest_09_01");	//Pokud se to âíká, tak to asi bude pravda. Co chceš?
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
	Description = "Nauč mę, jak správnę stâílet z kuše.";
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
	AI_Output	(other,self ,"DIA_Udar_Teacher_15_00");	//Nauč mę, jak správnę stâílet z kuše.
	AI_Output	(self ,other,"DIA_Udar_Teacher_09_01");	//Zmiz! Kolem hradu pobíhá spousta terčů. Cvič se na nich.

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
	Description = "Jsem nejlepší.";
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
	AI_Output	(other,self ,"DIA_Udar_ImGood_15_00");	//Jsem nejlepší.
	AI_Output	(self ,other,"DIA_Udar_ImGood_09_01");	//(smęje se) To teda jo!
	AI_Output	(self ,other,"DIA_Udar_ImGood_09_02");	//No, pokud se chceš učit, pomůžu ti.
	
	Udar_TeachPlayer = TRUE;
	B_LogEntry		(TOPIC_Teacher_OC, "Udar mi vysvętlí, jak zacházet s kuší."); 
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
	Description = "Chtęl bych se od tebe nęčemu pâiučit.";
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
	AI_Output	(other,self ,"DIA_Udar_Teach_15_00");	//Chci se učit od tebe.
	AI_Output	(self ,other,"DIA_Udar_Teach_09_01");   //Dobrá, tak spusă!
	
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
	AI_Output(self,other,"B_Udar_TeachNoMore1_09_00"); //Základy už umíš - na víc nemáme čas.
};

FUNC VOID B_Udar_TeachNoMore2 ()
{
	AI_Output(self,other,"B_Udar_TeachNoMore2_09_00"); //Jestli se chceš naučit se svou zbraní zacházet lépe, męl by sis najít skutečného učitele.
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
	Description = "Jak to jde tady na hradę?";
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
	AI_Output	(other,self ,"DIA_Udar_Perm_15_00");	//Jak to jde tady na hradę?
	AI_Output	(self ,other,"DIA_Udar_Perm_09_01");	//Pár chlapců trénuje, ale v zásadę čekáme, až se nęco stane.
	AI_Output	(self ,other,"DIA_Udar_Perm_09_02");	//Tahle nejistota nás ubíjí. To mají skâeti pâesnę v plánu. Čekají, až nám prasknou nervy.
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
	Description = "Tady ti nesu ten Tengronův prsten...";
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
	AI_Output	(other,self ,"DIA_Udar_Ring_15_00");	//Pâináším ti Tengronův prsten. Męl by tę chránit. Až se Tengron vrátí, bude ho chtít zpátky.
	AI_Output	(self ,other,"DIA_Udar_Ring_09_01");	//Cože? Víš, co to je za prsten? Dostal ho jako odmęnu za svou odvahu v boji.
	AI_Output	(self ,other,"DIA_Udar_Ring_09_02");	//Âíkáš, že ho bude chtít zpátky? Pokud to je vůle Innosova, stane se tak. Pokud to je vůle Innosova...
	
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
	AI_Output			(self, other, "DIA_Udar_Kap4WiederDa_09_00"); //Je dobâe, že jsi pâišel. Brzy tady propukne peklo.

	if (hero.guild != GIL_DJG)
	{
		AI_Output			(other, self, "DIA_Udar_Kap4WiederDa_15_01"); //Co se stalo?
		AI_Output			(self, other, "DIA_Udar_Kap4WiederDa_09_02"); //Po hradę se poflakují drakobijci a chvástají se, že dokáží vyâešit naše problémy s draky.
		AI_Output			(self, other, "DIA_Udar_Kap4WiederDa_09_03"); //Ale nęco ti povím - vypadají, jako by nedokázali zneškodnit ani nemocného starého slepýše.
	};

	AI_Output			(self, other, "DIA_Udar_Kap4WiederDa_09_04"); //Spousta z nás si začíná dęlat starosti a už moc nevęâíme, že se odsud dostaneme se zdravou kůží.
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

	description	 = 	"Nebyli jste tady na hlídce dva?";
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
	AI_Output			(other, self, "DIA_Udar_Sengrath_15_00"); //Nebyli jste tady na hlídce dva?
	AI_Output			(self, other, "DIA_Udar_Sengrath_09_01"); //Bývalo. Sengrath stál tady na hradbách a najednou z ničeho nic usnul.
	AI_Output			(self, other, "DIA_Udar_Sengrath_09_02"); //Když se to stalo, jeho dobrý samostâíl spadnul dolů.
	AI_Output			(self, other, "DIA_Udar_Sengrath_09_03"); //Vidęli jsme, jak ho skâeti popadli a zmizeli s ním ve tmę.
	AI_Output			(self, other, "DIA_Udar_Sengrath_09_04"); //Sengrath se hned probudil a vybęhl do noci smęrem ke skâetí palisádę. Od té chvíle jsme ho nevidęli.
	AI_Output			(self, other, "DIA_Udar_Sengrath_09_05"); //Innos stůj pâi nás!

	Log_CreateTopic (TOPIC_Sengrath_Missing, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Sengrath_Missing, LOG_RUNNING);
	B_LogEntry (TOPIC_Sengrath_Missing,"Udar, strážný z hradu, postrádá svého druha Sengratha. Naposledy ho vidęl pozdę v noci, když míâil ke skâetímu opevnęní a vracel se pro svou kuši."); 
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

	description	 = 	"Našel jsem Sengratha.";
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
	AI_Output			(other, self, "DIA_Udar_SENGRATHGEFUNDEN_15_00"); //Našel jsem Sengratha.
	AI_Output			(self, other, "DIA_Udar_SENGRATHGEFUNDEN_09_01"); //Vážnę? Kde je?
	AI_Output			(other, self, "DIA_Udar_SENGRATHGEFUNDEN_15_02"); //Je mrtvý. Tady je jeho kuše. Męl ji u sebe.
	AI_Output			(self, other, "DIA_Udar_SENGRATHGEFUNDEN_09_03"); //Nejspíš se mu ji podaâilo získat zpęt, ale skâeti ho nakonec pâece jenom dostali.
	AI_Output			(self, other, "DIA_Udar_SENGRATHGEFUNDEN_09_04"); //Zatracený blázen. Vędęl jsem to. Všichni tady pochcípeme.

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
	AI_Output			(self, other, "DIA_Udar_BADFEELING_09_00"); //Ještę jeden takový útok a budeme žrát hlínu.
	}
	else if (MIS_AllDragonsDead == TRUE)
	{
	AI_Output			(self, other, "DIA_Udar_BADFEELING_09_01"); //Skâeti mají dost starostí. Nęco je hroznę vydęsilo. Cítím to.
	}
	else 
	{
	AI_Output			(self, other, "DIA_Udar_BADFEELING_09_02"); //Nemám z toho vůbec dobrý pocit.
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



































