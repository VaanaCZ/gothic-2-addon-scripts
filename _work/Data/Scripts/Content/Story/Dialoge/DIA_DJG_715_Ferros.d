
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_DJG_715_Ferros_EXIT   (C_INFO)
{
	npc         = DJG_715_Ferros;
	nr          = 999;
	condition   = DIA_DJG_715_Ferros_EXIT_Condition;
	information = DIA_DJG_715_Ferros_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_DJG_715_Ferros_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_DJG_715_Ferros_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Info Hello 
//*********************************************************************
INSTANCE DIA_DJG_715_Ferros_Hello   (C_INFO)
{
	npc         = DJG_715_Ferros;
	nr          = 4;
	condition   = DIA_DJG_715_Ferros_Hello_Condition;
	information = DIA_DJG_715_Ferros_Hello_Info;
	permanent   = FALSE;
	description = "D'où venez-vous ?";
};

FUNC INT DIA_DJG_715_Ferros_Hello_Condition()
{
	return TRUE;
};

FUNC VOID DIA_DJG_715_Ferros_Hello_Info()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_Hello_15_00"); //D'où venez-vous ?
	AI_Output (self ,other,"DIA_DJG_715_Ferros_Hello_01_01"); //Du continent. Les miens et moi-même nous nous sommes réfugiés ici.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_Hello_01_02"); //La situation ne fait qu'empirer ici. Les orques ne laissent derrière eux que des villages incendiés.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_Hello_01_03"); //Le roi a perdu le contrôle de son royaume.

	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_DJG_715_Ferros_Hello_01_04"); //Si vous voulez mon avis, vous autres les paladins, vous avez échoué.
	};	
};

//*********************************************************************
//	Info Friends 
//*********************************************************************
INSTANCE DIA_DJG_715_Ferros_Friends   (C_INFO)
{
	npc         = DJG_715_Ferros;
	nr          = 5;
	condition   = DIA_DJG_715_Ferros_Friends_Condition;
	information = DIA_DJG_715_Ferros_Friends_Info;
	permanent   = FALSE;
	description = "Où sont les vôtres maintenant ?";
};

FUNC INT DIA_DJG_715_Ferros_Friends_Condition()
{
	if (Npc_KnowsInfo (other,DIA_DJG_715_Ferros_Hello))
	{
		return TRUE;
	};
};

FUNC VOID DIA_DJG_715_Ferros_Friends_Info()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_Friends_15_00"); //Où sont les vôtres maintenant ?
	AI_Output (self ,other,"DIA_DJG_715_Ferros_Friends_01_01"); //Je les ai quittés.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_Friends_01_02"); //Ils pensaient pouvoir prendre tout ce qu'ils voulaient même si ça ne leur appartenait pas. Je ne mange pas de ce pain-là.
};

//*********************************************************************
//	Info War 
//*********************************************************************
INSTANCE DIA_DJG_715_Ferros_War   (C_INFO)
{
	npc         = DJG_715_Ferros;
	nr          = 6;
	condition   = DIA_DJG_715_Ferros_War_Condition;
	information = DIA_DJG_715_Ferros_War_Info;
	permanent   = FALSE;
	description = "Que savez-vous d'autre sur la guerre ?";
};

FUNC INT DIA_DJG_715_Ferros_War_Condition()
{
	if (Npc_KnowsInfo (other,DIA_DJG_715_Ferros_Hello))
	{
		return TRUE;
	};
};

FUNC VOID DIA_DJG_715_Ferros_War_Info()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_War_15_00"); //Que savez-vous d'autre sur la guerre ?

	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_DJG_715_Ferros_War_01_01"); //Cela fait longtemps que vous n'avez pas vu votre roi, hein ?
	};
	
	AI_Output (self ,other,"DIA_DJG_715_Ferros_War_01_02"); //Les orques assiègent la capitale mais j'ignore si elle est tombée ou non.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_War_01_03"); //La dernière chose que j'ai entendu dire c'est que le roi était mort. Mais je n'y crois pas.
};

//*********************************************************************
//	Was machst du hier in der Burg? 
//*********************************************************************
INSTANCE DIA_DJG_715_Ferros_OldCamp   (C_INFO)
{
	npc         = DJG_715_Ferros;
	nr          = 7;
	condition   = DIA_DJG_715_Ferros_OldCamp_Condition;
	information = DIA_DJG_715_Ferros_OldCamp_Info;
	permanent   = FALSE;
	description = "Que faites-vous au château ?";
};

FUNC INT DIA_DJG_715_Ferros_OldCamp_Condition()
{
	return TRUE;
};

