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

	description	 = 	"Co tu porabiasz?";
};

func int DIA_Rethon_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Rethon_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_HALLO_15_00"); //Co tutaj robisz?
	AI_Output			(self, other, "DIA_Rethon_HALLO_12_01"); //Przygotowujê siê do walki, a co innego mogê robiæ?
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

	description	 = 	"Z kim chcesz walczyæ?";
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
	AI_Output			(other, self, "DIA_Rethon_KAMPF_15_00"); //Z kim chcesz walczyæ?
	AI_Output			(self, other, "DIA_Rethon_KAMPF_12_01"); //Pomyœla³em sobie, ¿e odwiedzê kilku paladynów i skopiê im ich t³uste ty³ki.
	AI_Output			(self, other, "DIA_Rethon_KAMPF_12_02"); //Dureñ. Ze smokami oczywiœcie. A ty myœla³eœ, ¿e z kim?
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

	description	 = 	"Czy paladynów nie denerwuje twoja obecnoœæ?";
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
	AI_Output			(other, self, "DIA_Rethon_PALADINE_15_00"); //Czy paladynów nie denerwuje twoja obecnoœæ?
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_01"); //Niby dlaczego? Paladyni maj¹ wiêksze problemy. Wiêkszoœæ z nich cieszy siê, ¿e jeszcze ¿yje.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_02"); //Morale ch³opców szybko siê pogarsza. Nied³ugo ca³kowicie siê za³ami¹.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_03"); //Popatrz tylko na te ich ostrza, z którymi wybieraj¹ siê do bitwy.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_04"); //Ka¿dy rozs¹dny wojak dawno by uciek³.

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

	description	 = 	"Oddzieli³eœ siê od swojej grupy?";
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
	AI_Output			(other, self, "DIA_Rethon_WOGRUPPE_15_00"); //Oddzieli³eœ siê od swojej grupy?
	AI_Output			(self, other, "DIA_Rethon_WOGRUPPE_12_01"); //Mojej grupy? Nie nale¿ê do ¿adnej grupy. Kolekcjonujê trofea.
	AI_Output			(self, other, "DIA_Rethon_WOGRUPPE_12_02"); //Jeœli wrócê do domu bez trofeum, ca³a wyprawa na nic. Jak widzisz, nie mam siê kim wyrêczyæ.
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

	description	 = 	"Widzia³eœ ju¿ jakiegoœ smoka?";
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
	AI_Output			(other, self, "DIA_Rethon_DRACHENGESEHEN_15_00"); //Widzia³eœ ju¿ jakiegoœ smoka?
	AI_Output			(self, other, "DIA_Rethon_DRACHENGESEHEN_12_01"); //Nie, nim wyruszê na polowanie, muszê dobrze naostrzyæ broñ.
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

	description	 = 	"Nikogo siê nie boisz?";
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
	AI_Output			(other, self, "DIA_Rethon_ANGST_15_00"); //Nikogo siê nie boisz?

	AI_Output			(self, other, "DIA_Rethon_ANGST_12_01"); //Co? Kogo? Sylvia?

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Rethon_ANGST_12_02"); //Twój szef naprawdê myœli, ¿e przyjdzie tu i urz¹dzi masakrê, hê?
			AI_Output			(other, self, "DIA_Rethon_ANGST_15_03"); //Nie pracujê dla Sylvia, tylko dla siebie.
			AI_Output			(self, other, "DIA_Rethon_ANGST_12_04"); //Och. W takim razie zapomnij, ¿e coœ mówi³em.
		};

	AI_Output			(self, other, "DIA_Rethon_ANGST_12_05"); //Widzia³eœ tych ¿a³osnych typków, którzy siê za nim w³ócz¹?
	AI_Output			(self, other, "DIA_Rethon_ANGST_12_06"); //Sylvio powinien siê cieszyæ, jeœli uda mu siê ujœæ st¹d z ¿yciem.

	if (Npc_IsDead(DJG_Sylvio))
	{
	AI_Output			(other, self, "DIA_Rethon_ANGST_15_07"); //Nie uda mu siê. Nie ¿yje.
	AI_Output			(self, other, "DIA_Rethon_ANGST_12_08"); //Mnie to nie przeszkadza.
	}
	else
	{
	Info_AddChoice	(DIA_Rethon_ANGST, DIALOG_BACK, DIA_Rethon_ANGST_weiter );
	Info_AddChoice	(DIA_Rethon_ANGST, "Chyba go nie lubisz, co?", DIA_Rethon_ANGST_sylviomoegen );
	Info_AddChoice	(DIA_Rethon_ANGST, "Gdzie jest teraz Sylvio?", DIA_Rethon_ANGST_woSylvio );
	Info_AddChoice	(DIA_Rethon_ANGST, "Sylvio by³ tutaj?", DIA_Rethon_ANGST_sylviohier );
	};
};

