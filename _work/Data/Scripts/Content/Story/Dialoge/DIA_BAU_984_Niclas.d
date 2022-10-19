
// ***********************************************************
// 							EXIT
// ***********************************************************
INSTANCE DIA_Niclas_EXIT   (C_INFO)
{
	npc         = BAU_984_Niclas;
	nr          = 999;
	condition   = DIA_Niclas_EXIT_Condition;
	information = DIA_Niclas_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Niclas_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Niclas_EXIT_Info()
{
	AI_StopProcessInfos (self);
};						

// ***********************************************************
// 							Hello
// ***********************************************************
INSTANCE DIA_Niclas_Hello   (C_INFO)
{
	npc         = BAU_984_Niclas;
	nr          = 1;
	condition   = DIA_Niclas_Hello_Condition;
	information = DIA_Niclas_Hello_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Niclas_Hello_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Niclas_Hello_Info()
{
	AI_Output (self ,other,"DIA_Niclas_Hello_03_00"); //Sei fuggito anche tu?
	AI_Output (other,self ,"DIA_Niclas_Hello_15_01"); //Cosa te lo fa pensare?
	AI_Output (self ,other,"DIA_Niclas_Hello_03_02"); //Altrimenti perché saresti venuto qui tutto solo? Non c'è NIENTE qui.
};

// ***********************************************************
// 							Ich wollte mich nur mal umsehen.
// ***********************************************************
INSTANCE DIA_Niclas_HaveALook   (C_INFO)
{
	npc         = BAU_984_Niclas;
	nr          = 1;
	condition   = DIA_Niclas_HaveALook_Condition;
	information = DIA_Niclas_HaveALook_Info;
	permanent   = FALSE;
	description = "Volevo solo dare un'occhiata in giro.";
};
FUNC INT DIA_Niclas_HaveALook_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Niclas_HaveALook_Info()
{
	AI_Output (other,self ,"DIA_Niclas_HaveALook_15_00"); //Volevo solo dare un'occhiata in giro.
	AI_Output (self ,other,"DIA_Niclas_HaveALook_03_01"); //D’accordo, mettiti comodo. Ti andrebbe un pezzo di carne?
	
	CreateInvItems (self,ItFoMutton,1);
	
	Info_ClearChoices (DIA_Niclas_HaveALook);
	Info_AddChoice (DIA_Niclas_HaveALook,"No, grazie.",DIA_Niclas_HaveALook_No);
	Info_AddChoice (DIA_Niclas_HaveALook,"Sì, con piacere.",DIA_Niclas_HaveALook_Yes);
};

FUNC VOID DIA_Niclas_HaveALook_No ()
{
	AI_Output (other,self ,"DIA_Niclas_HaveALook_No_15_00"); //No, grazie.
	AI_Output (self ,other,"DIA_Niclas_HaveALook_No_03_01"); //Fai come vuoi. Spero non ti dia fastidio se io intanto mangio.
	
	B_UseItem (self ,ItFoMutton);
	
	Info_ClearChoices (DIA_Niclas_HaveALook);
};

FUNC VOID DIA_Niclas_HaveALook_Yes ()
{
	AI_Output (other,self ,"DIA_Niclas_HaveALook_Yes_15_00"); //Sì, con piacere.
	AI_Output (self ,other,"DIA_Niclas_HaveALook_Yes_03_01"); //Tieni, il miglior coscio di ratto talpa. Cucinato secondo la mia ricetta personale.
	
	B_GiveInvItems (self ,other,ItFOMutton,1);
	
	Info_ClearChoices (DIA_Niclas_HaveALook);
};

// ***********************************************************
// 					Wieso bist du denn hier?
// ***********************************************************
INSTANCE DIA_Niclas_WhyHere   (C_INFO)
{
	npc         = BAU_984_Niclas;
	nr          = 2;
	condition   = DIA_Niclas_WhyHere_Condition;
	information = DIA_Niclas_WhyHere_Info;
	permanent   = FALSE;
	description = "Allora, perché sei qui?";
};
FUNC INT DIA_Niclas_WhyHere_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Niclas_WhyHere_Info()
{
	AI_Output (other,self ,"DIA_Niclas_WhyHere_15_00"); //Allora, perché sei qui?
	AI_Output (self ,other,"DIA_Niclas_WhyHere_03_01"); //Per avere un po' più di pace. La città mi soffoca.
};

// ***********************************************************
// 			Musst du nicht arbeiten?		
// ***********************************************************
INSTANCE DIA_Niclas_ShouldntWork   (C_INFO)
{
	npc         = BAU_984_Niclas;
	nr          = 2;
	condition   = DIA_Niclas_ShouldntWork_Condition;
	information = DIA_Niclas_ShouldntWork_Info;
	permanent   = FALSE;
	description = "Non hai del lavoro da fare?";
};
FUNC INT DIA_Niclas_ShouldntWork_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Niclas_WhyHere))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Niclas_ShouldntWork_Info()
{
	AI_Output (other,self ,"DIA_Niclas_ShouldntWork_15_00"); //Non hai del lavoro da fare?
	AI_Output (self ,other,"DIA_Niclas_ShouldntWork_03_01"); //Posso procurarmi da solo tutto ciò che mi serve. Mi costruisco le frecce e la natura mi dà da mangiare.
	AI_Output (other,self ,"DIA_Niclas_ShouldntWork_15_02"); //Dunque sei un cacciatore.
	AI_Output (self ,other,"DIA_Niclas_ShouldntWork_03_03"); //In un certo senso, sì. Ma caccio soltanto lo stretto necessario, e non per soldi.
};