FUNC VOID DIA_DJG_715_Ferros_OldCamp_Info()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_OldCamp_15_00"); //Que faites-vous au château ?
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_01_01"); //J'ai entendu parler des dragons et je voulais aider à les combattre.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_01_02"); //Malheureusement, j'ai perdu mon épée quand je me suis glissé ici en échappant aux orques. Maintenant je suis coincé.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_01_03"); //Sans épée, je ne peux pas sortir. Et celles qu'on peut acheter ici ne valent rien.

	Info_ClearChoices (DIA_DJG_715_Ferros_OldCamp);
	Info_AddChoice (DIA_DJG_715_Ferros_OldCamp,"Je vous souhaite bonne chance dans vos recherches.",DIA_DJG_715_Ferros_OldCamp_No);
	Info_AddChoice (DIA_DJG_715_Ferros_OldCamp,"Que me donnerez-vous si je vous trouve une bonne épée ?",DIA_DJG_715_Ferros_OldCamp_Price);
	Info_AddChoice (DIA_DJG_715_Ferros_OldCamp,"Je trouverai votre épée.",DIA_DJG_715_Ferros_OldCamp_Yes);
	Wld_InsertItem		(ItMW_1H_FerrosSword_Mis , "FP_OW_ITEM_08"); 
	MIS_FerrosSword = LOG_RUNNING; 
	
	Log_CreateTopic (TOPIC_FerrosSword, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FerrosSword, LOG_RUNNING);
	B_LogEntry (TOPIC_FerrosSword,"Féros a laissé son épée chez les orques. C'est stupide."); 
};

FUNC VOID DIA_DJG_715_Ferros_OldCamp_No ()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_OldCamp_No_15_00"); //Je vous souhaite bonne chance dans vos recherches.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_No_01_01"); //Je me demande vraiment pourquoi je suis venu ici.
	
	Info_ClearChoices (DIA_DJG_715_Ferros_OldCamp);
};

FUNC VOID DIA_DJG_715_Ferros_OldCamp_Price ()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_OldCamp_Price_15_00"); //Que me donnerez-vous si je vous trouve une bonne épée ?
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_Price_01_01"); //Hélas, je ne peux rien vous donner. J'ai dépensé tout l'or qui me restait pour mon épée.

	Info_ClearChoices (DIA_DJG_715_Ferros_OldCamp);
};

FUNC VOID DIA_DJG_715_Ferros_OldCamp_Yes ()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_OldCamp_Yes_15_00"); //Je vais retrouver votre épée.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_Yes_01_01"); //Ce serait fantastique. Cherchez-la sur la haute falaise au sud.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_OldCamp_Yes_01_02"); //Je l'ai probablement perdue là, près des tentes des orques.
	B_LogEntry (TOPIC_FerrosSword,"Il semble que Féros ait perdu son épée sur une falaise au sud, là où se dressent les tentes des orques."); 
	
	Info_ClearChoices (DIA_DJG_715_Ferros_OldCamp);
};

//*********************************************************************
//	Info FerrosAnySword
//*********************************************************************
INSTANCE DIA_DJG_715_Ferros_FerrosAnySword   (C_INFO)
{
	npc         = DJG_715_Ferros;
	nr          = 6;
	condition   = DIA_DJG_715_Ferros_FerrosAnySword_Condition;
	information = DIA_DJG_715_Ferros_FerrosAnySword_Info;
	permanent   = FALSE;
	description = "J'ai peut-être une autre épée pour vous.";
};

FUNC INT DIA_DJG_715_Ferros_FerrosAnySword_Condition()
{
	IF 	(	(MIS_FerrosSword == LOG_RUNNING) 
	&&	(	(Npc_HasItems (other,ItMW_1H_Special_01) >= 1)
	|| 		(Npc_HasItems (other,ItMW_1H_Special_02) >= 1)))
	{
		return TRUE;
	};
};

FUNC VOID DIA_DJG_715_Ferros_FerrosAnySword_Info()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_15_00"); //J'ai peut-être une autre épée pour vous.


	Info_ClearChoices (DIA_DJG_715_Ferros_FerrosAnySword);
	
	Info_AddChoice (DIA_DJG_715_Ferros_FerrosAnySword,DIALOG_BACK,DIA_DJG_715_Ferros_FerrosAnySword_Back);
	
	if (Npc_HasItems (other,ItMW_1H_Special_01) >= 1)
	{
		Info_AddChoice (DIA_DJG_715_Ferros_FerrosAnySword,ItMW_1H_Special_01.name,DIA_DJG_715_Ferros_FerrosAnySword_Silverblade);
	};
	if (Npc_HasItems (other,ItMW_1H_Special_02) >= 1)
	{
		Info_AddChoice (DIA_DJG_715_Ferros_FerrosAnySword,ItMW_1H_Special_02.name,DIA_DJG_715_Ferros_FerrosAnySword_Oreblade);
	};
};

