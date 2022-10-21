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

	description	 = 	"Co tady dìláš?";
};

func int DIA_Rethon_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Rethon_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_HALLO_15_00"); //Co tady dìláš?
	AI_Output			(self, other, "DIA_Rethon_HALLO_12_01"); //Pøipravuju se na boj. Ještì nìco?
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

	description	 = 	"Proti komu se chystáš bojovat?";
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
	AI_Output			(other, self, "DIA_Rethon_KAMPF_15_00"); //Proti komu se chystáš bojovat?
	AI_Output			(self, other, "DIA_Rethon_KAMPF_12_01"); //Øíkal jsem si, že vlítnu na paladiny a nakopu jim ty jejich tlustý zadky.
	AI_Output			(self, other, "DIA_Rethon_KAMPF_12_02"); //Idiote. Proti drakùm, samozøejmì. Cos myslel?
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

	description	 = 	"Nevadí paladinùm, že jsi tady?";
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
	AI_Output			(other, self, "DIA_Rethon_PALADINE_15_00"); //Copak o tobì paladinové nevìdí?
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_01"); //Nesmysl. Ty mají úplnì jiný problémy. Vìtšina z nich je ráda, že žije.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_02"); //Morálka tìch chlapù není nic moc. To bude jejich konec.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_03"); //Jen se podívej, jak si snaží dát dohromady ty nalámaný meèe, se kterýma se chtìjí vydat do boje.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_04"); //Každej rozumnej váleèník by okamžitì dezertoval.

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

	description	 = 	"Opustil jsi svou jednotku?";
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
	AI_Output			(other, self, "DIA_Rethon_WOGRUPPE_15_00"); //Opustil jsi svou jednotku?
	AI_Output			(self, other, "DIA_Rethon_WOGRUPPE_12_01"); //Svojí jednotku? Nemìl jsem žádnou jednotku. Jsem sbìratel trofejí.
	AI_Output			(self, other, "DIA_Rethon_WOGRUPPE_12_02"); //Na rozdíl od ostatních si nemùžu dovolit pøijít domu s prázdnejma rukama. Takže nemùžu potøebovat nikoho dalšího.
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

	description	 = 	"Už jsi vidìl nìjakého draka?";
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
	AI_Output			(other, self, "DIA_Rethon_DRACHENGESEHEN_15_00"); //Už jsi vidìl nìjakého draka?
	AI_Output			(self, other, "DIA_Rethon_DRACHENGESEHEN_12_01"); //Ne. Chci si nejdøív naostøit zbraò, než na nìj vyrazím.
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

	description	 = 	"Nebojíš se, že tì kvùli tomu nìkdo napadne?";
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
	AI_Output			(other, self, "DIA_Rethon_ANGST_15_00"); //Nebojíš se, že tì kvùli tomu nìkdo napadne?

	AI_Output			(self, other, "DIA_Rethon_ANGST_12_01"); //Co? Kdo? Sylvio?

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Rethon_ANGST_12_02"); //Tvùj šéf si asi myslí, že se tady mùže jen tak zabíjet, co?
			AI_Output			(other, self, "DIA_Rethon_ANGST_15_03"); //Nepatøím k Sylviovým lidem. Pracuju jen sám pro sebe.
			AI_Output			(self, other, "DIA_Rethon_ANGST_12_04"); //No, tak dobrá. Zapomeò, že jsem nìco øekl.
		};

	AI_Output			(self, other, "DIA_Rethon_ANGST_12_05"); //Vidìl jsi ty hastroše, co mìl s sebou?
	AI_Output			(self, other, "DIA_Rethon_ANGST_12_06"); //Sylvio bude rád, když se odsud dostane vcelku.

	if (Npc_IsDead(DJG_Sylvio))
	{
	AI_Output			(other, self, "DIA_Rethon_ANGST_15_07"); //Ne, to asi nebude. Je mrtvý.
	AI_Output			(self, other, "DIA_Rethon_ANGST_12_08"); //Taky dobøe.
	}
	else
	{
	Info_AddChoice	(DIA_Rethon_ANGST, DIALOG_BACK, DIA_Rethon_ANGST_weiter );
	Info_AddChoice	(DIA_Rethon_ANGST, "Nevypadáš, že bys ho mìl zrovna v lásce.", DIA_Rethon_ANGST_sylviomoegen );
	Info_AddChoice	(DIA_Rethon_ANGST, "Tak kde je Sylvio teï?", DIA_Rethon_ANGST_woSylvio );
	Info_AddChoice	(DIA_Rethon_ANGST, "Sylvio byl tady?", DIA_Rethon_ANGST_sylviohier );
	};
};

