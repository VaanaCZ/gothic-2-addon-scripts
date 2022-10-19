// *************************************************
// 						EXIT 
// *************************************************
INSTANCE DIA_Lobart_EXIT   (C_INFO)
{
	npc         = BAU_950_Lobart;
	nr          = 999;
	condition   = DIA_Lobart_EXIT_Condition;
	information = DIA_Lobart_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Lobart_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Lobart_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// *************************************************
// 					STOLEN CLOTHS 
// *************************************************
instance DIA_Lobart_STOLENCLOTHS		(C_INFO)
{
	npc			 = BAU_950_Lobart;
	nr           = 1;
	condition	 = DIA_Lobart_STOLENCLOTHS_Condition;
	information	 = DIA_Lobart_STOLENCLOTHS_Info;
	permanent 	 = FALSE;
	important	 = TRUE;
};

func int DIA_Lobart_STOLENCLOTHS_Condition ()
{
	if (Mob_HasItems("CHEST_LOBART", ITAR_Bau_L) == FALSE)
	&& (Lobart_Kleidung_Verkauft == FALSE)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Lobart_STOLENCLOTHS_Info ()
{
	// ------ SC hat Rüstung an ------
	
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	if (Hlp_IsItem (heroArmor, ItAr_BAU_L) == TRUE)
	{
		AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_05_00"); //Nevêâím svým oèím! Ten bastard se tu producíruje v MÝCH šatech!
	}	
	else
	{
		AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_05_01"); //Hej, ty!
		AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_05_02"); //Od tý doby, cos tu byl naposled, se mi ztratilo pár vêcí z mojí truhly!
	};
	
	// ------ SC hat nach Arbeit gefragt -------
	if (Npc_KnowsInfo (other, DIA_Lobart_WorkNOW))
	{
		AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_05_03"); //Mêl bys dêlat nêco užiteènýho, ne èmuchat kolem mýho domu, ty línej mizero!
	};
	
	AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_05_04"); //Okamžitê mi vraã moje šaty!
	
	Info_ClearChoices	(DIA_Lobart_STOLENCLOTHS);
	Info_AddChoice		(DIA_Lobart_STOLENCLOTHS, "Zapomeà!", 				DIA_Lobart_STOLENCLOTHS_ForgetIt );
	if (Npc_HasItems (other, ItAr_BAU_L) > 0)
	{
		Info_AddChoice		(DIA_Lobart_STOLENCLOTHS, "Tady, vezmi si je zpátky.", 	DIA_Lobart_STOLENCLOTHS_HereYouGo );
	}
	else
	{
		Info_AddChoice		(DIA_Lobart_STOLENCLOTHS, "Už je nemám.", 	DIA_Lobart_STOLENCLOTHS_DontHaveIt );
	};
};
	
func void DIA_Lobart_STOLENCLOTHS_HereYouGo ()
{
	AI_Output (other, self, "DIA_Lobart_STOLENCLOTHS_HereYouGo_15_00"); //Tady, vezmi si je zpátky.
	AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_HereYouGo_05_01"); //Pokud je chceš, mùžeš za nê taky ZAPLATIT!
	AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_HereYouGo_05_02"); //(odmêâenê) Teë bêž dêlat nêco užiteènýho!
	
	B_GiveInvItems (other, self, ItAr_BAU_L, 1);
	
	Info_ClearChoices	(DIA_Lobart_STOLENCLOTHS);
};

func void DIA_Lobart_STOLENCLOTHS_DontHaveIt ()
{
	AI_Output (other, self, "DIA_Lobart_STOLENCLOTHS_DontHaveIt_15_00"); //Už je nemám.
	AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_DontHaveIt_05_01"); //Prodals je, co? (âve) Já ti ukážu, ty smrkáèi!
	
	Lobart_Kleidung_gestohlen = TRUE;
	AI_StopProcessInfos (self);	
	B_Attack (self, other, AR_Theft, 1); 
};
	
func void DIA_Lobart_STOLENCLOTHS_ForgetIt ()
{
	AI_Output (other, self, "DIA_Lobart_STOLENCLOTHS_ForgetIt_15_00"); //Zapomeà!
	AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_ForgetIt_05_01"); //(âve) Já ti ukážu, mladíku!
	
	Lobart_Kleidung_gestohlen = TRUE;
	AI_StopProcessInfos (self);	
	B_Attack (self, other, AR_Theft, 1); 
};


 
///////////////////////////////////////////////////////////////////////
//	Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_Hallo		(C_INFO)
{
	npc		 	= BAU_950_Lobart;
	nr          = 2;
	condition	= DIA_Lobart_Hallo_Condition;
	information	= DIA_Lobart_Hallo_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Lobart_Hallo_Condition ()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (self.aivar [AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;	
	};
};

func void DIA_Lobart_Hallo_Info ()
{
	if (hero.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Lobart_Hallo_05_00"); //Co otravuješ na mým pozemku?
		AI_Output (self, other, "DIA_Lobart_Hallo_05_01"); //(zkoumavê) Na èí stranê jsi? Vzbouâencù, nebo krále?
	
		Info_ClearChoices	(DIA_Lobart_Hallo);
		Info_AddChoice		(DIA_Lobart_Hallo, "Nerozumím...", DIA_Lobart_Hallo_What );
		Info_AddChoice		(DIA_Lobart_Hallo, "Jsem na královê stranê!", 		DIA_Lobart_Hallo_ForTheKing );
		Info_AddChoice		(DIA_Lobart_Hallo, "Jsem s rolníky!",		DIA_Lobart_Hallo_ForThePeasants );
	}
	else
	{
		AI_Output (self, other, "DIA_Lobart_Hallo_05_02"); //Co pro tebe mùžu udêlat?
	};
};

func void DIA_Lobart_Hallo_ForThePeasants()
{
	AI_Output (other, self, "DIA_Lobart_Hallo_ForThePeasants_15_00"); //Jsem s rolníky!
	AI_Output (self, other, "DIA_Lobart_Hallo_ForThePeasants_05_01"); //Ha! Ten zpropadenej štváè Onar nás dostane všechny do hrobu!
	AI_Output (self, other, "DIA_Lobart_Hallo_ForThePeasants_05_02"); //Co myslíš, jak dlouho budou ještê paladinové jen tak stát a pâihlížet?
	AI_Output (self, other, "DIA_Lobart_Hallo_ForThePeasants_05_03"); //Po tom, co Onar provedl, je celý mêsto vzhùru nohama.

	Lobart_AgainstKing = TRUE;
	Info_ClearChoices	(DIA_Lobart_Hallo);
};

func void DIA_Lobart_Hallo_ForTheKing()
{
	AI_Output (other, self, "DIA_Lobart_Hallo_ForTheKing_15_00"); //Jsem na královê stranê!
	AI_Output (self, other, "DIA_Lobart_Hallo_ForTheKing_05_01"); //(pohrdavê) 'Na královê stranê!' To samý âíkali vojáci z domobrany, když mi vzali pùlku mých ovcí.
	AI_Output (self, other, "DIA_Lobart_Hallo_ForTheKing_05_02"); //Ale kde jsou ti bastardi, když si na nás došlápnou banditi? A kde asi tak budou, až nás napadnou skâeti?
	AI_Output (self, other, "DIA_Lobart_Hallo_ForTheKing_05_03"); //Já ti âeknu kde: ve mêstê, za širokýma hradbama.
	AI_Output (self, other, "DIA_Lobart_Hallo_ForTheKing_05_04"); //Tak mê s tím svým králem neotravuj.
	
	Lobart_AgainstKing = FALSE;
	Info_ClearChoices	(DIA_Lobart_Hallo);
};

func void DIA_Lobart_Hallo_What()
{
	AI_Output (other, self, "DIA_Lobart_Hallo_What_15_00"); //Nerozumím...
	AI_Output (self, other, "DIA_Lobart_Hallo_What_05_01"); //Co?! Nezahrávej si se mnou, hochu! Chci vêdêt, na èí stranê jsi! Tak pro koho jsi?!
};

///////////////////////////////////////////////////////////////////////
//	Kleidung
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_KLEIDUNG		(C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 2;
	condition	= DIA_Lobart_KLEIDUNG_Condition;
	information	= DIA_Lobart_KLEIDUNG_Info;
	permanent 	= FALSE;
	description	= "Potâebuju nêjaké vhodné šaty!";
};

func int DIA_Lobart_KLEIDUNG_Condition ()
{
	if (! Npc_KnowsInfo(other, DIA_Lobart_STOLENCLOTHS) )
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Lobart_KLEIDUNG_Info ()
{
	AI_Output (other, self, "DIA_Lobart_KLEIDUNG_15_00"); //Potâebuju nêjaké vhodné šaty!
	AI_Output (self, other, "DIA_Lobart_KLEIDUNG_05_01"); //Mùžu ti dát èistý farmáâský pracovní odêv.
	AI_Output (self, other, "DIA_Lobart_KLEIDUNG_05_02"); //A mùžeš za nêj zaplatit?
	
			Log_CreateTopic (TOPIC_Kleidung,LOG_MISSION);  
			Log_SetTopicStatus  (TOPIC_Kleidung,LOG_RUNNING);  
			B_LogEntry (TOPIC_Kleidung,"Sedlák Lobart mi prodá pracovní odêv.");
			  
		
	if (! Npc_KnowsInfo(other, 	DIA_Lobart_WorkNOW))
	{
		AI_Output (self, other, "DIA_Lobart_KLEIDUNG_05_03"); //Mùžeš si èást ceny odpracovat. Pokud teda HLEDÁŠ práci.
		B_LogEntry (TOPIC_Kleidung,"Èást ceny si mohu odpracovat na statku. Èím víc práce odvedu, tím ménê mê ty šaty budou stát.");

	};
};

///////////////////////////////////////////////////////////////////////
//	KOSTEN
///////////////////////////////////////////////////////////////////////

instance DIA_Lobart_BuyClothes (C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 2;
	condition	= DIA_Lobart_BuyClothes_Condition;
	information	= DIA_Lobart_BuyClothes_Info;
	permanent 	= TRUE;
	description	= "Kolik za ty pracovní šaty chceš?";
};

func int DIA_Lobart_BuyClothes_Condition ()
{
	if ( Npc_KnowsInfo(other,DIA_Lobart_KLEIDUNG) 		&& (Lobart_Kleidung_Verkauft == FALSE) )
	|| ( Npc_KnowsInfo(other,DIA_Lobart_STOLENCLOTHS) 	&& (Lobart_Kleidung_gestohlen == FALSE) && (Lobart_Kleidung_Verkauft == FALSE) )
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Lobart_BuyClothes_Info ()
{
	Wert_LobartsRuestung = 80; //initialisieren
	
	AI_Output (other, self, "DIA_Lobart_BuyClothes_15_00"); //Kolik za ty pracovní šaty chceš?
	AI_Output (self, other, "DIA_Lobart_BuyClothes_05_01"); //Dobrá, takže...
	
	if (Lobart_AgainstKing == TRUE)
	{
		//stillschweigender Abzug
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};
	
	if (MIS_Lobart_Rueben == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Lobart_BuyClothes_05_02"); //Pracoval jsi pro mê na poli.
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};
	
	if (MIS_Hilda_PfanneKaufen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Lobart_BuyClothes_05_03"); //Pomohl jsi mé ženê.
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};
	
	if (MIS_Vino_Wein == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Lobart_BuyClothes_05_04"); //Vino âíkal, žes mu opravdu pomohl. A to už nêco znamená - ne pokaždé drží s nádeníky.
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};
	
	if (MIS_Maleth_Bandits == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Lobart_BuyClothes_05_05"); //Maleth âíkal, žes zahnal bandity. Ti bastardi nám zpùsobili hodnê potíží. Díky, žes je odstranil z cesty!
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};

	// ------------------------------
	// ------ Wert der Rüstung ------
	// ------------------------------
		B_Say_Gold (self, other, Wert_LobartsRuestung);
		
		if (Wert_LobartsRuestung == 30) 
		{
			AI_Output (self, other, "DIA_Lobart_GOLD_05_06"); //Levnêjší už to nebude.
			B_LogEntry (TOPIC_Kleidung,"Ale neprodá mi je za ménê než 30 zlaãákù.");
		};

	Info_ClearChoices	(DIA_Lobart_BuyClothes);
	Info_AddChoice		(DIA_Lobart_BuyClothes, "To je moc drahé.", DIA_Lobart_BuyClothes_NotYet );
	Info_AddChoice		(DIA_Lobart_BuyClothes, "Dej mi ty pracovní šaty. (Ochrana: zbranê 15, šípy 15)", DIA_Lobart_BuyClothes_BUY );
};

func void DIA_Lobart_BuyClothes_BUY()
{
	AI_Output (other, self, "DIA_Lobart_BuyClothes_BUY_15_00"); //Tak to mi ty šaty dej.
	
	if (B_GiveInvItems (other, self, ItMi_gold, Wert_LobartsRuestung))
	{
		if (Npc_HasItems(self,ItAr_BAU_L) > 0)
		{
			AI_Output (self, other, "DIA_Lobart_BuyClothes_BUY_05_01"); //Fajn, chlapèe. S poctivostí nejdál dojdeš. Tady je máš!
			
			B_GiveInvItems (self, other, ItAr_BAU_L, 1);
		}
		else 
		{
			AI_Output (self, other, "DIA_Lobart_BuyClothes_BUY_05_02"); //V mém domê je truhla, ve které najdeš èistý odêv.
			AI_Output (self, other, "DIA_Lobart_BuyClothes_BUY_05_03"); //Ale ani nepomysli na to, že by sis bez optání vzal cokoli dalšího!
		};
		
		Lobart_Kleidung_Verkauft = TRUE;
		Wld_AssignRoomToGuild ("farm03", GIL_NONE);  	//Schlaf Raum
				
		B_CheckLog ();
	}
	else //nicht genug Gold
	{
		AI_Output (self, other, "DIA_Lobart_BuyClothes_BUY_05_04"); //Nemáš dost zlata!
	};
	
	Info_ClearChoices	(DIA_Lobart_BuyClothes);
};

func void DIA_Lobart_BuyClothes_NotYet()
{
	AI_Output (other, self, "DIA_Lobart_BuyClothes_NotYet_15_00"); //To je moc drahé.
	AI_Output (self, other, "DIA_Lobart_BuyClothes_NotYet_05_01"); //Jak je libo...
	
	Info_ClearChoices	(DIA_Lobart_BuyClothes);
};

///////////////////////////////////////////////////////////////////////
//	Was ist hier los?
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_AufstandInfo (C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 1;
	condition	= DIA_Lobart_AufstandInfo_Condition;
	information	= DIA_Lobart_AufstandInfo_Info;
	permanent 	= FALSE;
	description	= "A jak to jinak jde?";
};

func int DIA_Lobart_AufstandInfo_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Lobart_Hallo))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Lobart_AufstandInfo_Info ()
{
	AI_Output (other, self, "DIA_Lobart_AufstandInfo_15_00"); //A co jinak?
	AI_Output (self, other, "DIA_Lobart_AufstandInfo_05_01"); //Jak, jinak? Hochu, ODKUD jsi? Jsme na pokraji obèanské války!

	if 	(hero.guild == GIL_NONE)
	 {
		AI_Output (self, other, "DIA_Lobart_AufstandInfo_05_02"); //Až doteë pohlíželi všichni farmáâi na odvody mêstu jako na spravedlivou formu zdanêní.
		AI_Output (self, other, "DIA_Lobart_AufstandInfo_05_03"); //Ale od té doby, co jsou v Khorinidu paladinové, nás vojáci z domobrany navštêvují èím dál tím èastêjc a už si pomalu berou úplnê všechno.
		AI_Output (self, other, "DIA_Lobart_AufstandInfo_05_04"); //Jestli to tak pùjde dál, nic už nám nezbude.
	 };

	AI_Output (self, other, "DIA_Lobart_AufstandInfo_05_05"); //Nêkteâí farmáâi se zaèali bouâit. Onar byl první!
};

///////////////////////////////////////////////////////////////////////
//	Mehr über Onar
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_OnarStory (C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 1;
	condition	= DIA_Lobart_OnarStory_Condition;
	information	= DIA_Lobart_OnarStory_Info;
	permanent 	= FALSE;
	description	= "Povêz mi nêco o tom Onarovi.";
};

func int DIA_Lobart_OnarStory_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Lobart_AufstandInfo))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Lobart_OnarStory_Info ()
{
	AI_Output (other, self, "DIA_Lobart_OnarStory_15_00"); //Âekni mi nêco o tom Onarovi.

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Lobart_OnarStory_05_01"); //Ty jsi žoldák, ne? Tak co bych ti mêl dalšího âíkat o tvém šéfovi?
		}
		else
		{
			AI_Output (self, other, "DIA_Lobart_OnarStory_05_02"); //Onar je nejvêtší farmáâ v okolí. Odtrhl se od mêsta.
			AI_Output (self, other, "DIA_Lobart_OnarStory_05_03"); //Âíká se, že si najal žoldáky, aby udržel domobranu na uzdê!
			AI_Output (self, other, "DIA_Lobart_OnarStory_05_04"); //Není se mu co divit.
			AI_Output (self, other, "DIA_Lobart_OnarStory_05_05"); //V každém pâípadê se na jeho farmu už žádný královský voják neodváží vstoupit.
		};
};

