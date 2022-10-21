///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rethon_EXIT   (C_INFO)
{
	npc         = DJG_709_Rethon;
	nr          = 999;
	condition   = DIA_Rethon_EXIT_Condition;
	information = DIA_Rethon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Rethon_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rethon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_HALLO		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	5;
	condition	 = 	DIA_Rethon_HALLO_Condition;
	information	 = 	DIA_Rethon_HALLO_Info;

	description	 = 	"Cosa stai facendo, qui?";
};

func int DIA_Rethon_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Rethon_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_HALLO_15_00"); //Cosa stai facendo, qui?
	AI_Output			(self, other, "DIA_Rethon_HALLO_12_01"); //Mi sto preparando per combattere, che altro se no?
};


 ///////////////////////////////////////////////////////////////////////
//	Info Kampf
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_KAMPF		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	6;
	condition	 = 	DIA_Rethon_KAMPF_Condition;
	information	 = 	DIA_Rethon_KAMPF_Info;

	description	 = 	"Contro chi vuoi combattere?";
};

func int DIA_Rethon_KAMPF_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rethon_KAMPF_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_KAMPF_15_00"); //Contro chi vuoi combattere?
	AI_Output			(self, other, "DIA_Rethon_KAMPF_12_01"); //Pensavo di fare una visitina ai paladini per prenderli a calci nel sedere.
	AI_Output			(self, other, "DIA_Rethon_KAMPF_12_02"); //Idiota. Contro i draghi, ovviamente. Cosa credevi?
};

///////////////////////////////////////////////////////////////////////
//	Info paladine
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_PALADINE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	6;
	condition	 = 	DIA_Rethon_PALADINE_Condition;
	information	 = 	DIA_Rethon_PALADINE_Info;

	description	 = 	"Ai paladini non importa che tu sia qui?";
};

func int DIA_Rethon_PALADINE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rethon_PALADINE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_PALADINE_15_00"); //Ai paladini non interessa che tu sia qui?
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_01"); //Sciocchezze. Hanno ben altri problemi. La maggior parte di loro sono felici di essere ancora vivi.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_02"); //Il morale dei ragazzi non è al massimo. Questa sarà la loro rovina.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_03"); //Voglio dire, dai un'occhiata a quelle lame spuntate che stanno preparando per la battaglia.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_04"); //Qualsiasi guerriero con un po' di sale in zucca diserterebbe immediatamente.

};


///////////////////////////////////////////////////////////////////////
//	Info WoGruppe
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_WOGRUPPE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	7;
	condition	 = 	DIA_Rethon_WOGRUPPE_Condition;
	information	 = 	DIA_Rethon_WOGRUPPE_Info;

	description	 = 	"TI sei separato dal tuo gruppo?";
};

func int DIA_Rethon_WOGRUPPE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rethon_WOGRUPPE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_WOGRUPPE_15_00"); //Ti sei separato dal tuo gruppo?
	AI_Output			(self, other, "DIA_Rethon_WOGRUPPE_12_01"); //Il mio gruppo? Io non ho un gruppo. Io sono un collezionista di trofei.
	AI_Output			(self, other, "DIA_Rethon_WOGRUPPE_12_02"); //Se vado a casa senza un trofeo, allora il mio viaggio sarà stato inutile. Per questo non posso fidarmi di nessuno.
};


///////////////////////////////////////////////////////////////////////
//	Info drachengesehen
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_DRACHENGESEHEN		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	8;
	condition	 = 	DIA_Rethon_DRACHENGESEHEN_Condition;
	information	 = 	DIA_Rethon_DRACHENGESEHEN_Info;

	description	 = 	"Hai già adocchiato un drago?";
};

func int DIA_Rethon_DRACHENGESEHEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_KAMPF))
		{
				return TRUE;
		};
};

func void DIA_Rethon_DRACHENGESEHEN_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_DRACHENGESEHEN_15_00"); //Hai già adocchiato un drago?
	AI_Output			(self, other, "DIA_Rethon_DRACHENGESEHEN_12_01"); //No. Prima di partire voglio preparare al meglio le mie armi.
};

///////////////////////////////////////////////////////////////////////
//	Info Angst
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_ANGST		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	9;
	condition	 = 	DIA_Rethon_ANGST_Condition;
	information	 = 	DIA_Rethon_ANGST_Info;

	description	 = 	"Non hai paura che qualcuno possa arrivare prima di te?";
};

func int DIA_Rethon_ANGST_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_WOGRUPPE))
		{
				return TRUE;
		};
};

