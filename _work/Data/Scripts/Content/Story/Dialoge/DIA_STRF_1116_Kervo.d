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

	description	 = 	"Coœ nie tak?";
};

func int DIA_Kervo_WASIST_Condition ()
{
	return TRUE;
};

func void DIA_Kervo_WASIST_Info ()
{
	AI_Output			(other, self, "DIA_Kervo_WASIST_15_00"); //Coœ nie tak?
	AI_Output			(self, other, "DIA_Kervo_WASIST_13_01"); //Naprawdê musisz o to pytaæ? Nie wystarczy rozejrzeæ siê dooko³a?
	AI_Output			(self, other, "DIA_Kervo_WASIST_13_02"); //Odk¹d tu przyby³em, ci cholerni topielcy zd¹¿yli siê pojawiæ na ca³ej d³ugoœci rzeki.
	AI_Output			(self, other, "DIA_Kervo_WASIST_13_03"); //Na pocz¹tku by³o ich tylko dwóch. Wczoraj widzia³em ju¿ przynajmniej piêciu.
	AI_Output			(self, other, "DIA_Kervo_WASIST_13_04"); //Nie mam pojêcia, jak siê st¹d wydostanê.
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

	description	 = 	"Próbowa³eœ drogi przez prze³êcz?";
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
	AI_Output			(other, self, "DIA_Kervo_HILFE_15_00"); //Próbowa³eœ drogi przez prze³êcz?
	AI_Output			(self, other, "DIA_Kervo_HILFE_13_01"); //Czy wygl¹dam na szaleñca? Dwudziestu ¿o³nierzy nie zdo³a³oby mnie st¹d wyci¹gn¹æ, dopóki grasuj¹ tam te bestie. Nienawidzê ich.
	AI_Output			(self, other, "DIA_Kervo_HILFE_13_02"); //Ju¿ sam ich smród wywo³uje u mnie zimne dreszcze. A ich gulgotanie dos³ownie mrozi krew w ¿y³ach.
	AI_Output			(self, other, "DIA_Kervo_HILFE_13_03"); //Jeœli tak strasznie chcesz, ¿eby obdarli ciê ze skóry, to proszê bardzo, idŸ do nich.

	Info_ClearChoices	(DIA_Kervo_HILFE);
	Info_AddChoice	(DIA_Kervo_HILFE, "Dobrze, a zatem ruszam.", DIA_Kervo_HILFE_tschau );
	Info_AddChoice	(DIA_Kervo_HILFE, "Ale przecie¿ nie mo¿esz tu zostaæ na zawsze.", DIA_Kervo_HILFE_ewig );

	if (Kervo_GotStuff == TRUE)
	{
		Info_AddChoice	(DIA_Kervo_HILFE, "Co dostanê, jeœli ich zabijê?", DIA_Kervo_HILFE_Problem );
	};

	MIS_Kervo_KillLurker = LOG_RUNNING;
};
func void DIA_Kervo_HILFE_ewig ()
{
	AI_Output			(other, self, "DIA_Kervo_HILFE_ewig_15_00"); //Ale przecie¿ nie mo¿esz tu zostaæ na zawsze.
	AI_Output			(self, other, "DIA_Kervo_HILFE_ewig_13_01"); //Nie mam pojêcia, czego ode mnie chcesz, ale powiem ci tylko jedno: nigdzie siê st¹d nie ruszê.
};
var int Kervo_PromiseNugget;
func void DIA_Kervo_HILFE_Problem ()
{
	AI_Output			(other, self, "DIA_Kervo_HILFE_Problem_15_00"); //Co dostanê, jeœli ich zabijê?
	AI_Output			(self, other, "DIA_Kervo_HILFE_Problem_13_01"); //Hm. W zasadzie wystarczy³oby, gdybyœ pozby³ siê tych topielców sprzed jaskini.
	
	if (hero.guild == GIL_KDF)
	{	
		AI_Output			(self, other, "DIA_Kervo_HILFE_Problem_13_02"); //Znalaz³em czarny kamieñ runiczny. Poniewa¿ jesteœ magiem, z pewnoœci¹ znajdziesz dla niego jakieœ zastosowanie.
	}
	else
	{
		AI_Output			(self, other, "DIA_Kervo_HILFE_Problem_13_03"); //Znalaz³em bry³ê rudy.
	};

	AI_Output			(self, other, "DIA_Kervo_HILFE_Problem_13_04"); //Dostaniesz j¹ jako zap³atê.
	Kervo_PromiseNugget = TRUE;
	AI_StopProcessInfos (self);
};

func void DIA_Kervo_HILFE_tschau ()
{
	AI_Output			(other, self, "DIA_Kervo_HILFE_tschau_15_00"); //Dobrze, a zatem ruszam.
	AI_Output			(self, other, "DIA_Kervo_HILFE_tschau_13_01"); //Jasne. Nie bêdê ciê zatrzymywa³.

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

	description = 	"Pozby³em siê topielców sprzed wejœcia do jaskini.";	
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
	AI_Output			(other, self, "DIA_Kervo_LurkerPlatt_15_00"); //Pozby³em siê topielców sprzed wejœcia do jaskini.
	AI_Output			(self, other, "DIA_Kervo_LurkerPlatt_13_01"); //Doskonale. Nareszcie znowu czujê siê wolny.

	if (Kervo_PromiseNugget == TRUE)
	{
		AI_Output			(self, other, "DIA_Kervo_LurkerPlatt_13_02"); //Proszê, zgodnie z obietnic¹.
	
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

	description = 	"Czy teraz zechcesz przekroczyæ prze³êcz?";	
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
	AI_Output			(other, self, "DIA_Kervo_VERGISSES_15_00"); //Czy teraz zechcesz przekroczyæ prze³êcz?
	AI_Output			(self, other, "DIA_Kervo_VERGISSES_13_01"); //Nic z tego. Jeœli mnie z³api¹, zabior¹ mnie z powrotem do kopalni. Nigdzie siê nie ruszam.
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









