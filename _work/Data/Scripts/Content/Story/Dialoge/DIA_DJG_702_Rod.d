

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
INSTANCE DIA_RodDJG_EXIT   (C_INFO)
{
	npc         = DJG_702_Rod;
	nr          = 999;
	condition   = DIA_RodDJG_EXIT_Condition;
	information = DIA_RodDJG_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_RodDJG_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_RodDJG_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_RodDJG_HALLO		(C_INFO)
{
	npc		 = 	DJG_702_Rod;
	condition	 = 	DIA_RodDJG_HALLO_Condition;
	information	 = 	DIA_RodDJG_HALLO_Info;

	description	 = 	"Va tutto bene?";
};

func int DIA_RodDJG_HALLO_Condition ()
{
	if (DJG_SwampParty == FALSE)
	{
		return TRUE;
	};
};

func void DIA_RodDJG_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_RodDJG_HALLO_15_00"); //Va tutto bene?
	AI_Output			(self, other, "DIA_RodDJG_HALLO_06_01"); //Questi stivali mi fanno un male cane! La nuova armatura è davvero splendida, ma perché le cinghie di questi stivali devono essere così strette?
	AI_Output			(self, other, "DIA_RodDJG_HALLO_06_02"); //Se le allento, quasi perdo gli stivali dai piedi.

	if 	(
		((Npc_IsDead(Swampdragon)) == FALSE)
		&& (DJG_SwampParty == FALSE)
		)
			{
			Info_AddChoice	(DIA_RodDJG_HALLO, "Che cosa stai aspettando?", DIA_RodDJG_HALLO_warten );
			};
	Info_AddChoice	(DIA_RodDJG_HALLO, "Dove hai preso quegli stivali?", DIA_RodDJG_HALLO_Woher );

};
func void DIA_RodDJG_HALLO_Woher ()
{
	AI_Output			(other, self, "DIA_RodDJG_HALLO_Woher_15_00"); //Dove hai preso quegli stivali?
	AI_Output			(self, other, "DIA_RodDJG_HALLO_Woher_06_01"); //Quel vecchio guerrafondaio di Bennet li ha costruiti per noi cacciatori di draghi, e si è fatto pure pagare bene per questa robaccia.
	AI_Output			(self, other, "DIA_RodDJG_HALLO_Woher_06_02"); //Se gli metto le mani addosso, prima gli faccio mangiare questi stivali e poi lo costringo a restituirmi i soldi.

};

func void DIA_RodDJG_HALLO_warten ()
{
	AI_Output			(other, self, "DIA_RodDJG_HALLO_warten_15_00"); //Che cosa stai aspettando?
	
	Info_ClearChoices	(DIA_RodDJG_HALLO);

	if ((Npc_IsDead(DJG_Cipher))== FALSE)
		{
		AI_Output			(self, other, "DIA_RodDJG_HALLO_warten_06_01"); //Sto aspettando che Cipher muova le chiappe e si metta in cammino. È quasi ora di andare.
		AI_StopProcessInfos (self);
		}
		else
		{
		AI_Output		(self, other, "DIA_RodDJG_HALLO_warten_06_02"); //Stavo pensando a dare un'occhiata più da vicino a quell'area paludosa laggiù.
		AI_Output		(self, other, "DIA_RodDJG_HALLO_warten_06_03"); //Che ne dici di andarci insieme e vedere quello che riusciamo a trovare?

		Info_AddChoice	(DIA_RodDJG_HALLO, "Andrò da solo.", DIA_RodDJG_HALLO_warten_allein );
		Info_AddChoice	(DIA_RodDJG_HALLO, "Cosa sai della regione della palude?", DIA_RodDJG_HALLO_warten_wasweisstdu );
		Info_AddChoice	(DIA_RodDJG_HALLO, "Andiamoci insieme.", DIA_RodDJG_HALLO_warten_zusammen );
		};
};
func void DIA_RodDJG_HALLO_warten_zusammen ()
{
	AI_Output			(other, self, "DIA_RodDJG_HALLO_warten_zusammen_15_00"); //Andiamoci insieme.
	AI_Output			(self, other, "DIA_RodDJG_HALLO_warten_zusammen_06_01"); //D'accordo. Seguimi allora.

	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;

	Npc_ExchangeRoutine	(self,	"SwampWait2");
	
};