FUNC VOID DIA_DJG_715_Ferros_FerrosAnySword_Back ()
{
	Info_ClearChoices (DIA_DJG_715_Ferros_FerrosAnySword);
};

FUNC VOID B_Ferros_FerrosAnySword_Give ()
{
	AI_Output (self ,other,"DIA_DJG_715_Ferros_FerrosAnySword_Give_01_00"); //C'est une bonne épée. Du très bon travail.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_FerrosAnySword_Give_01_01"); //Etes-vous vraiment sûr de vouloir me la donner ?
};

FUNC VOID DIA_DJG_715_Ferros_FerrosAnySword_Silverblade ()
{
	B_Ferros_FerrosAnySword_Give ();
	
	Info_ClearChoices (DIA_DJG_715_Ferros_FerrosAnySword);
	Info_AddChoice (DIA_DJG_715_Ferros_FerrosAnySword,"Non, j'en ai besoin.",DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_No);
	Info_AddChoice (DIA_DJG_715_Ferros_FerrosAnySword,"Oui, prenez-la.",DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_Yes);
};

FUNC VOID DIA_DJG_715_Ferros_FerrosAnySword_Oreblade ()
{
	B_Ferros_FerrosAnySword_Give ();
	
	Info_ClearChoices (DIA_DJG_715_Ferros_FerrosAnySword);
	Info_AddChoice (DIA_DJG_715_Ferros_FerrosAnySword,"Non, j'en ai besoin.",DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_No);
	Info_AddChoice (DIA_DJG_715_Ferros_FerrosAnySword,"Oui, prenez-la.",DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_Yes);
};

FUNC VOID B_Ferros_FerrosAnySword_Yes1 ()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes_15_00"); //Oui, prenez-la.
};

FUNC VOID B_Ferros_FerrosAnySword_Yes2 ()
{
	AI_Output (self ,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_00"); //Merci, je vous suis redevable.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_01"); //En échange, je vais vous apprendre une ou deux astuces pour mieux utiliser votre force et votre dextérité en combat.

	Log_CreateTopic	(TOPIC_Teacher, LOG_NOTE);
	B_LogEntry		(TOPIC_Teacher, "Féros peut m'apprendre à augmenter ma force et ma dextérité.");

};

FUNC VOID B_Ferros_FerrosAnySword_No ()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_15_00");	//Non, j'en ai besoin.
	AI_Output (self ,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_01_01");	//Je comprends.
};

FUNC VOID DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_Yes ()
{
	B_Ferros_FerrosAnySword_Yes1();
	B_GiveInvItems (other,self ,ItMW_1H_Special_01,1);
	B_Ferros_FerrosAnySword_Yes2();

	Info_ClearChoices (DIA_DJG_715_Ferros_FerrosAnySword);
	MIS_FerrosSword = LOG_SUCCESS;
	B_GivePlayerXP (XP_FerrosSword);
};

FUNC VOID DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_No ()
{

	B_Ferros_FerrosAnySword_No();
	Info_ClearChoices (DIA_DJG_715_Ferros_FerrosAnySword);
};

FUNC VOID DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_Yes ()
{
	B_Ferros_FerrosAnySword_Yes1();
	B_GiveInvItems (other,self ,ItMW_1H_Special_02,1);
	B_Ferros_FerrosAnySword_Yes2();

	Info_ClearChoices (DIA_DJG_715_Ferros_FerrosAnySword);
	MIS_FerrosSword = LOG_SUCCESS;
	B_GivePlayerXP (XP_FerrosSword);
};

FUNC VOID DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_No ()
{
	B_Ferros_FerrosAnySword_No();

	Info_ClearChoices (DIA_DJG_715_Ferros_FerrosAnySword);
};

//*********************************************************************
//	Info FerrosHisSword
//*********************************************************************
INSTANCE DIA_DJG_715_Ferros_FerrosHisSword   (C_INFO)
{
	npc         = DJG_715_Ferros;
	nr          = 6;
	condition   = DIA_DJG_715_Ferros_FerrosHisSword_Condition;
	information = DIA_DJG_715_Ferros_FerrosHisSword_Info;
	permanent   = FALSE;
	description = "J'ai trouvé votre épée.";
};

FUNC INT DIA_DJG_715_Ferros_FerrosHisSword_Condition()
{
	IF 	(	(MIS_FerrosSword == LOG_RUNNING) 
	&&	(Npc_HasItems (other,ItMW_1H_FerrosSword_Mis) >= 1))
	{
		return TRUE;
	};
};

