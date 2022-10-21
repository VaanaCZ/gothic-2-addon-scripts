///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Kervo_EXIT   (C_INFO)
{
	npc         = STRF_1116_Kervo;
	nr          = 999;
	condition   = DIA_Kervo_EXIT_Condition;
	information = DIA_Kervo_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Kervo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kervo_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info wasist
///////////////////////////////////////////////////////////////////////
instance DIA_Kervo_WASIST		(C_INFO)
{
	npc		 = 	STRF_1116_Kervo;
	nr		 = 	4;
	condition	 = 	DIA_Kervo_WASIST_Condition;
	information	 = 	DIA_Kervo_WASIST_Info;

	description	 = 	"Was ist los mit dir?";
};

func int DIA_Kervo_WASIST_Condition ()
{
	return TRUE;
};

func void DIA_Kervo_WASIST_Info ()
{
	AI_Output			(other, self, "DIA_Kervo_WASIST_15_00"); //Was ist los mit dir?
	AI_Output			(self, other, "DIA_Kervo_WASIST_13_01"); //Das fragst du noch? Guck dich doch mal um.
	AI_Output			(self, other, "DIA_Kervo_WASIST_13_02"); //Diese verdammten Lurker haben den ganzen Fluss in Beschlag genommen, seit ich hier bin.
	AI_Output			(self, other, "DIA_Kervo_WASIST_13_03"); //Erst waren es nur zwei. Seit gestern habe ich mindestens fünf gezählt.
	AI_Output			(self, other, "DIA_Kervo_WASIST_13_04"); //Keine Ahnung, wie ich hier jemals wieder rauskommen soll.
};


///////////////////////////////////////////////////////////////////////
//	Info Hilfe
///////////////////////////////////////////////////////////////////////
instance DIA_Kervo_HILFE		(C_INFO)
{
	npc		 = 	STRF_1116_Kervo;
	nr		 = 	5;
	condition	 = 	DIA_Kervo_HILFE_Condition;
	information	 = 	DIA_Kervo_HILFE_Info;

	description	 = 	"Hast du schon versucht, zum Pass zu gelangen?";
};

func int DIA_Kervo_HILFE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kervo_WASIST))
		{
				return TRUE;
		};
};
func void DIA_Kervo_HILFE_Info ()
{
	AI_Output			(other, self, "DIA_Kervo_HILFE_15_00"); //Hast du schon versucht, zum Pass zu gelangen?
	AI_Output			(self, other, "DIA_Kervo_HILFE_13_01"); //Bin ich denn wahnsinnig. Mich kriegen hier keine 20 Soldaten wieder raus, solange die Viecher da draußen sind. Ich hasse die Biester.
	AI_Output			(self, other, "DIA_Kervo_HILFE_13_02"); //(völlig abgedreht) Wenn ich sie schon rieche, dann kriege ich Schweißausbrüche. Und dieses ständige Gegluckse, dass einem das Blut in den Adern stockt.
	AI_Output			(self, other, "DIA_Kervo_HILFE_13_03"); //Wenn du dir von denen das Fell abziehen lassen willst, dann tu dir keinen Zwang an.

	Info_ClearChoices	(DIA_Kervo_HILFE);
	Info_AddChoice	(DIA_Kervo_HILFE, "Ich geh dann mal.", DIA_Kervo_HILFE_tschau );
	Info_AddChoice	(DIA_Kervo_HILFE, "Du kannst doch nicht ewig hier bleiben.", DIA_Kervo_HILFE_ewig );

	if (Kervo_GotStuff == TRUE)
	{
		Info_AddChoice	(DIA_Kervo_HILFE, "Was würde von dir bekommen, wenn ich die Biester töte?", DIA_Kervo_HILFE_Problem );
	};

	MIS_Kervo_KillLurker = LOG_RUNNING;
};
func void DIA_Kervo_HILFE_ewig ()
{
	AI_Output			(other, self, "DIA_Kervo_HILFE_ewig_15_00"); //Du kannst doch nicht ewig hier bleiben.
	AI_Output			(self, other, "DIA_Kervo_HILFE_ewig_13_01"); //Keine Ahnung, was du von mir willst, aber weg kriegst du mich hier bestimmt nicht, das kann ich dir sagen.
};
var int Kervo_PromiseNugget;
func void DIA_Kervo_HILFE_Problem ()
{
	AI_Output			(other, self, "DIA_Kervo_HILFE_Problem_15_00"); //Was würde ich von dir bekommen, wenn ich die Biester töte?
	AI_Output			(self, other, "DIA_Kervo_HILFE_Problem_13_01"); //Mmh. Nun ja. Es würde schon reichen, wenn die Lurker vor der Höhle verschwinden würden.
	
	if (hero.guild == GIL_KDF)
	{	
		AI_Output			(self, other, "DIA_Kervo_HILFE_Problem_13_02"); //Ich habe einen Runenrohling gefunden. Du als Magier kannst ihn doch sicher gebrauchen.
	}
	else
	{
		AI_Output			(self, other, "DIA_Kervo_HILFE_Problem_13_03"); //Ich habe einen Brocken Erz gefunden.
	};

	AI_Output			(self, other, "DIA_Kervo_HILFE_Problem_13_04"); //Den würde ich dir dafür geben.
	Kervo_PromiseNugget = TRUE;
	AI_StopProcessInfos (self);
};