// ***********************************************************
// 			Dann kannst du mir bestimmt was beibringen.
// ***********************************************************
INSTANCE DIA_Niclas_CanTeachMe   (C_INFO)
{
	npc         = BAU_984_Niclas;
	nr          = 2;
	condition   = DIA_Niclas_CanTeachMe_Condition;
	information = DIA_Niclas_CanTeachMe_Info;
	permanent   = FALSE;
	description = "In tal caso, sono sicuro che puoi insegnarmi qualcosa.";
};
FUNC INT DIA_Niclas_CanTeachMe_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Niclas_ShouldntWork))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Niclas_CanTeachMe_Info()
{
	AI_Output (other,self ,"DIA_Niclas_CanTeachMe_15_00"); //In tal caso, sono sicuro che puoi insegnarmi qualcosa.
	AI_Output (self ,other,"DIA_Niclas_CanTeachMe_03_01"); //Perché no? Potrei farti vedere come si usa un arco.
	
	Log_CreateTopic	(TOPIC_Teacher, LOG_NOTE);
	B_LogEntry		(TOPIC_Teacher, "Niclas può mostrarmi come migliorare la mia abilità con l'arco.");
};
		
// ***********************************************************
// 			Zeig mir den Umgang mit dem Bogen.
// ***********************************************************
INSTANCE DIA_Niclas_Teach   (C_INFO)
{
	npc         = BAU_984_Niclas;
	nr          = 2;
	condition   = DIA_Niclas_Teach_Condition;
	information = DIA_Niclas_Teach_Info;
	permanent   = TRUE;
	description = "Mostrami come si maneggia un arco.";
};
FUNC INT DIA_Niclas_Teach_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Niclas_CanTeachMe))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Niclas_Teach_Info()
{
	AI_Output (other,self ,"DIA_Niclas_Teach_15_00"); //Mostrami come si maneggia un arco.
	
	if (other.HitChance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Niclas_Teach_03_01"); //Ti ho insegnato tutto ciò che sapevo. Dovrai trovarti un altro maestro.
	}
	else
	{
		Info_ClearChoices (DIA_Niclas_Teach);
		Info_AddChoice		(DIA_Niclas_Teach,DIALOG_BACK,DIA_Niclas_Teach_Back);
		Info_AddChoice		(DIA_Niclas_Teach, B_BuildLearnString(PRINT_LearnBow1, 	B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)),DIA_Niclas_Teach_BOW_1);
		Info_AddChoice		(DIA_Niclas_Teach, B_BuildLearnString(PRINT_LearnBow5, 	B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*5),DIA_Niclas_Teach_BOW_5);
	};
};			
	
FUNC VOID DIA_Niclas_Teach_Back()
{
	if (other.HitChance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Niclas_Teach_03_00"); //Non sono in grado di insegnarti altro.
	};
	
	Info_ClearChoices (DIA_Niclas_Teach);
};

FUNC VOID DIA_Niclas_Teach_BOW_1()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 1, 60);
	
	Info_ClearChoices (DIA_Niclas_Teach);
	Info_AddChoice		(DIA_Niclas_Teach,DIALOG_BACK,DIA_Niclas_Teach_Back);
	Info_AddChoice		(DIA_Niclas_Teach, B_BuildLearnString(PRINT_LearnBow1, 	B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)),DIA_Niclas_Teach_BOW_1);
	Info_AddChoice		(DIA_Niclas_Teach, B_BuildLearnString(PRINT_LearnBow5, 	B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*5),DIA_Niclas_Teach_BOW_5);
};

FUNC VOID DIA_Niclas_Teach_BOW_5()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 5, 60);
	
	Info_ClearChoices (DIA_Niclas_Teach);
	Info_AddChoice		(DIA_Niclas_Teach,DIALOG_BACK,DIA_Niclas_Teach_Back);
	Info_AddChoice		(DIA_Niclas_Teach, B_BuildLearnString(PRINT_LearnBow1, 	B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)),DIA_Niclas_Teach_BOW_1);
	Info_AddChoice		(DIA_Niclas_Teach, B_BuildLearnString(PRINT_LearnBow5, 	B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*5),DIA_Niclas_Teach_BOW_5);
};	

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Niclas_PICKPOCKET (C_INFO)
{
	npc			= BAU_984_Niclas;
	nr			= 900;
	condition	= DIA_Niclas_PICKPOCKET_Condition;
	information	= DIA_Niclas_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Niclas_PICKPOCKET_Condition()
{
	C_Beklauen (27, 20);
};
 
FUNC VOID DIA_Niclas_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Niclas_PICKPOCKET);
	Info_AddChoice		(DIA_Niclas_PICKPOCKET, DIALOG_BACK 		,DIA_Niclas_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Niclas_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Niclas_PICKPOCKET_DoIt);
};

func void DIA_Niclas_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Niclas_PICKPOCKET);
};
	
func void DIA_Niclas_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Niclas_PICKPOCKET);
};


