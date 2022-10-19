// ***********************************************************
// 						 	EXIT
// ***********************************************************
INSTANCE DIA_Meldor_EXIT   (C_INFO)
{
	npc         = VLK_415_Meldor;
	nr          = 999;
	condition   = DIA_Meldor_EXIT_Condition;
	information = DIA_Meldor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Meldor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Meldor_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ***********************************************************
// 						 	Hallo
// ***********************************************************
instance DIA_Meldor_Hallo		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 2;
	condition	= DIA_Meldor_Hallo_Condition;
	information	= DIA_Meldor_Hallo_Info;
	permanent 	= FALSE;
	important	= TRUE;
};

func int DIA_Meldor_Hallo_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Meldor_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Meldor_Hallo_07_00"); //�Qu� es lo que quieres?
	AI_Output (other, self, "DIA_Meldor_Hallo_15_01"); //Quer�a echar un vistazo por aqu�...
	AI_Output (self, other, "DIA_Meldor_Hallo_07_02"); //�Y d�nde te diriges, exactamente?
};

// ***********************************************************
// 						 	Interessantes
// ***********************************************************
instance DIA_Meldor_Interessantes		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 2;
	condition	= DIA_Meldor_Interessantes_Condition;
	information	= DIA_Meldor_Interessantes_Info;
	permanent 	= FALSE;
	description	= "�Qu� cosas interesantes hay aqu� para ver?";
};

func int DIA_Meldor_Interessantes_Condition ()
{
	return TRUE;
};

func void DIA_Meldor_Interessantes_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Interessantes_15_00"); //�Qu� cosas interesantes hay aqu� para ver?
	AI_Output (self, other, "DIA_Meldor_Interessantes_07_01"); //Hay un burdel y una taberna. El due�o se llama Kardif. Si lo que quieres es informaci�n, �l es la persona adecuada.
	AI_Output (self, other, "DIA_Meldor_Interessantes_07_02"); //�Necesitas dinero, por cierto?
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Kardif, el propietario de la taberna del puerto, trafica con informaci�n.");
};

// ***********************************************************
// 						 	Lehmar
// ***********************************************************
instance DIA_Meldor_Lehmar		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 3;
	condition	= DIA_Meldor_Lehmar_Condition;
	information	= DIA_Meldor_Lehmar_Info;
	permanent 	= FALSE;
	description	= "�Lo regalas?";
};

func int DIA_Meldor_Lehmar_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Meldor_Interessantes))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Lehmar_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Lehmar_15_00"); //�Lo regalas?
	AI_Output (self, other, "DIA_Meldor_Lehmar_07_01"); //(Aburrido) No. Pero justo al otro lado de la calle est� la casa de Lehmar, el prestamista.
	AI_Output (self, other, "DIA_Meldor_Lehmar_07_02"); //Estoy seguro de que te dar� unas pocas monedas de oro. Prueba.
	Npc_ExchangeRoutine (self, "START");
};


// ***********************************************************
// 						 	Arbeitest
// ***********************************************************
instance DIA_Meldor_Arbeitest		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 4;
	condition	= DIA_Meldor_Arbeitest_Condition;
	information	= DIA_Meldor_Arbeitest_Info;
	permanent 	= FALSE;
	description	= "�Trabajas para Lehmar?";
};

func int DIA_Meldor_Arbeitest_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Meldor_Lehmar))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Arbeitest_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Arbeitest_15_00"); //�Trabajas para Lehmar?
	AI_Output (self, other, "DIA_Meldor_Arbeitest_07_01"); //Chico listo.
};

// ***********************************************************
// 						 	InsOV
// ***********************************************************
instance DIA_Meldor_InsOV		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 5;
	condition	= DIA_Meldor_InsOV_Condition;
	information	= DIA_Meldor_InsOV_Info;
	permanent 	= FALSE;
	description	= "En realidad iba de camino hacia el barrio alto...";
};

func int DIA_Meldor_InsOV_Condition ()
{
	return TRUE;
};

func void DIA_Meldor_InsOV_Info ()
{
	AI_Output (other, self, "DIA_Meldor_InsOV_15_00"); //En realidad iba de camino hacia el barrio alto...
	AI_Output (self, other, "DIA_Meldor_InsOV_07_01"); //(Sarc�stico) Ya, claro. Y yo iba a subir a un barco para que me llevase a una audiencia con el Rey.
	AI_Output (self, other, "DIA_Meldor_InsOV_07_02"); //La gente como t� y como yo no podemos entrar en el barrio alto desde que llegaron los paladines.
};

// ***********************************************************
// 						 	Citizen
// ***********************************************************
instance DIA_Meldor_Citizen		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 6;
	condition	= DIA_Meldor_Citizen_Condition;
	information	= DIA_Meldor_Citizen_Info;
	permanent 	= FALSE;
	description	= "�Eres habitante de esta ciudad?";
};