func void DIA_Rethon_ANGST_weiter ()
{
	Info_ClearChoices	(DIA_Rethon_ANGST);
};

func void DIA_Rethon_ANGST_sylviohier ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_sylviohier_15_00"); //Sylvio byl tady?
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviohier_12_01"); //Myslíš tady na hradì? Jo, to byl. Ale jenom chvilku.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviohier_12_02"); //Promluvil si tu s nìkolika lidmi a pak znovu odešel.

};

func void DIA_Rethon_ANGST_sylviomoegen ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_sylviomoegen_15_00"); //Nevypadáš, že bys ho mìl zrovna v lásce.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_01"); //Cože, mìl bych ho mít rád? Nejsem pyšný ani na to, že ho znám.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_02"); //Sylvio nemá žádné pøátele. Potøebuje lidi, co za ním pùjdou, a je mu úplnì jedno, co za lidi to bude.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_03"); //To není nic pro mì. Pracuju sám.


};

func void DIA_Rethon_ANGST_woSylvio ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_woSylvio_15_00"); //Tak kde je Sylvio teï?
	AI_Output			(self, other, "DIA_Rethon_ANGST_woSylvio_12_01"); //Ti paladinové tady øíkali nìco o ledovém drakovi na západì. Údajnì je to ten nejmocnìjší a nejnebezpeènìjší drak ze všech drakù.
	AI_Output			(self, other, "DIA_Rethon_ANGST_woSylvio_12_02"); //Mìls vidìt, jak Sylviovi zazáøily oèi, když o tom uslyšel. Není tak tìžký uhodnout, kam šel.

	B_LogEntry (TOPIC_DRACHENJAGD,"Drakobijce Rethon mumlal cosi o ledovém drakovi."); 
	B_LogEntry (TOPIC_Dragonhunter,"Sylvio byl zalezlý na hradì a pak se vydal hledat ledového draka.");

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

	description	 = 	"Mùžeš mi pomoct s vylepšením mé zbranì?";
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
	AI_Output			(other, self, "DIA_Rethon_MEINEWAFFE_15_00"); //Mùžeš mi pomoct s vylepšením mé zbranì?
	AI_Output			(self, other, "DIA_Rethon_MEINEWAFFE_12_01"); //Vylepšit? Nejlíp udìláš, když si koupíš nìco nového a ten svùj starej krám zahodíš.
	AI_Output			(self, other, "DIA_Rethon_MEINEWAFFE_12_02"); //Možná bych pro tebe nìco mìl. Máš zájem?
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
	
	description	 = 	"Co mi mùžeš nabídnout?";
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
	AI_Output			(other, self, "DIA_Rethon_TRADE_15_00"); //Co mi mùžeš nabídnout?
	B_GiveTradeInv (self);

	if (hero.guild == GIL_PAL)
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_01"); //Chlape, podívej, jak mám vyprodanej sklad. Teï neprodávám zbranì nikomu jinýmu než paladinùm.
		}
	else if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_02"); //Pro mágy toho vážnì moc nemám, ale i tak se mùžeš podívat.
		}
	else
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_03"); //Mám dojem, že mám to, co potøebuješ, pøíteli.
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