///////////////////////////////////////////////////////////////////////
//	Mehr über Söldner
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_SldInfo (C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 1;
	condition	= DIA_Lobart_SldInfo_Condition;
	information	= DIA_Lobart_SldInfo_Info;
	permanent 	= FALSE;
	description	= "Kdo jsou ti žoldnéâi, co si Onar najal?";
};

func int DIA_Lobart_SldInfo_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Lobart_OnarStory))
	&& ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Lobart_SldInfo_Info ()
{
	AI_Output (other, self, "DIA_Lobart_SldInfo_15_00"); //Kdo jsou ti žoldnéâi, co si Onar najal?
	AI_Output (self, other, "DIA_Lobart_SldInfo_05_01"); //O têch chlapech toho moc nevím. Údajnê jsou to vêtšinou bývalí vêzàové z trestanecké kolonie.
	AI_Output (self, other, "DIA_Lobart_SldInfo_05_02"); //(opovržlivê) Všichni moc dobâe vêdí, co se od nich dá oèekávat.
};

///////////////////////////////////////////////////////////////////////
//	Für wen bist du?
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_WhichSide (C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 1;
	condition	= DIA_Lobart_WhichSide_Condition;
	information	= DIA_Lobart_WhichSide_Info;
	permanent 	= FALSE;
	description	= "Na èí stranê stojíš? Jsi se sedláky, nebo s králem?";
};

