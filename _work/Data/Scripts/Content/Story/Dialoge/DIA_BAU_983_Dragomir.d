

// ***********************************************************
// 							EXIT
// ***********************************************************
INSTANCE DIA_Dragomir_EXIT   (C_INFO)
{
	npc         = BAU_983_Dragomir;
	nr          = 999;
	condition   = DIA_Dragomir_EXIT_Condition;
	information = DIA_Dragomir_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Dragomir_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Dragomir_EXIT_Info()
{
	AI_StopProcessInfos (self);
};						
						
// ***********************************************************
// 							Hello
// ***********************************************************
INSTANCE DIA_Dragomir_Hello   (C_INFO)
{
	npc         = BAU_983_Dragomir;
	nr          = 1;
	condition   = DIA_Dragomir_Hello_Condition;
	information = DIA_Dragomir_Hello_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Dragomir_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_TALK))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dragomir_Hello_Info()
{
	AI_Output (self,other,"DIA_Dragomir_Hello_12_00"); //Co tak daleko od domova?
	AI_Output (self,other,"DIA_Dragomir_Hello_12_01"); //Tady musíš být opatrný, zvlášă když se můžeš spolehnout jen sám na sebe.
};		 
	
// ***********************************************************
// 							OutHere
// ***********************************************************
INSTANCE DIA_Dragomir_OutHere   (C_INFO)
{
	npc         = BAU_983_Dragomir;
	nr          = 2;
	condition   = DIA_Dragomir_OutHere_Condition;
	information = DIA_Dragomir_OutHere_Info;
	permanent   = FALSE;
	description = "Co tady dęláš?";
};
FUNC INT DIA_Dragomir_OutHere_Condition()
{
	return TRUE;	
};
FUNC VOID DIA_Dragomir_OutHere_Info()
{
	AI_Output (other,self ,"DIA_Dragomir_OutHere_15_00"); //Co tady dęláš?
	AI_Output (self ,other,"DIA_Dragomir_OutHere_12_01"); //No, hostinec je pro mę pâíliš drahý, tak jsem se utáboâil tady.
	AI_Output (self ,other,"DIA_Dragomir_OutHere_12_02"); //Vypadá to, že dâívęjší obyvatelé už to tu nepotâebují.
};		 		

// ***********************************************************
// 							OutHere
// ***********************************************************
INSTANCE DIA_Dragomir_Settlers   (C_INFO)
{
	npc         = BAU_983_Dragomir;
	nr          = 2;
	condition   = DIA_Dragomir_Settlers_Condition;
	information = DIA_Dragomir_Settlers_Info;
	permanent   = FALSE;
	description = "Kdo tenhle tábor dâív využíval?";
};
FUNC INT DIA_Dragomir_Settlers_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Dragomir_OutHere))
	{ 
		return TRUE;
	};		
};
FUNC VOID DIA_Dragomir_Settlers_Info()
{
	AI_Output (other,self ,"DIA_Dragomir_Settlers_15_00"); //Kdo tenhle tábor dâív využíval?
	AI_Output (self ,other,"DIA_Dragomir_Settlers_12_01"); //Nemám tušení, asi nęjací lovci. Pâedpokládám, že to tu pro nę začalo být pâíliš nebezpečné.
};


// ***********************************************************
// 							Dangerous
// ***********************************************************
INSTANCE DIA_Dragomir_Dangerous   (C_INFO)
{
	npc         = BAU_983_Dragomir;
	nr          = 2;
	condition   = DIA_Dragomir_Dangerous_Condition;
	information = DIA_Dragomir_Dangerous_Info;
	permanent   = FALSE;
	description = "Není to tu pâíliš nebezpečné?";
};
FUNC INT DIA_Dragomir_Dangerous_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Dragomir_OutHere))
	{ 
		return TRUE;
	};		
};
FUNC VOID DIA_Dragomir_Dangerous_Info()
{
	AI_Output (other,self ,"DIA_Dragomir_Dangerous_15_00"); //Není to tu pâíliš nebezpečné?
	AI_Output (self ,other,"DIA_Dragomir_Dangerous_12_01"); //No, ne, když se dokážeš bránit. Moje kuše už mi mnohokrát prokázala neocenitelné služby.
	AI_Output (other,self ,"DIA_Dragomir_Dangerous_15_02"); //Ta ale není moc velká.
	AI_Output (self ,other,"DIA_Dragomir_Dangerous_12_03"); //Ale stačí. Když víš, jak s ní zacházet. Míval jsem vętší. Bohužel jsem ji však ztratil.
	AI_Output (self ,other,"DIA_Dragomir_Dangerous_12_04"); //Dostal jsem se do hor daleko na severu. Je tam kruh monolitů s obętním oltáâem.
	AI_Output (self ,other,"DIA_Dragomir_Dangerous_12_05"); //Když jsem tam lovil mrchožrouty, začali z lesa vylézat ti odporní nemrtví a napadli mę.
	AI_Output (self ,other,"DIA_Dragomir_Dangerous_12_06"); //Jediné, co jsem mohl dęlat, bylo vzít nohy na ramena.
	AI_Output (self ,other,"DIA_Dragomir_Dangerous_12_07"); //Jak jsem utíkal, vyklouzla mi ta kuše z rukou. Vsadím se, že se tam ještę poâád u toho podivného kamenného kruhu na severu nękde povaluje.

	Log_CreateTopic (TOPIC_DragomirsArmbrust, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DragomirsArmbrust, LOG_RUNNING);
	B_LogEntry (TOPIC_DragomirsArmbrust,"V podivném kamenném kruhu vysoko v horách na severu ztratil Dragomir kuši."); 

	MIS_DragomirsArmbrust = LOG_RUNNING;
};

