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
	AI_Output			(self, other, "DIA_Rethon_HALLO_12_01"); //Przygotowuj� si� do walki, a co innego mog� robi�?
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

	description	 = 	"Z kim chcesz walczy�?";
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
	AI_Output			(other, self, "DIA_Rethon_KAMPF_15_00"); //Z kim chcesz walczy�?
	AI_Output			(self, other, "DIA_Rethon_KAMPF_12_01"); //Pomy�la�em sobie, �e odwiedz� kilku paladyn�w i skopi� im ich t�uste ty�ki.
	AI_Output			(self, other, "DIA_Rethon_KAMPF_12_02"); //Dure�. Ze smokami oczywi�cie. A ty my�la�e�, �e z kim?
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

	description	 = 	"Czy paladyn�w nie denerwuje twoja obecno��?";
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
	AI_Output			(other, self, "DIA_Rethon_PALADINE_15_00"); //Czy paladyn�w nie denerwuje twoja obecno��?
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_01"); //Niby dlaczego? Paladyni maj� wi�ksze problemy. Wi�kszo�� z nich cieszy si�, �e jeszcze �yje.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_02"); //Morale ch�opc�w szybko si� pogarsza. Nied�ugo ca�kowicie si� za�ami�.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_03"); //Popatrz tylko na te ich ostrza, z kt�rymi wybieraj� si� do bitwy.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_04"); //Ka�dy rozs�dny wojak dawno by uciek�.

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

	description	 = 	"Oddzieli�e� si� od swojej grupy?";
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
	AI_Output			(other, self, "DIA_Rethon_WOGRUPPE_15_00"); //Oddzieli�e� si� od swojej grupy?
	AI_Output			(self, other, "DIA_Rethon_WOGRUPPE_12_01"); //Mojej grupy? Nie nale�� do �adnej grupy. Kolekcjonuj� trofea.
	AI_Output			(self, other, "DIA_Rethon_WOGRUPPE_12_02"); //Je�li wr�c� do domu bez trofeum, ca�a wyprawa na nic. Jak widzisz, nie mam si� kim wyr�czy�.
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

	description	 = 	"Widzia�e� ju� jakiego� smoka?";
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
	AI_Output			(other, self, "DIA_Rethon_DRACHENGESEHEN_15_00"); //Widzia�e� ju� jakiego� smoka?
	AI_Output			(self, other, "DIA_Rethon_DRACHENGESEHEN_12_01"); //Nie, nim wyrusz� na polowanie, musz� dobrze naostrzy� bro�.
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

	description	 = 	"Nikogo si� nie boisz?";
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
	AI_Output			(other, self, "DIA_Rethon_ANGST_15_00"); //Nikogo si� nie boisz?

	AI_Output			(self, other, "DIA_Rethon_ANGST_12_01"); //Co? Kogo? Sylvia?

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Rethon_ANGST_12_02"); //Tw�j szef naprawd� my�li, �e przyjdzie tu i urz�dzi masakr�, h�?
			AI_Output			(other, self, "DIA_Rethon_ANGST_15_03"); //Nie pracuj� dla Sylvia, tylko dla siebie.
			AI_Output			(self, other, "DIA_Rethon_ANGST_12_04"); //Och. W takim razie zapomnij, �e co� m�wi�em.
		};

	AI_Output			(self, other, "DIA_Rethon_ANGST_12_05"); //Widzia�e� tych �a�osnych typk�w, kt�rzy si� za nim w��cz�?
	AI_Output			(self, other, "DIA_Rethon_ANGST_12_06"); //Sylvio powinien si� cieszy�, je�li uda mu si� uj�� st�d z �yciem.

	if (Npc_IsDead(DJG_Sylvio))
	{
	AI_Output			(other, self, "DIA_Rethon_ANGST_15_07"); //Nie uda mu si�. Nie �yje.
	AI_Output			(self, other, "DIA_Rethon_ANGST_12_08"); //Mnie to nie przeszkadza.
	}
	else
	{
	Info_AddChoice	(DIA_Rethon_ANGST, DIALOG_BACK, DIA_Rethon_ANGST_weiter );
	Info_AddChoice	(DIA_Rethon_ANGST, "Chyba go nie lubisz, co?", DIA_Rethon_ANGST_sylviomoegen );
	Info_AddChoice	(DIA_Rethon_ANGST, "Gdzie jest teraz Sylvio?", DIA_Rethon_ANGST_woSylvio );
	Info_AddChoice	(DIA_Rethon_ANGST, "Sylvio by� tutaj?", DIA_Rethon_ANGST_sylviohier );
	};
};