func int DIA_Lobart_WhichSide_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Lobart_AufstandInfo))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Lobart_WhichSide_Info ()
{
	AI_Output (other, self, "DIA_Lobart_WhichSide_15_00"); //A co ty? Na èí stranê jsi? Rolníci, nebo král?
	AI_Output (self, other, "DIA_Lobart_WhichSide_05_01"); //Jsem pâíliš blízko mêstu, než abych mêl na výbêr.
	AI_Output (self, other, "DIA_Lobart_WhichSide_05_02"); //Ale já jsem vlastnê rád. Nevêdêl bych, jak se rozhodnout.
	
	if (hero.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Lobart_WhichSide_05_03"); //Král nás vysává a Onar posílá svý žoldáky na každýho, kdo se k nêmu odmítl pâidat.
		AI_Output (self, other, "DIA_Lobart_WhichSide_05_04"); //To je taky dùvod, proè se vêtšina ostatních farmáâù ještê nerozhodla. Ale dâíve èi pozdêji se budou muset k jedné stranê pâidat.
	};
};


///////////////////////////////////////////////////////////////////////
//	*** MISSION: Rüben ziehen ***
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_WorkNOW (C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 1;
	condition	= DIA_Lobart_WorkNOW_Condition;
	information	= DIA_Lobart_WorkNOW_Info;
	permanent 	= FALSE;
	description	= "Hledám práci.";
};