// ***********************************************************
// 							Armbrust
// ***********************************************************
INSTANCE DIA_Dragomir_Armbrust   (C_INFO)
{
	npc         = BAU_983_Dragomir;
	nr          = 2;
	condition   = DIA_Dragomir_Armbrust_Condition;
	information = DIA_Dragomir_Armbrust_Info;
	permanent   = FALSE;
	description = "Tady. Našel jsem tvou kuši.";
};
FUNC INT DIA_Dragomir_Armbrust_Condition()
{
	if (MIS_DragomirsArmbrust == LOG_RUNNING)
	&& (Npc_HasItems (other,ItRw_DragomirsArmbrust_MIS))
	{ 
		return TRUE;
	};		
};
FUNC VOID DIA_Dragomir_Armbrust_Info()
{
	AI_Output (other,self ,"DIA_Dragomir_Armbrust_15_00"); //Tady. Našel jsem tvou kuši.
	B_GiveInvItems (other, self, ItRw_DragomirsArmbrust_MIS, 1);					
	AI_Output (self ,other,"DIA_Dragomir_Armbrust_12_01"); //Opravdu, je to ta moje. Neâíkej, žes byl tam nahoâe u kamenného kruhu?!
	AI_Output (other,self ,"DIA_Dragomir_Armbrust_15_02"); //To si piš!
	AI_Output (self ,other,"DIA_Dragomir_Armbrust_12_03"); //To od tebe byla pękná lehkovážnost. Ale jinak díky.
	AI_Output (self ,other,"DIA_Dragomir_Armbrust_12_04"); //Samozâejmę ti za ni zaplatím. Doufám, že tohle bude stačit.

	CreateInvItems (self, ItMi_Gold, 150);									
	B_GiveInvItems (self, other, ItMi_Gold, 150);					
	MIS_DragomirsArmbrust = LOG_SUCCESS;
	B_GivePlayerXP (XP_DragomirsArmbrust);
};

// ***********************************************************
// 							Kannst du mir was beibringen?
// ***********************************************************

//---------------------------------------
var int Dragomir_TeachPlayer;
const int Dragomir_TeachingCost = 150;
//---------------------------------------

INSTANCE DIA_Dragomir_Learn   (C_INFO)
{
	npc         = BAU_983_Dragomir;
	nr          = 2;
	condition   = DIA_Dragomir_Learn_Condition;
	information = DIA_Dragomir_Learn_Info;
	permanent   = TRUE;
	description = "Můžeš mę nęčemu naučit?";
};
FUNC INT DIA_Dragomir_Learn_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Dragomir_Dangerous))
	&& (Dragomir_TeachPlayer == FALSE)
	{ 
		return TRUE;
	};		
};
FUNC VOID DIA_Dragomir_Learn_Info()
{
	AI_Output (other,self ,"DIA_Dragomir_Learn_15_00"); //Můžeš mę nęčemu naučit?
	
	if (other.attribute[ATR_DEXTERITY] < 30)
	{
		AI_Output (self ,other,"DIA_Dragomir_Learn_12_01"); //Než tę budu moct začít cokoli učit, musíš nejprve posílit svoji obratnost.
	}
	else
	{
		AI_Output (self ,other,"DIA_Dragomir_Learn_12_02"); //Jestli na to máš. Jak už jsem âekl, právę se mi ponękud nedostává hotovosti.
		AI_Output (other,self ,"DIA_Dragomir_Learn_15_03"); //Kolik chceš?
		B_Say_Gold (self,other,Dragomir_TeachingCost);
		
		Info_ClearChoices (DIA_Dragomir_Learn);
		Info_AddChoice (DIA_Dragomir_Learn,"Možná pozdęji.",DIA_Dragomir_Learn_Later);
		if (Npc_HasItems (other,ItMi_Gold) >= Dragomir_TeachingCost)
		{ 
			Info_AddChoice (DIA_Dragomir_Learn,"Tady je zlato.",DIA_Dragomir_Learn_Here);
		};
	};	
};