func void DIA_Rethon_ANGST_weiter ()
{
	Info_ClearChoices	(DIA_Rethon_ANGST);
};

func void DIA_Rethon_ANGST_sylviohier ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_sylviohier_15_00"); //Sylvio by� tutaj?
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviohier_12_01"); //W zamku? Tak, by� tutaj. Jednak tylko przez chwil�.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviohier_12_02"); //Porozmawia� z kilkoma osobami i wyruszy� dalej.

};

func void DIA_Rethon_ANGST_sylviomoegen ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_sylviomoegen_15_00"); //Chyba go nie lubisz, co?
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_01"); //Co masz na my�li, m�wi�c 'nie lubisz'? Nie jest to znajomo��, z kt�rej by�bym jako� szczeg�lnie dumny.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_02"); //Sylvio nie ma przyjaci�. Jedynie poplecznik�w pe�zn�cych za nim krok w krok.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_03"); //To nie dla mnie. Ja pracuj� sam.


};

func void DIA_Rethon_ANGST_woSylvio ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_woSylvio_15_00"); //Gdzie jest teraz Sylvio?
	AI_Output			(self, other, "DIA_Rethon_ANGST_woSylvio_12_01"); //Tutejsi paladyni wspominali co� o lodowym smoku na zachodzie. M�wi si�, �e jest najwi�kszy i najgro�niejszy z tych wszystkich bestii.
	AI_Output			(self, other, "DIA_Rethon_ANGST_woSylvio_12_02"); //Powiniene� by� widzie� b�ysk w oczach Sylvia, kiedy si� o tym dowiedzia�. Mo�na wi�c chyba odgadn��, dok�d polaz�.

	B_LogEntry (TOPIC_DRACHENJAGD,"�owca smok�w Rethon m�wi� co� o lodowym smoku."); 
	B_LogEntry (TOPIC_Dragonhunter,"Sylvio by� w zamku, a potem wyruszy� na poszukiwania lodowego smoka.");

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

	description	 = 	"Czy m�g�by� pom�c mi ulepszy� bro�?";
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
	AI_Output			(other, self, "DIA_Rethon_MEINEWAFFE_15_00"); //Czy m�g�by� mi pom�c ulepszy� bro�?
	AI_Output			(self, other, "DIA_Rethon_MEINEWAFFE_12_01"); //Ulepszy�? Lepiej kup sobie co� nowego i czym pr�dzej pozb�d� si� tego swojego rupiecia.
	AI_Output			(self, other, "DIA_Rethon_MEINEWAFFE_12_02"); //Mo�e mia�bym co� dla ciebie. Zainteresowany?
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
	
	description	 = 	"Co mo�esz mi sprzeda�?";
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
	AI_Output			(other, self, "DIA_Rethon_TRADE_15_00"); //Co mo�esz mi sprzeda�?
	B_GiveTradeInv (self);

	if (hero.guild == GIL_PAL)
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_01"); //Sp�jrz, jak nisko upad�em. Sprzedaj� bro� paladynowi.
		}
	else if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_02"); //Nie mam zbyt wielu towar�w dla maga, ale zerknij, prosz�...
		}
	else
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_03"); //Wydaje mi si�, �e mam to, czego szukasz.
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


