// ************************************************************
// 							EXIT
// ************************************************************
INSTANCE DIA_Wasili_EXIT   (C_INFO)
{
	npc         = BAU_907_Wasili;
	nr          = 999;
	condition   = DIA_Wasili_EXIT_Condition;
	information = DIA_Wasili_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Wasili_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Wasili_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 							Hallo
// ************************************************************
instance DIA_Wasili_HALLO (C_INFO)
{
	npc		 	= BAU_907_Wasili;
	nr          = 1;
	condition	= DIA_Wasili_HALLO_Condition;
	information	= DIA_Wasili_HALLO_Info;
	permanent 	= FALSE;
	important	= TRUE;
};

func int DIA_Wasili_HALLO_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};	
};

func void DIA_Wasili_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Wasili_HALLO_01_00"); //Como se te ocurra tocar algo, te vas a llevar un par de capones, ¿te enteras?
};


// ************************************************************
// 								Job
// ************************************************************
instance DIA_Wasili_Job (C_INFO)
{
	npc		 	= BAU_907_Wasili;
	nr          = 1;
	condition	= DIA_Wasili_Job_Condition;
	information	= DIA_Wasili_Job_Info;
	permanent 	= FALSE;
	description	= "¿A qué te dedicas?";
};

func int DIA_Wasili_Job_Condition ()
{
	return TRUE;
};

func void DIA_Wasili_Job_Info ()
{
	AI_Output (other, self, "DIA_Wasili_Job_15_00"); //¿A qué te dedicas?
	AI_Output (self, other, "DIA_Wasili_Job_01_01"); //Onar quiere que me pase todo el día vigilando sus cosas.
	AI_Output (self, other, "DIA_Wasili_Job_01_02"); //Le preocupa que desaparezca algo. En su lugar, yo también estaría preocupado.
	AI_Output (self, other, "DIA_Wasili_Job_01_03"); //La mayoría de los mercenarios que ha contratado son antiguos presos de la colonia penal.
	AI_Output (self, other, "DIA_Wasili_Job_01_04"); //Si no les vigila nadie, se llevan todo lo que no está clavado.
};


// ************************************************************
// 								Sammler
// ************************************************************
instance DIA_Wasili_Sammler	(C_INFO)
{
	npc			= BAU_907_Wasili;
	nr		 	= 4;
	condition	= DIA_Wasili_Sammler_Condition;
	information	= DIA_Wasili_Sammler_Info;
	permanent 	= FALSE;
	description	= "Aquí hay un montón de trastos.";
};

func int DIA_Wasili_Sammler_Condition ()
{
	return TRUE;
};