func int DIA_Lobart_WorkNOW_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Lobart_AufstandInfo))
	|| (Npc_KnowsInfo(other, DIA_Lobart_STOLENCLOTHS))
	|| (Npc_KnowsInfo(other, DIA_Lobart_Kleidung))
	{
		if (Kapitel < 3)
		{
			return TRUE;
		};
	};
};

func void DIA_Lobart_WorkNOW_Info ()
{
	AI_Output (other, self, "DIA_Lobart_WorkNOW_15_00"); //Hledám práci.
	AI_Output (self, other, "DIA_Lobart_WorkNOW_05_01"); //Dalšího rolníka už nemùžu potâebovat. Ale mùžu ti nabídnout práci nádeníka.
	AI_Output (self, other, "DIA_Lobart_WorkNOW_05_02"); //Tím myslím, že mùžeš pâiložit ruku k dílu na poli. A taky se urèitê najde pár dalších vêcí, co se tu kolem musí udêlat.

	if (hero.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Lobart_WorkNOW_05_03"); //Mùžu ti zaplatit zlatem. Nebo ti dám nêjaké slušné vêci na sebe.
		AI_Output (self, other, "DIA_Lobart_WorkNOW_05_04"); //Ty vêci docela stojí za to. Nemùžu ti je dát zadarmo, ale mùžu ti je pak prodat se slevou.
			
		Log_CreateTopic (TOPIC_Kleidung,LOG_MISSION);  
		Log_SetTopicStatus  (TOPIC_Kleidung,LOG_RUNNING);  
		B_LogEntry (TOPIC_Kleidung,"Sedlák Lobart mi mùže prodat pracovní odêv. Èást ceny si mohu odpracovat na jeho statku - èím víc práce odvedu, tím ménê mê ty šaty budou stát.");
			
		if (Npc_HasEquippedArmor(other) == FALSE)
		|| (Lobart_Kleidung_Verkauft == TRUE)
		{
			AI_Output (self, other, "DIA_Lobart_WorkNOW_05_05"); //Ale jak na tebe tak koukám, musím âíct: vezmi si ty šaty.
		}
		else
		{
			AI_Output (self, other, "DIA_Lobart_WorkNOW_05_06"); //Ale ty už máš šaty, takže asi budeš chtít zlato.
		};
	};

	AI_Output (self, other, "DIA_Lobart_WorkNOW_05_07"); //Takže - ten tuâínový záhon za stodolou se musí sklidit.
	
	Info_ClearChoices	(DIA_Lobart_WorkNOW);
	Info_AddChoice		(DIA_Lobart_WorkNOW, "Já mám tahat ze zemê tuâín? To si ze mê dêláš srandu!", DIA_Lobart_WorkNOW_WannaFoolMe );
	Info_AddChoice		(DIA_Lobart_WorkNOW, "Dobrá.", DIA_Lobart_WorkNOW_Ok );
};

func void DIA_Lobart_WorkNOW_Ok()
{
	AI_Output (other, self, "DIA_Lobart_WorkNOW_Ok_15_00"); //Dobrá...

	if (hero.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Lobart_WorkNOW_Ok_05_01"); //Tak si s tím koukej pospíšit, než si to rozmyslím.
	};
	Log_CreateTopic (TOPIC_Rueben,LOG_MISSION);  
	Log_SetTopicStatus  (TOPIC_Rueben,LOG_RUNNING);  
	B_LogEntry (TOPIC_Rueben,"Sedlák Lobart chce, abych mu z pole sklidil tuâíny. Za odmênu dostanu pár zlaãákù a budu si u nêj moci koupit ošacení se slevou.");
	
	MIS_Lobart_Rueben = LOG_RUNNING;
	Info_ClearChoices	(DIA_Lobart_WorkNOW);
};

