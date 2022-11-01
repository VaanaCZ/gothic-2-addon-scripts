
//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_BullcoDJG_EXIT   (C_INFO)
{
	npc         = DJG_701_Bullco;
	nr          = 999;
	condition   = DIA_BullcoDJG_EXIT_Condition;
	information = DIA_BullcoDJG_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_BullcoDJG_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BullcoDJG_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////

instance DIA_BullcoDJG_HALLO		(C_INFO)
{
	npc		 = 	DJG_701_Bullco;
	nr   		= 5;
	condition	 = 	DIA_BullcoDJG_HALLO_Condition;
	information	 = 	DIA_BullcoDJG_HALLO_Info;

	description	 = 	"¿¿Qué pasa??";
};

func int DIA_BullcoDJG_HALLO_Condition ()
{
	if ((Npc_IsDead(DJG_Sylvio))==FALSE)
		{
				return TRUE;
		};
};

func void DIA_BullcoDJG_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_BullcoDJG_HALLO_15_00"); //¿¿Qué pasa??
	AI_Output			(self, other, "DIA_BullcoDJG_HALLO_06_01"); //¡Caramba, que frío hace! No sé por qué Sylvio se ha empeñado en venir aquí.
	AI_Output			(self, other, "DIA_BullcoDJG_HALLO_06_02"); //¡Seguro que hay muchos otros lugares de donde se puede robar algo!
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Wartemal
///////////////////////////////////////////////////////////////////////
instance DIA_BullcoDJG_WARTEMAL		(C_INFO)
{
	npc		 = 	DJG_701_Bullco;
	nr   		= 6;
	condition	 = 	DIA_BullcoDJG_WARTEMAL_Condition;
	information	 = 	DIA_BullcoDJG_WARTEMAL_Info;

	permanent	 = 	TRUE;

	description	 = 	"¿Va bien todo lo demás?";
};

func int DIA_BullcoDJG_WARTEMAL_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_BullcoDJG_HALLO))
		|| (Npc_KnowsInfo(other, DIA_Bullco_WASNUN))
		{
				return TRUE;
		};
};

func void DIA_BullcoDJG_WARTEMAL_Info ()
{
	AI_Output			(other, self, "DIA_BullcoDJG_WARTEMAL_15_00"); //¿Va bien todo lo demás?

	if (Npc_KnowsInfo(other, DIA_Bullco_WASNUN))
		{
		AI_Output			(self, other, "DIA_BullcoDJG_WARTEMAL_06_01"); //No me saques de quicio.
		}
	else
		{
		AI_Output			(self, other, "DIA_BullcoDJG_WARTEMAL_06_02"); //¡Ahora no! ¡Estoy helado! Quiero salir de aquí en cuanto pueda.
		};

	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info SylvioDead
///////////////////////////////////////////////////////////////////////
instance DIA_Bullco_SYLVIODEAD		(C_INFO)
{
	npc		 = 	DJG_701_Bullco;
	nr   		 = 	7;
	condition	 = 	DIA_Bullco_SYLVIODEAD_Condition;
	information	 = 	DIA_Bullco_SYLVIODEAD_Info;
	important	 = 	TRUE;
};

func int DIA_Bullco_SYLVIODEAD_Condition ()
{
	if (Npc_IsDead(DJG_Sylvio))
		{
				return TRUE;
		};
};

func void DIA_Bullco_SYLVIODEAD_Info ()
{
	AI_Output			(self, other, "DIA_Bullco_SYLVIODEAD_06_00"); //Maldita sea. Sylvio ha muerto.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
};

///////////////////////////////////////////////////////////////////////
//	Info Wasnun
///////////////////////////////////////////////////////////////////////
instance DIA_Bullco_WASNUN		(C_INFO)
{
	npc		 = 	DJG_701_Bullco;
	nr		 = 	8;
	condition	 = 	DIA_Bullco_WASNUN_Condition;
	information	 = 	DIA_Bullco_WASNUN_Info;

	description	 = 	"¿Qué planes tienes ahora?";
};

func int DIA_Bullco_WASNUN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bullco_SYLVIODEAD))
		&&(Npc_IsDead(DJG_Sylvio))
		{
				return TRUE;
		};
};