func void DIA_RodDJG_HALLO_warten_wasweisstdu ()
{
	AI_Output			(other, self, "DIA_RodDJG_HALLO_warten_wasweisstdu_15_00"); //Cosa sai della regione della palude?
	AI_Output			(self, other, "DIA_RodDJG_HALLO_warten_wasweisstdu_06_01"); //So solo che emana un fetore nauseabondo e che c'è probabilmente molto oro. Ti basta?

};

func void DIA_RodDJG_HALLO_warten_allein ()
{
	AI_Output			(other, self, "DIA_RodDJG_HALLO_warten_allein_15_00"); //Andrò da solo.
	AI_Output			(self, other, "DIA_RodDJG_HALLO_warten_allein_06_01"); //Bene, allora ti auguro buona fortuna.

	AI_StopProcessInfos (self);
};



///////////////////////////////////////////////////////////////////////
//	Info WarteMal
///////////////////////////////////////////////////////////////////////
instance DIA_RodDJG_WARTEMAL		(C_INFO)
{
	npc		 = 	DJG_702_Rod;
	condition	 = 	DIA_RodDJG_WARTEMAL_Condition;
	information	 = 	DIA_RodDJG_WARTEMAL_Info;
	permanent	 = 	TRUE;

	description	 = 	"Cosa succede?";
};

func int DIA_RodDJG_WARTEMAL_Condition ()
{
	if ((Npc_KnowsInfo(other, DIA_RodDJG_HALLO))
	|| (DJG_SwampParty == TRUE))
		{
				return TRUE;
		};
};

func void DIA_RodDJG_WARTEMAL_Info ()
{
	AI_Output			(other, self, "DIA_RodDJG_WARTEMAL_15_00"); //Qual è il problema?

	if 	(
		((DJG_SwampParty == TRUE) || (Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT2_02")<1000))
		&& (Npc_IsDead(DJG_Cipher))
		)
		{
			AI_Output			(self, other, "DIA_RodDJG_WARTEMAL_06_01"); //Ascolta, amico. Credo che questa faccenda ci stia leggermente sfuggendo di mano. Me ne andrò via in punta di piedi.
			DJG_SwampParty = FALSE;
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,	"Start");
		}
	else
		{
			AI_Output			(self, other, "DIA_RodDJG_WARTEMAL_06_02"); //(impreca) Questi stivali! Questi maledetti stivali!
		};

	if 	(Npc_IsDead(SwampDragon))
		{
			AI_Output			(other, self, "DIA_RodDJG_WARTEMAL_15_03"); //E cosa hai intenzione di fare, adesso?
			AI_Output			(self, other, "DIA_RodDJG_WARTEMAL_06_04"); //Quante domande che fai! Per prima cosa mi comprerò un paio di stivali nuovi!
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,	"Start");
		};
		AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rod_PICKPOCKET (C_INFO)
{
	npc			= DJG_702_Rod;
	nr			= 900;
	condition	= DIA_Rod_PICKPOCKET_Condition;
	information	= DIA_Rod_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Rod_PICKPOCKET_Condition()
{
	C_Beklauen (16, 320);
};
 
FUNC VOID DIA_Rod_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rod_PICKPOCKET);
	Info_AddChoice		(DIA_Rod_PICKPOCKET, DIALOG_BACK 		,DIA_Rod_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rod_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rod_PICKPOCKET_DoIt);
};

func void DIA_Rod_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rod_PICKPOCKET);
};
	
func void DIA_Rod_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rod_PICKPOCKET);
};