func void DIA_Kervo_HILFE_tschau ()
{
	AI_Output			(other, self, "DIA_Kervo_HILFE_tschau_15_00"); //Ich geh dann mal.
	AI_Output			(self, other, "DIA_Kervo_HILFE_tschau_13_01"); //Klar. Ich werde dich nicht aufhalten.

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info LurkerPlatt
///////////////////////////////////////////////////////////////////////
instance DIA_Kervo_LurkerPlatt		(C_INFO)
{
	npc		 = 	STRF_1116_Kervo;
	condition	 = 	DIA_Kervo_LurkerPlatt_Condition;
	information	 = 	DIA_Kervo_LurkerPlatt_Info;

	description = 	"Die Lurker vor der Höhle sind weg.";	
};

func int DIA_Kervo_LurkerPlatt_Condition ()
{
	if 	(MIS_Kervo_KillLurker == LOG_RUNNING)
	&& (Npc_IsDead(Kervo_Lurker1))
	&& (Npc_IsDead(Kervo_Lurker2))
	&& (Npc_IsDead(Kervo_Lurker3))
	&& (Npc_IsDead(Kervo_Lurker4))
	&& (Npc_IsDead(Kervo_Lurker5))
	&& (Npc_IsDead(Kervo_Lurker6))
		{
			return TRUE;
		};
};

func void DIA_Kervo_LurkerPlatt_Info ()
{
	AI_Output			(other, self, "DIA_Kervo_LurkerPlatt_15_00"); //Die Lurker vor der Höhle sind weg.
	AI_Output			(self, other, "DIA_Kervo_LurkerPlatt_13_01"); //Großartig. Jetzt kann ich wenigstens wieder durchatmen.

	if (Kervo_PromiseNugget == TRUE)
	{
		AI_Output			(self, other, "DIA_Kervo_LurkerPlatt_13_02"); //Hier hast du das versprochene Ding.
	
		if (hero.guild == GIL_KDF)
		{
			B_GiveInvItems (self, other, ItMi_RuneBlank, 1);					
		}
		else
		{
			B_GiveInvItems (self, other, ItMi_Nugget, 1);					
		};	
	};
	B_GivePlayerXP (XP_KervoKillLurker);
	MIS_Kervo_KillLurker = LOG_SUCCESS;
};

///////////////////////////////////////////////////////////////////////
//	Info Vergisses
///////////////////////////////////////////////////////////////////////
instance DIA_Kervo_VERGISSES		(C_INFO)
{
	npc		 = 	STRF_1116_Kervo;
	condition	 = 	DIA_Kervo_VERGISSES_Condition;
	information	 = 	DIA_Kervo_VERGISSES_Info;
	permanent	 = 	TRUE;

	description = 	"Gehst du jetzt über den Pass?";	
};

func int DIA_Kervo_VERGISSES_Condition ()
{
	if 	(MIS_Kervo_KillLurker == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Kervo_VERGISSES_Info ()
{
	AI_Output			(other, self, "DIA_Kervo_VERGISSES_15_00"); //Gehst du jetzt über den Pass?
	AI_Output			(self, other, "DIA_Kervo_VERGISSES_13_01"); //Vergiss es, Mann. Wenn sie mich erwischen, muss ich wieder in die Minen. Ich geh hier nicht weg.
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Kervo_PICKPOCKET (C_INFO)
{
	npc			= STRF_1116_Kervo;
	nr			= 900;
	condition	= DIA_Kervo_PICKPOCKET_Condition;
	information	= DIA_Kervo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Kervo_PICKPOCKET_Condition()
{
	C_Beklauen (34, 10);
};
 
FUNC VOID DIA_Kervo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Kervo_PICKPOCKET);
	Info_AddChoice		(DIA_Kervo_PICKPOCKET, DIALOG_BACK 		,DIA_Kervo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Kervo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Kervo_PICKPOCKET_DoIt);
};

func void DIA_Kervo_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Kervo_PICKPOCKET);
};
	
func void DIA_Kervo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Kervo_PICKPOCKET);
};