func void DIA_Lobart_WorkNOW_WannaFoolMe()
{
	AI_Output (other, self, "DIA_Lobart_WorkNOW_WannaFoolMe_15_00"); //Já mám tahat ze zemê tuâín? To si musíš dêlat srandu!
	AI_Output (self, other, "DIA_Lobart_WorkNOW_WannaFoolMe_05_01"); //Poâádná chlapská práce není pro takovýho 'nafrnênýho džentlmena', eh?

	if (hero.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Lobart_WorkNOW_WannaFoolMe_05_02"); //Buë vytahej ty tuâíny ze zemê, nebo táhni z mojí farmy!
	}
	else
	{
		AI_Output (self, other, "DIA_Lobart_WorkNOW_WannaFoolMe_05_03"); //Právê teë pro tebe nemám žádnou další práci.
	};
	
	Log_CreateTopic (TOPIC_Rueben,LOG_MISSION);  
	Log_SetTopicStatus  (TOPIC_Rueben,LOG_RUNNING);  
	B_LogEntry (TOPIC_Rueben,"Sedlák Lobart chce, abych mu z pole sklidil tuâíny. Za odmênu dostanu pár zlaãákù a budu si u nêj moci koupit ošacení se slevou.");
	
	MIS_Lobart_Rueben = LOG_RUNNING;
	Info_ClearChoices	(DIA_Lobart_WorkNOW);
	
};

///////////////////////////////////////////////////////////////////////
//	Mis RUEBEN Running
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_RuebenRunning		(C_INFO)
{
	npc			 = 	BAU_950_Lobart;
	nr           =  1;
	condition	 = 	DIA_Lobart_RuebenRunning_Condition;
	information	 = 	DIA_Lobart_RuebenRunning_Info;
	permanent	 =	TRUE;
	description	 = 	"Tady jsou tvoje tuâíny!";
};