FUNC VOID DIA_Dragomir_Learn_Later()
{
	AI_Output (other,self ,"DIA_Dragomir_Learn_Later_15_00"); //Možná pozdęji.
	Info_ClearChoices (DIA_Dragomir_Learn);
};

FUNC VOID DIA_Dragomir_Learn_Here()
{
	AI_Output (other,self ,"DIA_Dragomir_Learn_Here_15_00"); //Tady je zlato.
	B_GiveInvItems (other,self,ItMi_Gold,Dragomir_TeachingCost);
	AI_Output (self ,other,"DIA_Dragomir_Learn_Here_12_01"); //Výbornę, jestli se nemýlím, můžeme hned začít.
	
	Dragomir_TeachPlayer = TRUE;
	Info_ClearChoices (DIA_Dragomir_Learn);
};

// ***********************************************************
// 							Teach
// ***********************************************************

//------------------------------------------------------------
var int DIA_Dragomir_Teach_permanent;
//------------------------------------------------------------

INSTANCE DIA_Dragomir_Teach   (C_INFO)
{
	npc         = BAU_983_Dragomir;
	nr          = 2;
	condition   = DIA_Dragomir_Teach_Condition;
	information = DIA_Dragomir_Teach_Info;
	permanent   = TRUE;
	description = "Můžeš mę nęčemu naučit?";
};
FUNC INT DIA_Dragomir_Teach_Condition()
{
	if (Dragomir_TeachPlayer == TRUE)
	&& (DIA_Dragomir_Teach_permanent == FALSE)
	{ 
		return TRUE;
	};		
};
FUNC VOID DIA_Dragomir_Teach_Info()
{
	AI_Output (other,self ,"DIA_Dragomir_Teach_15_00"); //Můžeš mę nęčemu naučit?
		
	Info_ClearChoices 	(DIA_Dragomir_Teach);
	Info_AddChoice 		(DIA_Dragomir_Teach,	DIALOG_BACK		,DIA_Dragomir_Teach_Back);
	Info_AddChoice		(DIA_Dragomir_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))		,DIA_Dragomir_Teach_1H_1);
	Info_AddChoice		(DIA_Dragomir_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)*5)	,DIA_Dragomir_Teach_1H_5);

};


func void DIA_Dragomir_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_CROSSBOW] >= 75)
	{
		AI_Output(self,other,"DIA_Dragomir_Teach_12_00"); //Už tę nemám čemu učit. Je načase, aby sis našel nękoho zkušenęjšího.
		DIA_Dragomir_Teach_permanent = TRUE;
		
	};
	Info_ClearChoices (DIA_Dragomir_Teach);
};

func void DIA_Dragomir_Teach_1H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 1, 75);
	
	Info_ClearChoices 	(DIA_Dragomir_Teach);
	Info_AddChoice 		(DIA_Dragomir_Teach,	DIALOG_BACK		,DIA_Dragomir_Teach_Back);
	Info_AddChoice		(DIA_Dragomir_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))		,DIA_Dragomir_Teach_1H_1);
	Info_AddChoice		(DIA_Dragomir_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)*5)	,DIA_Dragomir_Teach_1H_5);
};

func void DIA_Dragomir_Teach_1H_5 ()	
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_CROSSBOW, 5, 75);
	
	Info_ClearChoices 	(DIA_Dragomir_Teach);
	Info_AddChoice 		(DIA_Dragomir_Teach,	DIALOG_BACK		,DIA_Dragomir_Teach_Back);
	Info_AddChoice		(DIA_Dragomir_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1))		,DIA_Dragomir_Teach_1H_1);
	Info_AddChoice		(DIA_Dragomir_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)*5)	,DIA_Dragomir_Teach_1H_5);
};	
	
	

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Dragomir_PICKPOCKET (C_INFO)
{
	npc			= BAU_983_Dragomir;
	nr			= 900;
	condition	= DIA_Dragomir_PICKPOCKET_Condition;
	information	= DIA_Dragomir_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Dragomir_PICKPOCKET_Condition()
{
	C_Beklauen (47, 70);
};
 
FUNC VOID DIA_Dragomir_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Dragomir_PICKPOCKET);
	Info_AddChoice		(DIA_Dragomir_PICKPOCKET, DIALOG_BACK 		,DIA_Dragomir_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Dragomir_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Dragomir_PICKPOCKET_DoIt);
};

func void DIA_Dragomir_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Dragomir_PICKPOCKET);
};
	
func void DIA_Dragomir_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Dragomir_PICKPOCKET);
};


	
	
