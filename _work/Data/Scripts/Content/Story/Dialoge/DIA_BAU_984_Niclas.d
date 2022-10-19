
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
	AI_Output (self ,other,"DIA_Niclas_Hello_03_00"); //Taky jsi na útêku?
	AI_Output (other,self ,"DIA_Niclas_Hello_15_01"); //Proè si to myslíš?
	AI_Output (self ,other,"DIA_Niclas_Hello_03_02"); //Proè bys sem jinak chodil tak sám? Tady není vùbec NIC.
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
	description = "Jen jsem se tu chtêl trochu porozhlédnout po okolí.";
};
FUNC INT DIA_Niclas_HaveALook_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Niclas_HaveALook_Info()
{
	AI_Output (other,self ,"DIA_Niclas_HaveALook_15_00"); //Jen jsem se tu chtêl trochu porozhlédnout po okolí.
	AI_Output (self ,other,"DIA_Niclas_HaveALook_03_01"); //Dobrá, považuj se za mého hosta. Dal by sis kousek masa?
	
	CreateInvItems (self,ItFoMutton,1);
	
	Info_ClearChoices (DIA_Niclas_HaveALook);
	Info_AddChoice (DIA_Niclas_HaveALook,"Ne, díky.",DIA_Niclas_HaveALook_No);
	Info_AddChoice (DIA_Niclas_HaveALook,"S potêšením.",DIA_Niclas_HaveALook_Yes);
};

FUNC VOID DIA_Niclas_HaveALook_No ()
{
	AI_Output (other,self ,"DIA_Niclas_HaveALook_No_15_00"); //Ne, díky.
	AI_Output (self ,other,"DIA_Niclas_HaveALook_No_03_01"); //Jak je libo. Doufám, že ti nebude vadit, když si sám nêco zakousnu.
	
	B_UseItem (self ,ItFoMutton);
	
	Info_ClearChoices (DIA_Niclas_HaveALook);
};

FUNC VOID DIA_Niclas_HaveALook_Yes ()
{
	AI_Output (other,self ,"DIA_Niclas_HaveALook_Yes_15_00"); //S potêšením.
	AI_Output (self ,other,"DIA_Niclas_HaveALook_Yes_03_01"); //Tady, ta nejlepší rysèí kejtièka. Podle mého vlastního receptu.
	
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
	description = "Tak proè jsi tady?";
};
FUNC INT DIA_Niclas_WhyHere_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Niclas_WhyHere_Info()
{
	AI_Output (other,self ,"DIA_Niclas_WhyHere_15_00"); //Tak proè jsi tady?
	AI_Output (self ,other,"DIA_Niclas_WhyHere_03_01"); //Nalezl jsem tu klid. Ve mêstê jsem se vždycky cítil tak stísnêný.
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
	description = "Nemêl bys pracovat?";
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
	AI_Output (other,self ,"DIA_Niclas_ShouldntWork_15_00"); //Nemêl bys pracovat?
	AI_Output (self ,other,"DIA_Niclas_ShouldntWork_03_01"); //Všechno, co potâebuju, si mùžu udêlat sám. Vyrábím si šípy a pâíroda mi poskytuje maso.
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
	description = "V tom pâípadê bys mê mohl nêco nauèit.";
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
	AI_Output (other,self ,"DIA_Niclas_CanTeachMe_15_00"); //V tom pâípadê bys mê mohl nêco nauèit.
	AI_Output (self ,other,"DIA_Niclas_CanTeachMe_03_01"); //Proè ne. Mùžu ti ukázat, jak se zachází s lukem.
	
	Log_CreateTopic	(TOPIC_Teacher, LOG_NOTE);
	B_LogEntry		(TOPIC_Teacher, "Niclas mi mùže pâedvést, jak se zdokonalit v lukostâelbê.");
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
		AI_Output(self,other,"DIA_Niclas_Teach_03_01"); //Už jsem tê nauèil všemu, co znám. Mêl by sis najít jiného uèitele.
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
		AI_Output(self,other,"DIA_Niclas_Teach_03_00"); //Už tê nemùžu nauèit nièemu dalšímu.
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