FUNC VOID DIA_DJG_715_Ferros_FerrosHisSword_Info()
{
	AI_Output (other,self ,"DIA_DJG_715_Ferros_FerrosHisSword_15_00"); //J'ai retrouvé votre épée.
	B_GiveInvItems (other,self,ItMw_1h_FerrosSword_Mis,1);
	B_Ferros_FerrosAnySword_Yes2 ();
	MIS_FerrosSword = LOG_SUCCESS;	
	B_GivePlayerXP (XP_FerrosSword);
};

//*******************************************
//	TechPlayer
//*******************************************

INSTANCE DIA_Ferros_Teach(C_INFO)
{
	npc			= DJG_715_Ferros;
	nr			= 1;
	condition	= DIA_Ferros_Teach_Condition;
	information	= DIA_Ferros_Teach_Info;
	permanent	= TRUE;
	description = "Montrez-moi comment améliorer mes compétences.";
};                       

FUNC INT DIA_Ferros_Teach_Condition()
{
	if (MIS_FerrosSword == LOG_SUCCESS)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Ferros_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Ferros_Teach_15_00"); //Montrez-moi comment améliorer mes caractéristiques.

	if (MIS_OCGateOpen == TRUE)
	{
	AI_Output (self ,other,"DIA_Ferros_Teach_01_01"); //Après ces attaques d'orques, j'arrête. Je suis content d'être encore en vie.
	}
	else
	{
	AI_Output (self ,other,"DIA_Ferros_Teach_01_02"); //Un bon combattant doit apprendre à transmettre ses capacités à son épée.
	
	Info_ClearChoices (DIA_Ferros_Teach);
	Info_AddChoice		(DIA_Ferros_Teach, DIALOG_BACK, DIA_Ferros_Teach_Back);
	Info_AddChoice		(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Ferros_Teach_STR_1);
	Info_AddChoice		(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Ferros_Teach_STR_5);
	Info_AddChoice		(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY))		,DIA_Ferros_Teach_DEX_1);
	Info_AddChoice		(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_Ferros_Teach_DEX_5);
	};

};

FUNC VOID DIA_Ferros_Teach_Back ()
{
	Info_ClearChoices (DIA_Ferros_Teach);
};

FUNC VOID DIA_Ferros_Teach_STR_1 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MED);
	Info_AddChoice		(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Ferros_Teach_STR_1);
};

FUNC VOID DIA_Ferros_Teach_STR_5 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MED);
	Info_AddChoice		(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnSTR5		, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Ferros_Teach_STR_5);
};

FUNC VOID DIA_Ferros_Teach_DEX_1 ()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MED);
	Info_AddChoice		(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY))		,DIA_Ferros_Teach_DEX_1);
};

FUNC VOID DIA_Ferros_Teach_DEX_5 ()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MED);
	Info_AddChoice		(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_Ferros_Teach_DEX_5);
};

//*********************************************************************
//	AllDragonsDead 
//*********************************************************************
INSTANCE DIA_Ferros_AllDragonsDead   (C_INFO)
{
	npc         = DJG_715_Ferros;
	nr          = 5;
	condition   = DIA_Ferros_AllDragonsDead_Condition;
	information = DIA_Ferros_AllDragonsDead_Info;
	permanent   = FALSE;
	description	= "Tous les dragons sont morts.";
				
};

FUNC INT DIA_Ferros_AllDragonsDead_Condition()
{
	if (MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Ferros_AllDragonsDead_Info()
{
	AI_Output	(other,self ,"DIA_Ferros_AllDragonsDead_15_00"); //Tous les dragons sont morts.
	AI_Output 	(self ,other,"DIA_Ferros_AllDragonsDead_01_01"); //Bien joué ! Si on avait plus de gens comme vous, on en serait pas là où on en est.
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ferros_PICKPOCKET (C_INFO)
{
	npc			= DJG_715_Ferros;
	nr			= 900;
	condition	= DIA_Ferros_PICKPOCKET_Condition;
	information	= DIA_Ferros_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Ferros_PICKPOCKET_Condition()
{
	C_Beklauen (56, 75);
};
 
FUNC VOID DIA_Ferros_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ferros_PICKPOCKET);
	Info_AddChoice		(DIA_Ferros_PICKPOCKET, DIALOG_BACK 		,DIA_Ferros_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ferros_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ferros_PICKPOCKET_DoIt);
};

func void DIA_Ferros_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Ferros_PICKPOCKET);
};
	
func void DIA_Ferros_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ferros_PICKPOCKET);
};


