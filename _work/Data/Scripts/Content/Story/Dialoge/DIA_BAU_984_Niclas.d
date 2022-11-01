
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
	AI_Output (self ,other,"DIA_Niclas_Hello_03_00"); //Taky jsi na útęku?
	AI_Output (other,self ,"DIA_Niclas_Hello_15_01"); //Proč si to myslíš?
	AI_Output (self ,other,"DIA_Niclas_Hello_03_02"); //Proč bys sem jinak chodil tak sám? Tady není vůbec NIC.
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
	description = "Jen jsem se tu chtęl trochu porozhlédnout po okolí.";
};
FUNC INT DIA_Niclas_HaveALook_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Niclas_HaveALook_Info()
{
	AI_Output (other,self ,"DIA_Niclas_HaveALook_15_00"); //Jen jsem se tu chtęl trochu porozhlédnout po okolí.
	AI_Output (self ,other,"DIA_Niclas_HaveALook_03_01"); //Dobrá, považuj se za mého hosta. Dal by sis kousek masa?
	
	CreateInvItems (self,ItFoMutton,1);
	
	Info_ClearChoices (DIA_Niclas_HaveALook);
	Info_AddChoice (DIA_Niclas_HaveALook,"Ne, díky.",DIA_Niclas_HaveALook_No);
	Info_AddChoice (DIA_Niclas_HaveALook,"S potęšením.",DIA_Niclas_HaveALook_Yes);
};

FUNC VOID DIA_Niclas_HaveALook_No ()
{
	AI_Output (other,self ,"DIA_Niclas_HaveALook_No_15_00"); //Ne, díky.
	AI_Output (self ,other,"DIA_Niclas_HaveALook_No_03_01"); //Jak je libo. Doufám, že ti nebude vadit, když si sám nęco zakousnu.
	
	B_UseItem (self ,ItFoMutton);
	
	Info_ClearChoices (DIA_Niclas_HaveALook);
};

FUNC VOID DIA_Niclas_HaveALook_Yes ()
{
	AI_Output (other,self ,"DIA_Niclas_HaveALook_Yes_15_00"); //S potęšením.
	AI_Output (self ,other,"DIA_Niclas_HaveALook_Yes_03_01"); //Tady, ta nejlepší rysčí kejtička. Podle mého vlastního receptu.
	
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
	description = "Tak proč jsi tady?";
};
FUNC INT DIA_Niclas_WhyHere_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Niclas_WhyHere_Info()
{
	AI_Output (other,self ,"DIA_Niclas_WhyHere_15_00"); //Tak proč jsi tady?
	AI_Output (self ,other,"DIA_Niclas_WhyHere_03_01"); //Nalezl jsem tu klid. Ve męstę jsem se vždycky cítil tak stísnęný.
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
	description = "Nemęl bys pracovat?";
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
	AI_Output (other,self ,"DIA_Niclas_ShouldntWork_15_00"); //Nemęl bys pracovat?
	AI_Output (self ,other,"DIA_Niclas_ShouldntWork_03_01"); //Všechno, co potâebuju, si můžu udęlat sám. Vyrábím si šípy a pâíroda mi poskytuje maso.
	AI_Output (other,self ,"DIA_Niclas_ShouldntWork_15_02"); //Takže jsi lovec.
	AI_Output (self ,other,"DIA_Niclas_ShouldntWork_03_03"); //Ano, pokud tomu tak chceš âíkat. Ale lovím jen pro vlastní potâebu. Nelovím pro peníze.
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
	description = "V tom pâípadę bys mę mohl nęco naučit.";
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
	AI_Output (other,self ,"DIA_Niclas_CanTeachMe_15_00"); //V tom pâípadę bys mę mohl nęco naučit.
	AI_Output (self ,other,"DIA_Niclas_CanTeachMe_03_01"); //Proč ne. Můžu ti ukázat, jak se zachází s lukem.
	
	Log_CreateTopic	(TOPIC_Teacher, LOG_NOTE);
	B_LogEntry		(TOPIC_Teacher, "Niclas mi může pâedvést, jak se zdokonalit v lukostâelbę.");
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
	description = "Ukaž mi, jak se zachází s lukem.";
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
	AI_Output (other,self ,"DIA_Niclas_Teach_15_00"); //Ukaž mi, jak se zachází s lukem.
	
	if (other.HitChance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Niclas_Teach_03_01"); //Už jsem tę naučil všemu, co znám. Męl by sis najít jiného učitele.
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
		AI_Output(self,other,"DIA_Niclas_Teach_03_00"); //Už tę nemůžu naučit ničemu dalšímu.
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