func int DIA_Lobart_RuebenRunning_Condition ()
{
	if (MIS_Lobart_Rueben == LOG_RUNNING)
	&& (Npc_HasItems (other,ItPl_Beet) >= 1)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Lobart_RuebenRunning_Info ()
{
	AI_Output (other, self, "DIA_Lobart_RuebenRunning_15_00"); //Tady jsou tvoje tuâíny!

	if (Npc_HasItems (other,ItPl_Beet) >= 20)
	{
		if (hero.guild == GIL_NONE)
			{
				AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_01"); //Hej, ty pâece jen nebudeš takovej darmožrout.
			};

		if ((Npc_IsDead(Hilda))== FALSE)
		{
			AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_02"); //Dej je mé ženê v kuchyni a âekni jí, aã je uvaâí.
	
			MIS_Lobart_RuebenToHilda = LOG_RUNNING;
			Log_CreateTopic (TOPIC_Ruebenbringen,LOG_MISSION);
			Log_SetTopicStatus (TOPIC_Ruebenbringen,LOG_RUNNING);
			B_LogEntry (TOPIC_Ruebenbringen,"Musím ty tuâíny doruèit do domu a pâedat je Lobartovê ženê, která z nich nêco dobrého uvaâí.");
		};
		
		MIS_Lobart_Rueben = LOG_SUCCESS;
		B_GivePlayerXP (XP_LobartHolRueben);
		 
	//	Log_SetTopicStatus(TOPIC_BauerLobart, LOG_SUCCESS); ALT
	//	Log_AddEntry (TOPIC_BauerLobart,"Ich habe Lobart seine Rüben gebracht, er hat mich dafür entlohnt."); 
		
		AI_Output (other, self, "DIA_Lobart_RuebenRunning_15_03"); //A co moje mzda?
		AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_04"); //Mùžu ti dát 5 zlatých.
		
		if (hero.guild == GIL_NONE)
			{
				AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_05"); //...nebo ti slevit z ceny têch šatù. Tak co to bude?
			};
	
		Info_ClearChoices 	(DIA_Lobart_RuebenRunning);

		if (hero.guild == GIL_NONE)
			{
				Info_AddChoice		(DIA_Lobart_RuebenRunning, "Chci slevu na ty šaty!",	DIA_Lobart_RuebenRunning_Billiger );
			};

		Info_AddChoice		(DIA_Lobart_RuebenRunning, "Dej mi têch 5 zlatých!", 		DIA_Lobart_RuebenRunning_Gold );

	}
	else
	{
		AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_06"); //Ale to není všech 20!
		
		if (hero.guild == GIL_NONE)
			{
				AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_07"); //Jsi tady na dovolené?! Doufám, že ne, chlapèe, jinak mùžeš na svou mzdu zapomenout!
				AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_08"); //Vraã se tam a pâines jich víc! Mazej do práce, nebo ti ukážu!
			};
		
		AI_StopProcessInfos (self);
	};
};

func void DIA_Lobart_RuebenRunning_Gold ()
{
	AI_Output (other, self, "DIA_Lobart_RuebenRunning_Gold_15_00"); //Dej mi têch 5 zlatých!
	AI_Output (self, other, "DIA_Lobart_RuebenRunning_Gold_05_01"); //Tady.

	B_GiveInvItems (self, other, ItMi_Gold, 5);

		if (hero.guild == GIL_NONE)
			{
					AI_Output (self, other, "DIA_Lobart_RuebenRunning_Gold_05_02"); //A ne abys to hned propil.
			};
			

	Info_ClearChoices 	(DIA_Lobart_RuebenRunning);
};

func void DIA_Lobart_RuebenRunning_Billiger ()
{
	AI_Output (other, self, "DIA_Lobart_RuebenRunning_Billiger_15_00"); //Chci slevu na ty šaty!
	AI_Output (self, other, "DIA_Lobart_RuebenRunning_Billiger_05_01"); //Fajn! Dám ti je o 10 zlatých levnêjc.
	
	Info_ClearChoices 	(DIA_Lobart_RuebenRunning);
};

///////////////////////////////////////////////////////////////////////
//	Was sonst noch zu tun?
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_MoreWork (C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 1;
	condition	= DIA_Lobart_MoreWork_Condition;
	information	= DIA_Lobart_MoreWork_Info;
	permanent 	= TRUE;
	description	= "Máš pro mê ještê nêjakou další práci?";
};

func int DIA_Lobart_MoreWork_Condition ()
{
	if ((MIS_Lobart_Rueben == LOG_RUNNING)
	|| (MIS_Lobart_Rueben == LOG_SUCCESS))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Lobart_MoreWork_Info ()
{
	AI_Output (other, self, "DIA_Lobart_MoreWork_15_00"); //Máš pro mê ještê nêjakou další práci?
	
	if (MIS_Lobart_Rueben == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Lobart_MoreWork_05_01"); //Nejdâív sklië ty tuâíny a pak se uvidí.
	}
	else //SUCCESS
	{
		AI_Output (self, other, "DIA_Lobart_MoreWork_05_02"); //Já ne, ale mùžeš se zeptat mé ženy nebo chlapù na polích. Tâeba budou potâebovat s nêèím pomoct.
	};
};



//#####################################################################
//
//
//			ANDREs Aufnahmemission Miliz
//
//
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info AndreHelpLobart
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_ANDREHELPLOBART		(C_INFO)
{
	npc			 = 	BAU_950_Lobart;
	condition	 = 	DIA_Lobart_ANDREHELPLOBART_Condition;
	information	 = 	DIA_Lobart_ANDREHELPLOBART_Info;
	description	 = 	"Posílá mê za tebou Andre.";
};

func int DIA_Lobart_ANDREHELPLOBART_Condition ()
{
	if	(MIS_AndreHelpLobart == LOG_RUNNING)			
			{
				return TRUE;
			};
};

func void DIA_Lobart_ANDREHELPLOBART_Info ()
{
	AI_Output			(other, self, "DIA_Lobart_ANDREHELPLOBART_15_00"); //Andre mê poslal za tebou. Máš pro mê nêjakou práci?
	AI_Output			(self, other, "DIA_Lobart_ANDREHELPLOBART_05_01"); //Jo, jasnê. Z têch zatracenejch polních škùdcù už se mi zvedá kufr.
	AI_Output			(self, other, "DIA_Lobart_ANDREHELPLOBART_05_02"); //Oddêlej je všechny. Je mi jedno jak!

	Log_AddEntry (TOPIC_BecomeMIL,"Lobartova pole sužují polní škùdci - mám je všechny zahnat."); 
	MIS_LobartKillBugs = LOG_RUNNING;
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info BugDead
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_BUGDEAD		(C_INFO)
{
	npc			 = 	BAU_950_Lobart;
	condition	 = 	DIA_Lobart_BUGDEAD_Condition;
	information	 = 	DIA_Lobart_BUGDEAD_Info;
	permanent 	 = 	TRUE;
	description	 = 	"Zatoèil jsem s têma vêcma!";
};

var int DIA_Lobart_BUGDEAD_noPerm;

func int DIA_Lobart_BUGDEAD_Condition ()
{
	if (MIS_LobartKillBugs == LOG_RUNNING)
	&& (DIA_Lobart_BUGDEAD_noPerm == FALSE)
			{
					return TRUE;
			};
};

func void DIA_Lobart_BUGDEAD_Info ()
{
	if 	(
				(Npc_IsDead(Lobarts_Giant_Bug1))
			&& 	(Npc_IsDead(Lobarts_Giant_Bug2))
			&& 	(Npc_IsDead(Lobarts_Giant_Bug3))
			&& 	(Npc_IsDead(Lobarts_Giant_Bug4))
			&& 	(Npc_IsDead(Lobarts_Giant_Bug5))
			&& 	(Npc_IsDead(Lobarts_Giant_Bug6))
			&& 	(Npc_IsDead(Lobarts_Giant_Bug7))
		)

		{
			AI_Output			(other, self, "DIA_Lobart_BUGDEAD_15_00"); //Zatoèil jsem s têma vêcma!
			AI_Output			(self, other, "DIA_Lobart_BUGDEAD_05_01"); //Dobrá práce. Nejsi zas tak špatnej deratizátor. Doporuèím tê sousedùm. Na oplátku si vezmi tohle.
			
			B_StartOtherRoutine	(Vino,"Zaèít");
			B_StartOtherRoutine	(LobartsBauer1,"Zaèít");
			B_StartOtherRoutine	(LobartsBauer2,"Zaèít");

			CreateInvItems (self, ItMi_Gold, 20);
			B_GiveInvItems (self, other, ItMi_Gold, 20);

			MIS_LobartKillBugs 	= LOG_SUCCESS;
			MIS_AndreHelpLobart = LOG_SUCCESS;
			Log_AddEntry (TOPIC_BecomeMIL,"Polní škùdci už nebudou Lobarta obtêžovat - všichni už jsou pryè."); 
			DIA_Lobart_BUGDEAD_noPerm = TRUE;
		}
		else  
		{
			AI_Output			(other, self, "DIA_Lobart_BUGDEAD_15_02"); //Zatoèil jsem s têma vêcma!
			AI_Output			(self, other, "DIA_Lobart_BUGDEAD_05_03"); //Nepokoušej si ze mê dêlat blázny. Poâád je tam vidím. Buë ty zvíâata zabiješ, nebo na celou tu vêc zapomeà.
			AI_StopProcessInfos (self);
		};
};

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Lobart_KAP3_EXIT(C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 999;
	condition	= DIA_Lobart_KAP3_EXIT_Condition;
	information	= DIA_Lobart_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lobart_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lobart_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info DMT
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_DMT		(C_INFO)
{
	npc		 = 	BAU_950_Lobart;
	nr		 = 	30;
	condition	 = 	DIA_Lobart_DMT_Condition;
	information	 = 	DIA_Lobart_DMT_Info;

	description	 = 	"Jak to jde s tvou farmou?";
};

func int DIA_Lobart_DMT_Condition ()
{
	if (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Lobart_DMT_Info ()
{
	AI_Output			(other, self, "DIA_Lobart_DMT_15_00"); //Jak to jde s tvou farmou?
	AI_Output			(self, other, "DIA_Lobart_DMT_05_01"); //Už se to nedá vydržet.
	AI_Output			(self, other, "DIA_Lobart_DMT_05_02"); //Najednou se tu objevili ti chlápci v èerných kápích a postávají u cesty a u mojí farmy.


	Info_ClearChoices	(DIA_Lobart_DMT);

	Info_AddChoice	(DIA_Lobart_DMT, DIALOG_ENDE, DIA_Lobart_DMT_BACK );

	if (hero.guild == GIL_KDF)
	&& (Vino_isAlive_Kap3 == TRUE)
		{
		AI_Output			(self, other, "DIA_Lobart_DMT_05_03"); //Nejdâív hroznê dlouho mluvili s Vinem a pak zmizeli i s ním.

			if (NpcObsessedByDMT_Vino == FALSE)
			{
			Info_AddChoice	(DIA_Lobart_DMT, "Kam odvlekli Vina?", DIA_Lobart_DMT_VinoWohin );
			};
			Info_AddChoice	(DIA_Lobart_DMT, "Co mêli za kšefty s Vinem?", DIA_Lobart_DMT_VinoWas );
		};

	if ((Npc_IsDead(Hilda))== FALSE)
	&& ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)	||	(hero.guild == GIL_KDF))
	{
		AI_Output			(self, other, "DIA_Lobart_DMT_05_04"); //Moje žena zase onemocnêla. Už moc dlouho jenom leží v posteli. Stává se jí to docela èasto.
	};

	AI_Output			(self, other, "DIA_Lobart_DMT_05_05"); //Já už se z toho složím!

	if (MIS_HealHilda != LOG_SUCCESS)
	&& ((Npc_IsDead(Hilda)) == FALSE)
	&& ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)	||	(hero.guild == GIL_KDF))
	{
		Info_AddChoice	(DIA_Lobart_DMT, "Proè svou ženu nevezmeš k léèiteli?", DIA_Lobart_DMT_FrauHeilen );
	};

	Info_AddChoice	(DIA_Lobart_DMT, "Proè s têmi èernokabátníky nêco neudêláš?", DIA_Lobart_DMT_hof );
	Info_AddChoice	(DIA_Lobart_DMT, "Mluvil jsi s têmi muži v èerném?", DIA_Lobart_DMT_spokeToThem );
	
};
func void DIA_Lobart_DMT_FrauHeilen ()
{
	AI_Output			(other, self, "DIA_Lobart_DMT_FrauHeilen_15_00"); //Proè svou ženu nevezmeš k léèiteli?
	AI_Output			(self, other, "DIA_Lobart_DMT_FrauHeilen_05_01"); //Mêli bychom zajít do mêsta za Vatrasem, ale nemùžu vytáhnout paty z domu, dokud se to tu nêjak neurovná.
	
	Log_CreateTopic (TOPIC_HealHilda, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HealHilda, LOG_RUNNING);
	B_LogEntry (TOPIC_HealHilda,"Lobartovê ženê Hildê je špatnê, ale Vatras by pro ni mêl mít nêjaký lék."); 

	MIS_HealHilda = LOG_RUNNING;	
};

func void DIA_Lobart_DMT_BACK ()
{
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Zaèít"); 
};

func void DIA_Lobart_DMT_spokeToThem ()
{
	AI_Output			(other, self, "DIA_Lobart_DMT_spokeToThem_15_00"); //Mluvil jsi s têmi muži v èerném?
	AI_Output			(self, other, "DIA_Lobart_DMT_spokeToThem_05_01"); //Jasnê. Tomu se nejde vyhnout.
	AI_Output			(self, other, "DIA_Lobart_DMT_spokeToThem_05_02"); //Mám dojem, že nêkoho hledají.
};

func void DIA_Lobart_DMT_hof ()
{
	AI_Output			(other, self, "DIA_Lobart_DMT_hof_15_00"); //Proè s têmi èernokabátníky nêco neudêláš?
	AI_Output			(self, other, "DIA_Lobart_DMT_hof_05_01"); //Vážnê bych rád. Ale vidêl jsem, jak jednoho èlovêka z mêsta upálili zaživa. Jenom tak.
	AI_Output			(self, other, "DIA_Lobart_DMT_hof_05_02"); //Proè bych mêl riskovat život?
};

func void DIA_Lobart_DMT_VinoWas ()
{
	AI_Output			(other, self, "DIA_Lobart_DMT_VinoWas_15_00"); //Co mêli za kšefty s Vinem?
	AI_Output			(self, other, "DIA_Lobart_DMT_VinoWas_05_01"); //To neâíkal. Prostê ho vzali s sebou.
};

func void DIA_Lobart_DMT_VinoWohin ()
{
	AI_Output			(other, self, "DIA_Lobart_DMT_VinoWohin_15_00"); //Kam odvlekli Vina?
	AI_Output			(self, other, "DIA_Lobart_DMT_VinoWohin_05_01"); //Odešli s ním do hor.
};

///////////////////////////////////////////////////////////////////////
//	Info VinoTot
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_VINOTOT		(C_INFO)
{
	npc		 = 	BAU_950_Lobart;
	nr		 = 	32;
	condition	 = 	DIA_Lobart_VINOTOT_Condition;
	information	 = 	DIA_Lobart_VINOTOT_Info;

	description	 = 	"Vino se už nevrátí.";
};

func int DIA_Lobart_VINOTOT_Condition ()
{
	if ((Npc_IsDead(Vino))	|| (NpcObsessedByDMT_Vino == TRUE))
	&& (Npc_KnowsInfo(other, DIA_Lobart_DMT))
	&& (hero.guild == GIL_KDF)
		{
				return TRUE;
		};
};

func void DIA_Lobart_VINOTOT_Info ()
{
	AI_Output			(other, self, "DIA_Lobart_VINOTOT_15_00"); //Vino se už nevrátí.

	if (Npc_IsDead(Vino))	
	{
		AI_Output			(other, self, "DIA_Lobart_VINOTOT_15_01"); //Je mrtvý.
	}
	else
	{
		AI_Output			(other, self, "DIA_Lobart_VINOTOT_15_02"); //Pâivedli ho k šílenství.
	};
	
	AI_Output			(self, other, "DIA_Lobart_VINOTOT_05_03"); //U Innose. Doufejme, že ta noèní mùra už brzy skonèí.
	B_GivePlayerXP (XP_Ambient);
};


///////////////////////////////////////////////////////////////////////
//	Info perm
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_PERM		(C_INFO)
{
	npc		 = 	BAU_950_Lobart;
	nr		 = 	80;
	condition	 = 	DIA_Lobart_PERM_Condition;
	information	 = 	DIA_Lobart_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Dávej na svou farmu pozor!";
};

func int DIA_Lobart_PERM_Condition ()
{		
	if (Npc_KnowsInfo(other, DIA_Lobart_DMT))
	&& (Kapitel >= 3)
	&&	((Npc_IsDead(OrcWarrior_Lobart1))
	&&	(Npc_IsDead(OrcWarrior_Lobart2))
	&&	(Npc_IsDead(OrcWarrior_Lobart3))
	&&	(Npc_IsDead(OrcWarrior_Lobart4))
	&&	(Npc_IsDead(OrcWarrior_Lobart5))
	&&	(Npc_IsDead(OrcWarrior_Lobart6)))
		{
				return TRUE;
		};
};

func void DIA_Lobart_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Lobart_PERM_15_00"); //Dávej na svou farmu pozor!
	AI_Output			(self, other, "DIA_Lobart_PERM_05_01"); //Pokusím se.
};



//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Lobart_KAP4_EXIT(C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 999;
	condition	= DIA_Lobart_KAP4_EXIT_Condition;
	information	= DIA_Lobart_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lobart_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lobart_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Orkproblem
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_ORKPROBLEM		(C_INFO)
{
	npc		 = 	BAU_950_Lobart;
	nr		 = 	41;
	condition	 = 	DIA_Lobart_ORKPROBLEM_Condition;
	information	 = 	DIA_Lobart_ORKPROBLEM_Info;

	description	 = 	"Mám problém se skâety.";
};

func int DIA_Lobart_ORKPROBLEM_Condition ()
{
	if	((Npc_IsDead(OrcWarrior_Lobart1)== FALSE)
	||	(Npc_IsDead(OrcWarrior_Lobart2)	== FALSE)
	||	(Npc_IsDead(OrcWarrior_Lobart3)	== FALSE)
	||	(Npc_IsDead(OrcWarrior_Lobart4)	== FALSE)
	||	(Npc_IsDead(OrcWarrior_Lobart5)	== FALSE)
	||	(Npc_IsDead(OrcWarrior_Lobart6)	== FALSE))
	&& 	(Kapitel >= 4)
	&& 	((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG))
	&& (Npc_KnowsInfo(other, DIA_Lobart_DMT))
		{
				return TRUE;
		};
};

func void DIA_Lobart_ORKPROBLEM_Info ()
{
	AI_Output			(other, self, "DIA_Lobart_ORKPROBLEM_15_00"); //Mám problém se skâety.
	AI_Output			(self, other, "DIA_Lobart_ORKPROBLEM_05_01"); //(âve) Zatracenê. Copak to nikdy neskonèí?
	AI_Output			(self, other, "DIA_Lobart_ORKPROBLEM_05_02"); //Když to takhle pùjde dál, nebude mít moje farma hodnotu ani 3 zlatých.
	
	Log_CreateTopic (TOPIC_LobartsOrKProblem, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LobartsOrKProblem, LOG_RUNNING);
	B_LogEntry (TOPIC_LobartsOrKProblem,"Na Lobartovê statku se usadili skâeti. Mám je nêjak zahnat."); 

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Orksweg
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_ORKSWEG		(C_INFO)
{
	npc		 = 	BAU_950_Lobart;
	nr		 = 	42;
	condition	 = 	DIA_Lobart_ORKSWEG_Condition;
	information	 = 	DIA_Lobart_ORKSWEG_Info;

	description	 = 	"Vyhnal jsem ty skâety z tvého pozemku.";
};

func int DIA_Lobart_ORKSWEG_Condition ()
{
	if	(Npc_IsDead(OrcWarrior_Lobart1)	== TRUE)
	&&	(Npc_IsDead(OrcWarrior_Lobart2)	== TRUE)
	&&	(Npc_IsDead(OrcWarrior_Lobart3)	== TRUE)
	&&	(Npc_IsDead(OrcWarrior_Lobart4)	== TRUE)
	&&	(Npc_IsDead(OrcWarrior_Lobart5)	== TRUE)
	&&	(Npc_IsDead(OrcWarrior_Lobart6)	== TRUE)
	&& 	(Kapitel >= 4)
	&& 	((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG))
		{
				return TRUE;
		};
};

func void DIA_Lobart_ORKSWEG_Info ()
{
	AI_Output			(other, self, "DIA_Lobart_ORKSWEG_15_00"); //Vyhnal jsem ty skâety z tvého pozemku.
	if (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Lobart_ORKSWEG_05_01"); //Nedovol nikomu, aby o paladinech âíkal, že pro nás malé farmáâe nic nedêlají.
	};
	AI_Output			(self, other, "DIA_Lobart_ORKSWEG_05_02"); //Díky Innosovi. Nemùžu ti toho dát zrovna moc, ale doufám, že alespoà oceníš vyjádâení mé vdêènosti.
	
	B_StartOtherRoutine	(Vino,"Zaèít");
	B_StartOtherRoutine	(LobartsBauer1,"Zaèít");
	B_StartOtherRoutine	(LobartsBauer2,"Zaèít");
	
	TOPIC_END_LobartsOrKProblem = TRUE;
	B_GivePlayerXP (XP_KilledLobartOrks);
	CreateInvItems (self, ItMi_Gold, 150);									
	B_GiveInvItems (self, other, ItMi_Gold, 150);					
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Lobart_KAP5_EXIT(C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 999;
	condition	= DIA_Lobart_KAP5_EXIT_Condition;
	information	= DIA_Lobart_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lobart_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lobart_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Lobart_KAP6_EXIT(C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 999;
	condition	= DIA_Lobart_KAP6_EXIT_Condition;
	information	= DIA_Lobart_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lobart_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lobart_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Lobart_PICKPOCKET (C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 900;
	condition	= DIA_Lobart_PICKPOCKET_Condition;
	information	= DIA_Lobart_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Lobart_PICKPOCKET_Condition()
{
	C_Beklauen (65, 80);
};
 
FUNC VOID DIA_Lobart_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Lobart_PICKPOCKET);
	Info_AddChoice		(DIA_Lobart_PICKPOCKET, DIALOG_BACK 		,DIA_Lobart_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Lobart_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Lobart_PICKPOCKET_DoIt);
};

func void DIA_Lobart_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Lobart_PICKPOCKET);
};
	
func void DIA_Lobart_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Lobart_PICKPOCKET);
};




















































