func void DIA_Rethon_ANGST_weiter ()
{
	Info_ClearChoices	(DIA_Rethon_ANGST);
};

func void DIA_Rethon_ANGST_sylviohier ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_sylviohier_15_00"); //Sylvio by³ tutaj?
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviohier_12_01"); //W zamku? Tak, by³ tutaj. Jednak tylko przez chwilê.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviohier_12_02"); //Porozmawia³ z kilkoma osobami i wyruszy³ dalej.

};

func void DIA_Rethon_ANGST_sylviomoegen ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_sylviomoegen_15_00"); //Chyba go nie lubisz, co?
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_01"); //Co masz na myœli, mówi¹c 'nie lubisz'? Nie jest to znajomoœæ, z której by³bym jakoœ szczególnie dumny.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_02"); //Sylvio nie ma przyjació³. Jedynie popleczników pe³zn¹cych za nim krok w krok.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_03"); //To nie dla mnie. Ja pracujê sam.


};

func void DIA_Rethon_ANGST_woSylvio ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_woSylvio_15_00"); //Gdzie jest teraz Sylvio?
	AI_Output			(self, other, "DIA_Rethon_ANGST_woSylvio_12_01"); //Tutejsi paladyni wspominali coœ o lodowym smoku na zachodzie. Mówi siê, ¿e jest najwiêkszy i najgroŸniejszy z tych wszystkich bestii.
	AI_Output			(self, other, "DIA_Rethon_ANGST_woSylvio_12_02"); //Powinieneœ by³ widzieæ b³ysk w oczach Sylvia, kiedy siê o tym dowiedzia³. Mo¿na wiêc chyba odgadn¹æ, dok¹d polaz³.

	B_LogEntry (TOPIC_DRACHENJAGD,"£owca smoków Rethon mówi³ coœ o lodowym smoku."); 
	B_LogEntry (TOPIC_Dragonhunter,"Sylvio by³ w zamku, a potem wyruszy³ na poszukiwania lodowego smoka.");

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

	description	 = 	"Czy móg³byœ pomóc mi ulepszyæ broñ?";
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
	AI_Output			(other, self, "DIA_Rethon_MEINEWAFFE_15_00"); //Czy móg³byœ mi pomóc ulepszyæ broñ?
	AI_Output			(self, other, "DIA_Rethon_MEINEWAFFE_12_01"); //Ulepszyæ? Lepiej kup sobie coœ nowego i czym prêdzej pozb¹dŸ siê tego swojego rupiecia.
	AI_Output			(self, other, "DIA_Rethon_MEINEWAFFE_12_02"); //Mo¿e mia³bym coœ dla ciebie. Zainteresowany?
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
	
	description	 = 	"Co mo¿esz mi sprzedaæ?";
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
	AI_Output			(other, self, "DIA_Rethon_TRADE_15_00"); //Co mo¿esz mi sprzedaæ?
	B_GiveTradeInv (self);

	if (hero.guild == GIL_PAL)
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_01"); //Spójrz, jak nisko upad³em. Sprzedajê broñ paladynowi.
		}
	else if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_02"); //Nie mam zbyt wielu towarów dla maga, ale zerknij, proszê...
		}
	else
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_03"); //Wydaje mi siê, ¿e mam to, czego szukasz.
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