func void DIA_Rethon_ANGST_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_15_00"); //Non hai paura che qualcuno possa arrivare prima di te?

	AI_Output			(self, other, "DIA_Rethon_ANGST_12_01"); //Cosa? Chi? Silvio?

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Rethon_ANGST_12_02"); //Il tuo capo crede davvero di poter uccidere qualcosa qui, eh?
			AI_Output			(other, self, "DIA_Rethon_ANGST_15_03"); //Non sono uno degli uomini di Silvio. Lavoro da solo.
			AI_Output			(self, other, "DIA_Rethon_ANGST_12_04"); //Oh, d'accordo allora. Dimentica quanto ti ho detto.
		};

	AI_Output			(self, other, "DIA_Rethon_ANGST_12_05"); //Hai visto quegli individui patetici che si porta dietro?
	AI_Output			(self, other, "DIA_Rethon_ANGST_12_06"); //Silvio potrà essere soddisfatto se ne uscirà vivo.

	if (Npc_IsDead(DJG_Sylvio))
	{
	AI_Output			(other, self, "DIA_Rethon_ANGST_15_07"); //Non potrà esserlo. È morto.
	AI_Output			(self, other, "DIA_Rethon_ANGST_12_08"); //Buon per me.
	}
	else
	{
	Info_AddChoice	(DIA_Rethon_ANGST, DIALOG_BACK, DIA_Rethon_ANGST_weiter );
	Info_AddChoice	(DIA_Rethon_ANGST, "Sembra che non ti piaccia.", DIA_Rethon_ANGST_sylviomoegen );
	Info_AddChoice	(DIA_Rethon_ANGST, "Dov’è Silvio, adesso?", DIA_Rethon_ANGST_woSylvio );
	Info_AddChoice	(DIA_Rethon_ANGST, "Silvio è stato qui?", DIA_Rethon_ANGST_sylviohier );
	};
};

func void DIA_Rethon_ANGST_weiter ()
{
	Info_ClearChoices	(DIA_Rethon_ANGST);
};

func void DIA_Rethon_ANGST_sylviohier ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_sylviohier_15_00"); //Sylvio è stato qui?
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviohier_12_01"); //Qui al castello, vuoi dire? Sì, è stato qui, ma c'è rimasto solo per un breve periodo.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviohier_12_02"); //Ha parlato con alcune persone, dopodiché se n'è andato di nuovo.

};

func void DIA_Rethon_ANGST_sylviomoegen ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_sylviomoegen_15_00"); //Sembra che non ti piaccia.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_01"); //Non sono particolarmente felice di conoscerlo, tutto qui.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_02"); //Silvio non ha amici. Egli ha bisogno di persone che lo seguano ovunque e comunque.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_03"); //Non fa per me. Io lavoro da solo.


};

func void DIA_Rethon_ANGST_woSylvio ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_woSylvio_15_00"); //Dov’è Sylvio, adesso?
	AI_Output			(self, other, "DIA_Rethon_ANGST_woSylvio_12_01"); //I paladini hanno parlato di un drago del ghiaccio a ovest. Dovrebbe trattarsi del più potente e pericoloso di tutti.
	AI_Output			(self, other, "DIA_Rethon_ANGST_woSylvio_12_02"); //Avresti dovuto vedere il bagliore negli occhi di Silvio quando l'ha saputo. Vai a sapere dove si è cacciato.

	B_LogEntry (TOPIC_DRACHENJAGD,"Rethon il cacciatore di draghi ha mormorato qualcosa riguardo un drago del ghiaccio."); 
	B_LogEntry (TOPIC_Dragonhunter,"Sylvio era nel castello, ma poi è partito per cercare un drago del ghiaccio.");

};



///////////////////////////////////////////////////////////////////////
//	Info meineWaffe
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_MEINEWAFFE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	10;
	condition	 = 	DIA_Rethon_MEINEWAFFE_Condition;
	information	 = 	DIA_Rethon_MEINEWAFFE_Info;

	description	 = 	"Puoi aiutarmi a migliorare le mie armi?";
};

func int DIA_Rethon_MEINEWAFFE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_PALADINE))
		{
				return TRUE;
		};
};

func void DIA_Rethon_MEINEWAFFE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_MEINEWAFFE_15_00"); //Puoi aiutarmi a migliorare le mie armi?
	AI_Output			(self, other, "DIA_Rethon_MEINEWAFFE_12_01"); //Migliorare? È meglio acquistare qualcosa di nuovo e sbarazzarti della ferraglia che ti porti dietro.
	AI_Output			(self, other, "DIA_Rethon_MEINEWAFFE_12_02"); //Forse ho qualcosa per te. Ti interessa?
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_TRADE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	11;
	condition	 = 	DIA_Rethon_TRADE_Condition;
	information	 = 	DIA_Rethon_TRADE_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	
	description	 = 	"Cosa puoi vendermi?";
};

func int DIA_Rethon_TRADE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_MEINEWAFFE))
		{
				return TRUE;
		};
};

func void DIA_Rethon_TRADE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_TRADE_15_00"); //Cosa puoi vendermi?
	B_GiveTradeInv (self);

	if (hero.guild == GIL_PAL)
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_01"); //Cielo, guarda come sono caduto in basso. Ridotto a vendere le mie armi a un paladino.
		}
	else if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_02"); //Non ho molto da offrire a un mago, ma puoi dare comunque un'occhiata.
		}
	else
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_03"); //Credo di avere ciò che ti serve, amico.
		};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rethon_PICKPOCKET (C_INFO)
{
	npc			= DJG_709_Rethon;
	nr			= 900;
	condition	= DIA_Rethon_PICKPOCKET_Condition;
	information	= DIA_Rethon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Rethon_PICKPOCKET_Condition()
{
	C_Beklauen (78, 230);
};
 
FUNC VOID DIA_Rethon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rethon_PICKPOCKET);
	Info_AddChoice		(DIA_Rethon_PICKPOCKET, DIALOG_BACK 		,DIA_Rethon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rethon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rethon_PICKPOCKET_DoIt);
};

func void DIA_Rethon_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rethon_PICKPOCKET);
};
	
func void DIA_Rethon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rethon_PICKPOCKET);
};