func int DIA_Meldor_Citizen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Meldor_InsOV))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Citizen_Info ()
{
	AI_Output (other, self, "DIA_Meldor_Citizen_15_00"); //�Eres habitante de esta ciudad?
	AI_Output (self, other, "DIA_Meldor_Citizen_07_01"); //Si quieres decir que si vivo aqu�, s�. Pero a�n as� no me permiten entrar en el barrio alto.
	AI_Output (self, other, "DIA_Meldor_Citizen_07_02"); //Solo los pijos pueden entrar all�, o los mercaderes y artesanos de la parte baja de la ciudad.
	AI_Output (self, other, "DIA_Meldor_Citizen_07_03"); //La gente del distrito del puerto no tiene mucho peso en Khorinis. Ni siquiera hay una patrulla regular de la milicia aqu� abajo.

};
// ***********************************************************
// 						 Smoke
// ***********************************************************
instance DIA_Meldor_Smoke		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 5;
	condition	= DIA_Meldor_Smoke_Condition;
	information	= DIA_Meldor_Smoke_Info;
	permanent 	= FALSE;
	description	= "�Sabes d�nde puedo comprar hierba?";
};

func int DIA_Meldor_Smoke_Condition ()
{	
	if (MIS_Andre_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Meldor_Smoke_Info ()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	AI_Output (other, self, "DIA_Meldor_Smoke_15_00"); //�Sabes d�nde puedo comprar hierba?
	
	if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
	{
		AI_Output (self, other, "DIA_Meldor_Smoke_07_01"); //(Pens�ndoselo) No, ni idea.
	}
	else
	{
		AI_Output (self, other, "DIA_Meldor_Smoke_07_02"); //Si yo fuera t�, probar�a suerte en la 'Antorcha roja'.
	};
};

// ***********************************************************
// 						 	PERM
// ***********************************************************
var int Meldor_DGNews;
// --------------------

instance DIA_Meldor_PERM		(C_INFO)
{
	npc		 	= VLK_415_Meldor;
	nr 			= 7;
	condition	= DIA_Meldor_PERM_Condition;
	information	= DIA_Meldor_PERM_Info;
	permanent 	= TRUE;
	description	= "�Ha sucedido algo emocionante �ltimamente?";
};

func int DIA_Meldor_PERM_Condition ()
{
	return TRUE;
};

func void DIA_Meldor_PERM_Info ()
{
	AI_Output (other, self, "DIA_Meldor_PERM_15_00"); //�Ha ocurrido algo excitante �ltimamente?
	
	if (Kapitel <= 1)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_01"); //No hace mucho, los guardias de la ciudad pusieron patas arriba todo el distrito del puerto.
		AI_Output (self, other, "DIA_Meldor_PERM_07_02"); //Buscaban cosas robadas. Ha habido muchos robos por aqu� �ltimamente. Especialmente, en los mejores distritos.
		AI_Output (self, other, "DIA_Meldor_PERM_07_03"); //Obviamente, intentan culpar de todo a los pobres piojosos del puerto.
	}
	else if (Andre_Diebesgilde_aufgeraeumt == TRUE)
	&&		(Meldor_DGNews == FALSE)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_04"); //He o�do que se cargaron a una banda de ladrones en las alcantarillas. Murieron todos.
		Meldor_DGNews = TRUE;
	}
	else if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_05"); //Dicen que hay dragones en el Valle de las Minas. Tengo curiosidad por ver cu�ndo los paladines van a partir de aqu� para luchar contra ellos.
	}
	else if (Kapitel == 5)
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_06"); //Supuestamente, los dragones est�n todos muertos. Alguien ha debido barrer aquello con una escoba de acero.
	}
	else
	{
		AI_Output (self, other, "DIA_Meldor_PERM_07_07"); //No.
	};
};

// ***********************************************************
// 						 	Lehmar
// ***********************************************************

instance DIA_Meldor_VonLehmar		(C_INFO)
{
	npc			 = 	VLK_415_Meldor;
	nr			 =  1;
	condition	 = 	DIA_Meldor_VonLehmar_Condition;
	information	 = 	DIA_Meldor_VonLehmar_Info;
	permanent 	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Meldor_VonLehmar_Condition ()
{
	if 	((Lehmar_GeldGeliehen_Day <= (Wld_GetDay()-2))
	&&   (Lehmar_GeldGeliehen != 0))
	&& (RangerHelp_LehmarKohle == FALSE)
	&& (Lehmar.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Meldor_VonLehmar_Info ()
{
	AI_Output (self, other, "DIA_Meldor_VonLehmar_07_00"); //Ey, espera...
	AI_Output (self, other, "DIA_Meldor_VonLehmar_07_01"); //Tengo un mensaje para ti de Lehmar...

	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Meldor_PICKPOCKET (C_INFO)
{
	npc			= VLK_415_Meldor;
	nr			= 900;
	condition	= DIA_Meldor_PICKPOCKET_Condition;
	information	= DIA_Meldor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Meldor_PICKPOCKET_Condition()
{
	C_Beklauen (34, 55);
};
 
FUNC VOID DIA_Meldor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Meldor_PICKPOCKET);
	Info_AddChoice		(DIA_Meldor_PICKPOCKET, DIALOG_BACK 		,DIA_Meldor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Meldor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Meldor_PICKPOCKET_DoIt);
};

func void DIA_Meldor_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Meldor_PICKPOCKET);
};
	
func void DIA_Meldor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Meldor_PICKPOCKET);
};
