func void DIA_Bullco_WASNUN_Info ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_15_00"); //¿Qué planes tienes ahora que Sylvio ha muerto?
	AI_Output			(self, other, "DIA_Bullco_WASNUN_06_01"); //Ni idea. Si aún me aceptan, supongo que me iré con los demás cazadores de dragones.

	Info_AddChoice	(DIA_Bullco_WASNUN, "Debería arrancarte la cabeza.", DIA_Bullco_WASNUN_kopfab );
	Info_AddChoice	(DIA_Bullco_WASNUN, "¿No sabes dónde están los demás?", DIA_Bullco_WASNUN_woandere );

};

func void DIA_Bullco_WASNUN_woandere ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_woandere_15_00"); //¿No sabes dónde están los demás?
	AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_06_01"); //Creo que sí. Al menos vi a uno de ellos en el río.

	Info_AddChoice	(DIA_Bullco_WASNUN, "Llévame con los demás cazadores de dragones.", DIA_Bullco_WASNUN_woandere_zuihnen );
};
func void DIA_Bullco_WASNUN_woandere_zuihnen ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_woandere_zuihnen_15_00"); //Llévame con los demás cazadores de dragones.
	AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_06_01"); //Eh, no soy tu lacayo.

	Info_ClearChoices	(DIA_Bullco_WASNUN);

	Info_AddChoice	(DIA_Bullco_WASNUN, "Haz lo que quieras.", DIA_Bullco_WASNUN_woandere_zuihnen_alleine );
	Info_AddChoice	(DIA_Bullco_WASNUN, "Considérate afortunado si te dejo vivo.", DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen );
	Info_AddChoice	(DIA_Bullco_WASNUN, "Te pagaré 50 monedas de oro.", DIA_Bullco_WASNUN_woandere_zuihnen_Geld );


};
func void DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen_15_00"); //Considérate afortunado si te dejo vivo.
	AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen_06_01"); //Déjame en paz.
	AI_StopProcessInfos (self);
};

func void DIA_Bullco_WASNUN_woandere_zuihnen_Geld ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_woandere_zuihnen_Geld_15_00"); //Te pagaré 50 monedas de oro.
	
	if (B_GiveInvItems (other, self, ItMi_Gold,50))
		{
			AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_01"); //Muy bien. Suelta la pasta.
			AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_02"); //Sígueme. Te llevaré adonde vi por última vez a uno de los otros cazadores de dragones.
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,"DJGVorposten");
		}
		else
		{
			AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_03"); //No tienes 50 monedas de oro, y no voy a aguantar estupideces. Lárgate.
			AI_StopProcessInfos (self);
		};
};

func void DIA_Bullco_WASNUN_woandere_zuihnen_alleine ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_woandere_zuihnen_alleine_15_00"); //Haz lo que quieras. Seguro que los encuentro.
	AI_Output			(self ,other, "DIA_Bullco_WASNUN_woandere_zuihnen_alleine_06_01"); //Entonces no te largues.
	
	AI_StopProcessInfos (self);
};


func void DIA_Bullco_WASNUN_kopfab ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_kopfab_15_00"); //Debería arrancarte la cabeza.
	AI_Output			(self, other, "DIA_Bullco_WASNUN_kopfab_06_01"); //Cierra esa bocaza.

	Info_AddChoice	(DIA_Bullco_WASNUN, "Desenvaina el arma. Zanjaremos esto ahora mismo.", DIA_Bullco_WASNUN_kopfab_angriff );


};
func void DIA_Bullco_WASNUN_kopfab_angriff ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_kopfab_angriff_15_00"); //Desenvaina el arma. Zanjaremos esto ahora mismo.
	AI_Output			(self, other, "DIA_Bullco_WASNUN_kopfab_angriff_06_01"); //Que así sea.

	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bullco_PICKPOCKET (C_INFO)
{
	npc			= DJG_701_Bullco;
	nr			= 900;
	condition	= DIA_Bullco_PICKPOCKET_Condition;
	information	= DIA_Bullco_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Bullco_PICKPOCKET_Condition()
{
	C_Beklauen (34, 65);
};
 
FUNC VOID DIA_Bullco_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bullco_PICKPOCKET);
	Info_AddChoice		(DIA_Bullco_PICKPOCKET, DIALOG_BACK 		,DIA_Bullco_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bullco_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bullco_PICKPOCKET_DoIt);
};

func void DIA_Bullco_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bullco_PICKPOCKET);
};
	
func void DIA_Bullco_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bullco_PICKPOCKET);
};