func void DIA_Wasili_Sammler_Info ()
{
	AI_Output (other, self, "DIA_Wasili_Sammler_15_00"); //Aquí hay un montón de trastos.
	AI_Output (self, other, "DIA_Wasili_Sammler_01_01"); //Sí, y la mayoría son muy valiosos. Onar colecciona objetos de valor.
	AI_Output (self, other, "DIA_Wasili_Sammler_01_02"); //Alguien sencillo como yo no se puede permitir estos lujos. Yo me dedico a otras cosas.
	AI_Output (other, self, "DIA_Wasili_Sammler_15_03"); //¿Y qué es?
	AI_Output (self, other, "DIA_Wasili_Sammler_01_04"); //Colecciono monedas antiguas.
	
	MIS_Wasili_BringOldCoin = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info FirstOldCoin
///////////////////////////////////////////////////////////////////////
instance DIA_Wasili_FirstOldCoin		(C_INFO)
{
	npc		 = 	BAU_907_Wasili;
	nr		 = 	5;
	condition	 = 	DIA_Wasili_FirstOldCoin_Condition;
	information	 = 	DIA_Wasili_FirstOldCoin_Info;
	permanent	 = 	TRUE;

	description	 = 	"Yo tengo una moneda antigua.";
};

var int Wasili_BringOldCoin_NoMore;
func int DIA_Wasili_FirstOldCoin_Condition ()
{
	if (MIS_Wasili_BringOldCoin == LOG_RUNNING)
	&& (WasilisOldCoinOffer == 0)
	&& (Npc_HasItems (other,ItMi_OldCoin) >= 1)
	&& (Wasili_BringOldCoin_NoMore == FALSE)
		{
				return TRUE;
		};
};
var int WasilisOldCoinOffer;
var int FirstOldCoin_angebotenXP_OneTime;
var int DIA_Wasili_FirstOldCoin_mehr_OneTime;
func void DIA_Wasili_FirstOldCoin_Info ()
{
	AI_Output			(other, self, "DIA_Wasili_FirstOldCoin_15_00"); //Yo tengo una moneda antigua.
	if (FirstOldCoin_angebotenXP_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_01_01"); //Um. Enséñamela.
	};

	B_GiveInvItems (other, self, ItMi_OldCoin,1);

	if (FirstOldCoin_angebotenXP_OneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_01_02"); //Oh, sí. No sacarás mucho en el mercado libre.
	};

	if (DIA_Wasili_FirstOldCoin_mehr_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_01_03"); //Te doy una moneda de oro por ella. Prácticamente equivale a lo que valía en tiempos.
	}
	else
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_01_04"); //Ya sabes lo máximo que voy a pagar, perro. Una moneda de oro y nada más.
	};
	
	Info_ClearChoices	(DIA_Wasili_FirstOldCoin);
	Info_AddChoice	(DIA_Wasili_FirstOldCoin, "No, creo que voy a quedármela.", DIA_Wasili_FirstOldCoin_nein );
	Info_AddChoice	(DIA_Wasili_FirstOldCoin, "No es suficiente. ¿Y 2?", DIA_Wasili_FirstOldCoin_mehr );
	Info_AddChoice	(DIA_Wasili_FirstOldCoin, "Trato hecho.", DIA_Wasili_FirstOldCoin_ok );

	IF (FirstOldCoin_angebotenXP_OneTime == FALSE)
	{
	B_GivePlayerXP (XP_BringOldCoin);
	FirstOldCoin_angebotenXP_OneTime = TRUE;
	};
};
func void DIA_Wasili_FirstOldCoin_ok ()
{
	AI_Output			(other, self, "DIA_Wasili_FirstOldCoin_ok_15_00"); //Trato hecho.
	AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_ok_01_01"); //Bien.

	if (WasilisOldCoinOffer == 2)
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_ok_01_02"); //Ten 2 monedas de oro.
	}
	else
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_ok_01_03"); //Si tienes más, ya sabes dónde estoy.
		WasilisOldCoinOffer = 1;	
	};

	CreateInvItems (self, ItMi_Gold, WasilisOldCoinOffer);									
	B_GiveInvItems (self, other, ItMi_Gold,	WasilisOldCoinOffer);

	Info_ClearChoices	(DIA_Wasili_FirstOldCoin);
};

func void DIA_Wasili_FirstOldCoin_mehr ()
{
	AI_Output			(other, self, "DIA_Wasili_FirstOldCoin_mehr_15_00"); //No es suficiente. ¿Y 2?

	if (DIA_Wasili_FirstOldCoin_mehr_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_mehr_01_01"); //¡Ni hablar! ¡No estoy chiflado! Lárgate.
		DIA_Wasili_FirstOldCoin_mehr_OneTime = TRUE;
		B_GiveInvItems (self, other, ItMi_OldCoin,1);
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_mehr_01_02"); //Arrh. Maldita sea... Vale. 2 monedas de oro por cada moneda antigua que me traigas. Es mi última oferta.
		WasilisOldCoinOffer =	2;
		Info_AddChoice	(DIA_Wasili_FirstOldCoin, "En ese caso, 3 no suena mal.", DIA_Wasili_FirstOldCoin_ZumTeufel );
	};
};

func void DIA_Wasili_FirstOldCoin_nein ()
{
	AI_Output			(other, self, "DIA_Wasili_FirstOldCoin_nein_15_00"); //No, creo que voy a quedármela.
	AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_nein_01_01"); //No tiene ningún valor para ti. Ya volverás.
	B_GiveInvItems (self, other, ItMi_OldCoin,1);
	WasilisOldCoinOffer = 0;
	Info_ClearChoices	(DIA_Wasili_FirstOldCoin);
};

func void DIA_Wasili_FirstOldCoin_ZumTeufel ()
{
	AI_Output			(other, self, "DIA_Wasili_FirstOldCoin_ZumTeufel_15_00"); //En ese caso, 3 no suena mal.
	AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_ZumTeufel_01_01"); //Vete a la mierda, cerdo.
	AI_StopProcessInfos (self);
	Wasili_BringOldCoin_NoMore = TRUE;
	WasilisOldCoinOffer = 0;
};

///////////////////////////////////////////////////////////////////////
//	Info BringOldCoin
///////////////////////////////////////////////////////////////////////

instance DIA_Wasili_BringOldCoin		(C_INFO)
{
	npc		 = 	BAU_907_Wasili;
	nr		 = 	5;
	condition	 = 	DIA_Wasili_BringOldCoin_Condition;
	information	 = 	DIA_Wasili_BringOldCoin_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Te interesan más monedas antiguas?";
};

