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
	AI_Output			(self, other, "DIA_Rethon_HALLO_12_01"); //Przygotowuję się do walki, a co innego mogę robić?
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

	description	 = 	"Z kim chcesz walczyć?";
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
	AI_Output			(other, self, "DIA_Rethon_KAMPF_15_00"); //Z kim chcesz walczyć?
	AI_Output			(self, other, "DIA_Rethon_KAMPF_12_01"); //Pomyślałem sobie, że odwiedzę kilku paladynów i skopię im ich tłuste tyłki.
	AI_Output			(self, other, "DIA_Rethon_KAMPF_12_02"); //Dureń. Ze smokami oczywiście. A ty myślałeś, że z kim?
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

	description	 = 	"Czy paladynów nie denerwuje twoja obecność?";
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
	AI_Output			(other, self, "DIA_Rethon_PALADINE_15_00"); //Czy paladynów nie denerwuje twoja obecność?
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_01"); //Niby dlaczego? Paladyni mają większe problemy. Większość z nich cieszy się, że jeszcze żyje.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_02"); //Morale chłopców szybko się pogarsza. Niedługo całkowicie się załamią.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_03"); //Popatrz tylko na te ich ostrza, z którymi wybierają się do bitwy.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_04"); //Każdy rozsądny wojak dawno by uciekł.

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

	description	 = 	"Oddzieliłeś się od swojej grupy?";
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
	AI_Output			(other, self, "DIA_Rethon_WOGRUPPE_15_00"); //Oddzieliłeś się od swojej grupy?
	AI_Output			(self, other, "DIA_Rethon_WOGRUPPE_12_01"); //Mojej grupy? Nie należę do żadnej grupy. Kolekcjonuję trofea.
	AI_Output			(self, other, "DIA_Rethon_WOGRUPPE_12_02"); //Jeśli wrócę do domu bez trofeum, cała wyprawa na nic. Jak widzisz, nie mam się kim wyręczyć.
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

	description	 = 	"Widziałeś już jakiegoś smoka?";
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
	AI_Output			(other, self, "DIA_Rethon_DRACHENGESEHEN_15_00"); //Widziałeś już jakiegoś smoka?
	AI_Output			(self, other, "DIA_Rethon_DRACHENGESEHEN_12_01"); //Nie, nim wyruszę na polowanie, muszę dobrze naostrzyć broń.
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

	description	 = 	"Nikogo się nie boisz?";
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
	AI_Output			(other, self, "DIA_Rethon_ANGST_15_00"); //Nikogo się nie boisz?

	AI_Output			(self, other, "DIA_Rethon_ANGST_12_01"); //Co? Kogo? Sylvia?

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Rethon_ANGST_12_02"); //Twój szef naprawdę myśli, że przyjdzie tu i urządzi masakrę, hę?
			AI_Output			(other, self, "DIA_Rethon_ANGST_15_03"); //Nie pracuję dla Sylvia, tylko dla siebie.
			AI_Output			(self, other, "DIA_Rethon_ANGST_12_04"); //Och. W takim razie zapomnij, że coś mówiłem.
		};

	AI_Output			(self, other, "DIA_Rethon_ANGST_12_05"); //Widziałeś tych żałosnych typków, którzy się za nim włóczą?
	AI_Output			(self, other, "DIA_Rethon_ANGST_12_06"); //Sylvio powinien się cieszyć, jeśli uda mu się ujść stąd z życiem.

	if (Npc_IsDead(DJG_Sylvio))
	{
	AI_Output			(other, self, "DIA_Rethon_ANGST_15_07"); //Nie uda mu się. Nie żyje.
	AI_Output			(self, other, "DIA_Rethon_ANGST_12_08"); //Mnie to nie przeszkadza.
	}
	else
	{
	Info_AddChoice	(DIA_Rethon_ANGST, DIALOG_BACK, DIA_Rethon_ANGST_weiter );
	Info_AddChoice	(DIA_Rethon_ANGST, "Chyba go nie lubisz, co?", DIA_Rethon_ANGST_sylviomoegen );
	Info_AddChoice	(DIA_Rethon_ANGST, "Gdzie jest teraz Sylvio?", DIA_Rethon_ANGST_woSylvio );
	Info_AddChoice	(DIA_Rethon_ANGST, "Sylvio był tutaj?", DIA_Rethon_ANGST_sylviohier );
	};
};

func void DIA_Rethon_ANGST_weiter ()
{
	Info_ClearChoices	(DIA_Rethon_ANGST);
};

func void DIA_Rethon_ANGST_sylviohier ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_sylviohier_15_00"); //Sylvio był tutaj?
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviohier_12_01"); //W zamku? Tak, był tutaj. Jednak tylko przez chwilę.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviohier_12_02"); //Porozmawiał z kilkoma osobami i wyruszył dalej.

};

func void DIA_Rethon_ANGST_sylviomoegen ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_sylviomoegen_15_00"); //Chyba go nie lubisz, co?
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_01"); //Co masz na myśli, mówiąc 'nie lubisz'? Nie jest to znajomość, z której byłbym jakoś szczególnie dumny.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_02"); //Sylvio nie ma przyjaciół. Jedynie popleczników pełznących za nim krok w krok.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_03"); //To nie dla mnie. Ja pracuję sam.


};

func void DIA_Rethon_ANGST_woSylvio ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_woSylvio_15_00"); //Gdzie jest teraz Sylvio?
	AI_Output			(self, other, "DIA_Rethon_ANGST_woSylvio_12_01"); //Tutejsi paladyni wspominali coś o lodowym smoku na zachodzie. Mówi się, że jest największy i najgroźniejszy z tych wszystkich bestii.
	AI_Output			(self, other, "DIA_Rethon_ANGST_woSylvio_12_02"); //Powinieneś był widzieć błysk w oczach Sylvia, kiedy się o tym dowiedział. Można więc chyba odgadnąć, dokąd polazł.

	B_LogEntry (TOPIC_DRACHENJAGD,"Łowca smoków Rethon mówił coś o lodowym smoku."); 
	B_LogEntry (TOPIC_Dragonhunter,"Sylvio był w zamku, a potem wyruszył na poszukiwania lodowego smoka.");

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

	description	 = 	"Czy mógłbyś pomóc mi ulepszyć broń?";
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
	AI_Output			(other, self, "DIA_Rethon_MEINEWAFFE_15_00"); //Czy mógłbyś mi pomóc ulepszyć broń?
	AI_Output			(self, other, "DIA_Rethon_MEINEWAFFE_12_01"); //Ulepszyć? Lepiej kup sobie coś nowego i czym prędzej pozbądź się tego swojego rupiecia.
	AI_Output			(self, other, "DIA_Rethon_MEINEWAFFE_12_02"); //Może miałbym coś dla ciebie. Zainteresowany?
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
	
	description	 = 	"Co możesz mi sprzedać?";
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
	AI_Output			(other, self, "DIA_Rethon_TRADE_15_00"); //Co możesz mi sprzedać?
	B_GiveTradeInv (self);

	if (hero.guild == GIL_PAL)
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_01"); //Spójrz, jak nisko upadłem. Sprzedaję broń paladynowi.
		}
	else if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_02"); //Nie mam zbyt wielu towarów dla maga, ale zerknij, proszę...
		}
	else
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_03"); //Wydaje mi się, że mam to, czego szukasz.
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