func int DIA_Wasili_BringOldCoin_Condition ()
{
	if (WasilisOldCoinOffer > 0)
	&& (Npc_HasItems (other,ItMi_OldCoin) >= 1)
	&& (Wasili_BringOldCoin_NoMore == FALSE)
		{
				return TRUE;
		};
};

var int OldCoinCounter;

func void DIA_Wasili_BringOldCoin_Info ()
{
	AI_Output			(other, self, "DIA_Wasili_BringOldCoin_15_00"); //¿Te interesan más monedas antiguas?
	AI_Output			(self, other, "DIA_Wasili_BringOldCoin_01_01"); //Claro. ¿Aún te quedan?

	var int OldCoinCount;
	var int XP_BringOldCoins;
	var int OldCoinGeld;

	OldCoinCount = Npc_HasItems(other, ItMi_OldCoin);


		if (OldCoinCount == 1)
			{
				AI_Output		(other, self, "DIA_Wasili_BringOldCoin_15_02"); //Una.
				B_GivePlayerXP (XP_BringOldCoin);
				B_GiveInvItems (other, self, ItMi_OldCoin,1);
				OldCoinCounter = OldCoinCounter + 1;
			}
		else
			{
				AI_Output		(other, self, "DIA_Wasili_BringOldCoin_15_03"); //Unas cuantas.
	
				B_GiveInvItems (other, self, ItMi_OldCoin,  OldCoinCount);
	
				XP_BringOldCoins = (OldCoinCount * XP_BringOldCoin);
				OldCoinCounter = (OldCoinCounter + OldCoinCount); 
	
				B_GivePlayerXP (XP_BringOldCoins);
			};

	AI_Output			(self, other, "DIA_Wasili_BringOldCoin_01_04"); //Gracias. Aquí tienes tu dinero. Tráeme todas las que encuentres.

	OldCoinGeld	= (OldCoinCount * WasilisOldCoinOffer);

	CreateInvItems (self, ItMi_Gold, OldCoinGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, OldCoinGeld);
};


// ************************************************************
// 								PERM
// ************************************************************
instance DIA_Wasili_PERM	(C_INFO)
{
	npc		 	= BAU_907_Wasili;
	nr		 	= 900;
	condition	= DIA_Wasili_PERM_Condition;
	information	= DIA_Wasili_PERM_Info;
	permanent	= TRUE;
	description	= "¿Ha intentado alguien robar algo?";
};

func int DIA_Wasili_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Wasili_Job))
		{
				return TRUE;
		};
};

func void DIA_Wasili_perm_Info ()
{
	AI_Output (other, self, "DIA_Wasili_PERM_15_00"); //¿Ha intentado alguien robar algo?

	if (Kapitel <= 2)
	{
		if (PETZCOUNTER_Farm_Theft > 0)
		{
			AI_Output (self, other, "DIA_Wasili_PERM_01_01"); //¿Además de ti?
		};
		AI_Output (self, other, "DIA_Wasili_PERM_01_02"); //¡Unos cuantos! ¡Y los pillé a todos!
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Wasili_PERM_01_03"); //Hace unas cuantas noches, uno de los mercenarios rondaba la casa.
		AI_Output (self, other, "DIA_Wasili_PERM_01_04"); //Llevaba puesta una túnica negra y no pude verlo.
		AI_Output (self, other, "DIA_Wasili_PERM_01_05"); //Pero hice que huyera.
	};
	
	if (kapitel == 4)
	{
		AI_Output (self, other, "DIA_Wasili_perm_01_06"); //No. Últimamente no.
	};
	
	if (kapitel >= 5)
	{
		AI_Output (self, other, "DIA_Wasili_perm_01_07"); //Los mercenarios parecen prepararse para levantar el campamento.
		AI_Output (self, other, "DIA_Wasili_perm_01_08"); //No me sorprendería que Lee y sus muchachos se fueran de la isla de la noche a la mañana.
	};
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Wasili_PICKPOCKET (C_INFO)
{
	npc			= BAU_907_Wasili;
	nr			= 900;
	condition	= DIA_Wasili_PICKPOCKET_Condition;
	information	= DIA_Wasili_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Wasili_PICKPOCKET_Condition()
{
	C_Beklauen (55, 90);
};
 
FUNC VOID DIA_Wasili_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Wasili_PICKPOCKET);
	Info_AddChoice		(DIA_Wasili_PICKPOCKET, DIALOG_BACK 		,DIA_Wasili_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Wasili_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Wasili_PICKPOCKET_DoIt);
};

func void DIA_Wasili_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Wasili_PICKPOCKET);
};
	
func void DIA_Wasili_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Wasili_PICKPOCKET);
};


