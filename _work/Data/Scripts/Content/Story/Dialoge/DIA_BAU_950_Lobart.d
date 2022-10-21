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
	// ------ SC hat R¸stung an ------
	
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	if (Hlp_IsItem (heroArmor, ItAr_BAU_L) == TRUE)
	{
		AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_05_00"); //NevÏ¯Ìm sv˝m oËÌm! Ten bastard se tu producÌruje v M›CH öatech!
	}	
	else
	{
		AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_05_01"); //Hej, ty!
		AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_05_02"); //Od t˝ doby, cos tu byl naposled, se mi ztratilo p·r vÏcÌ z mojÌ truhly!
	};
	
	// ------ SC hat nach Arbeit gefragt -------
	if (Npc_KnowsInfo (other, DIA_Lobart_WorkNOW))
	{
		AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_05_03"); //MÏl bys dÏlat nÏco uûiteËn˝ho, ne Ëmuchat kolem m˝ho domu, ty lÌnej mizero!
	};
	
	AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_05_04"); //OkamûitÏ mi vraù moje öaty!
	
	Info_ClearChoices	(DIA_Lobart_STOLENCLOTHS);
	Info_AddChoice		(DIA_Lobart_STOLENCLOTHS, "ZapomeÚ!", 				DIA_Lobart_STOLENCLOTHS_ForgetIt );
	if (Npc_HasItems (other, ItAr_BAU_L) > 0)
	{
		Info_AddChoice		(DIA_Lobart_STOLENCLOTHS, "Tady, vezmi si je zp·tky.", 	DIA_Lobart_STOLENCLOTHS_HereYouGo );
	}
	else
	{
		Info_AddChoice		(DIA_Lobart_STOLENCLOTHS, "Uû je nem·m.", 	DIA_Lobart_STOLENCLOTHS_DontHaveIt );
	};
};
	
func void DIA_Lobart_STOLENCLOTHS_HereYouGo ()
{
	AI_Output (other, self, "DIA_Lobart_STOLENCLOTHS_HereYouGo_15_00"); //Tady, vezmi si je zp·tky.
	AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_HereYouGo_05_01"); //Pokud je chceö, m˘ûeö za nÏ taky ZAPLATIT!
	AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_HereYouGo_05_02"); //(odmÏ¯enÏ) TeÔ bÏû dÏlat nÏco uûiteËn˝ho!
	
	B_GiveInvItems (other, self, ItAr_BAU_L, 1);
	
	Info_ClearChoices	(DIA_Lobart_STOLENCLOTHS);
};

func void DIA_Lobart_STOLENCLOTHS_DontHaveIt ()
{
	AI_Output (other, self, "DIA_Lobart_STOLENCLOTHS_DontHaveIt_15_00"); //Uû je nem·m.
	AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_DontHaveIt_05_01"); //Prodals je, co? (¯ve) J· ti uk·ûu, ty smrk·Ëi!
	
	Lobart_Kleidung_gestohlen = TRUE;
	AI_StopProcessInfos (self);	
	B_Attack (self, other, AR_Theft, 1); 
};
	
func void DIA_Lobart_STOLENCLOTHS_ForgetIt ()
{
	AI_Output (other, self, "DIA_Lobart_STOLENCLOTHS_ForgetIt_15_00"); //ZapomeÚ!
	AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_ForgetIt_05_01"); //(¯ve) J· ti uk·ûu, mladÌku!
	
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
		AI_Output (self, other, "DIA_Lobart_Hallo_05_00"); //Co otravujeö na m˝m pozemku?
		AI_Output (self, other, "DIA_Lobart_Hallo_05_01"); //(zkoumavÏ) Na ËÌ stranÏ jsi? Vzbou¯enc˘, nebo kr·le?
	
		Info_ClearChoices	(DIA_Lobart_Hallo);
		Info_AddChoice		(DIA_Lobart_Hallo, "NerozumÌm...", DIA_Lobart_Hallo_What );
		Info_AddChoice		(DIA_Lobart_Hallo, "Jsem na kr·lovÏ stranÏ!", 		DIA_Lobart_Hallo_ForTheKing );
		Info_AddChoice		(DIA_Lobart_Hallo, "Jsem s rolnÌky!",		DIA_Lobart_Hallo_ForThePeasants );
	}
	else
	{
		AI_Output (self, other, "DIA_Lobart_Hallo_05_02"); //Co pro tebe m˘ûu udÏlat?
	};
};

func void DIA_Lobart_Hallo_ForThePeasants()
{
	AI_Output (other, self, "DIA_Lobart_Hallo_ForThePeasants_15_00"); //Jsem s rolnÌky!
	AI_Output (self, other, "DIA_Lobart_Hallo_ForThePeasants_05_01"); //Ha! Ten zpropadenej ötv·Ë Onar n·s dostane vöechny do hrobu!
	AI_Output (self, other, "DIA_Lobart_Hallo_ForThePeasants_05_02"); //Co myslÌö, jak dlouho budou jeötÏ paladinovÈ jen tak st·t a p¯ihlÌûet?
	AI_Output (self, other, "DIA_Lobart_Hallo_ForThePeasants_05_03"); //Po tom, co Onar provedl, je cel˝ mÏsto vzh˘ru nohama.

	Lobart_AgainstKing = TRUE;
	Info_ClearChoices	(DIA_Lobart_Hallo);
};

func void DIA_Lobart_Hallo_ForTheKing()
{
	AI_Output (other, self, "DIA_Lobart_Hallo_ForTheKing_15_00"); //Jsem na kr·lovÏ stranÏ!
	AI_Output (self, other, "DIA_Lobart_Hallo_ForTheKing_05_01"); //(pohrdavÏ) 'Na kr·lovÏ stranÏ!' To sam˝ ¯Ìkali voj·ci z domobrany, kdyû mi vzali p˘lku m˝ch ovcÌ.
	AI_Output (self, other, "DIA_Lobart_Hallo_ForTheKing_05_02"); //Ale kde jsou ti bastardi, kdyû si na n·s doöl·pnou banditi? A kde asi tak budou, aû n·s napadnou sk¯eti?
	AI_Output (self, other, "DIA_Lobart_Hallo_ForTheKing_05_03"); //J· ti ¯eknu kde: ve mÏstÏ, za öirok˝ma hradbama.
	AI_Output (self, other, "DIA_Lobart_Hallo_ForTheKing_05_04"); //Tak mÏ s tÌm sv˝m kr·lem neotravuj.
	
	Lobart_AgainstKing = FALSE;
	Info_ClearChoices	(DIA_Lobart_Hallo);
};

func void DIA_Lobart_Hallo_What()
{
	AI_Output (other, self, "DIA_Lobart_Hallo_What_15_00"); //NerozumÌm...
	AI_Output (self, other, "DIA_Lobart_Hallo_What_05_01"); //Co?! Nezahr·vej si se mnou, hochu! Chci vÏdÏt, na ËÌ stranÏ jsi! Tak pro koho jsi?!
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
	description	= "Pot¯ebuju nÏjakÈ vhodnÈ öaty!";
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
	AI_Output (other, self, "DIA_Lobart_KLEIDUNG_15_00"); //Pot¯ebuju nÏjakÈ vhodnÈ öaty!
	AI_Output (self, other, "DIA_Lobart_KLEIDUNG_05_01"); //M˘ûu ti d·t Ëist˝ farm·¯sk˝ pracovnÌ odÏv.
	AI_Output (self, other, "DIA_Lobart_KLEIDUNG_05_02"); //A m˘ûeö za nÏj zaplatit?
	
			Log_CreateTopic (TOPIC_Kleidung,LOG_MISSION);  
			Log_SetTopicStatus  (TOPIC_Kleidung,LOG_RUNNING);  
			B_LogEntry (TOPIC_Kleidung,"Sedl·k Lobart mi prod· pracovnÌ odÏv.");
			  
		
	if (! Npc_KnowsInfo(other, 	DIA_Lobart_WorkNOW))
	{
		AI_Output (self, other, "DIA_Lobart_KLEIDUNG_05_03"); //M˘ûeö si Ë·st ceny odpracovat. Pokud teda HLED¡ä pr·ci.
		B_LogEntry (TOPIC_Kleidung,"»·st ceny si mohu odpracovat na statku. »Ìm vÌc pr·ce odvedu, tÌm mÈnÏ mÏ ty öaty budou st·t.");

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
	description	= "Kolik za ty pracovnÌ öaty chceö?";
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
	
	AI_Output (other, self, "DIA_Lobart_BuyClothes_15_00"); //Kolik za ty pracovnÌ öaty chceö?
	AI_Output (self, other, "DIA_Lobart_BuyClothes_05_01"); //Dobr·, takûe...
	
	if (Lobart_AgainstKing == TRUE)
	{
		//stillschweigender Abzug
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};
	
	if (MIS_Lobart_Rueben == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Lobart_BuyClothes_05_02"); //Pracoval jsi pro mÏ na poli.
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};
	
	if (MIS_Hilda_PfanneKaufen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Lobart_BuyClothes_05_03"); //Pomohl jsi mÈ ûenÏ.
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};
	
	if (MIS_Vino_Wein == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Lobart_BuyClothes_05_04"); //Vino ¯Ìkal, ûes mu opravdu pomohl. A to uû nÏco znamen· - ne pokaûdÈ drûÌ s n·denÌky.
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};
	
	if (MIS_Maleth_Bandits == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Lobart_BuyClothes_05_05"); //Maleth ¯Ìkal, ûes zahnal bandity. Ti bastardi n·m zp˘sobili hodnÏ potÌûÌ. DÌky, ûes je odstranil z cesty!
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};

	// ------------------------------
	// ------ Wert der R¸stung ------
	// ------------------------------
		B_Say_Gold (self, other, Wert_LobartsRuestung);
		
		if (Wert_LobartsRuestung == 30) 
		{
			AI_Output (self, other, "DIA_Lobart_GOLD_05_06"); //LevnÏjöÌ uû to nebude.
			B_LogEntry (TOPIC_Kleidung,"Ale neprod· mi je za mÈnÏ neû 30 zlaù·k˘.");
		};

	Info_ClearChoices	(DIA_Lobart_BuyClothes);
	Info_AddChoice		(DIA_Lobart_BuyClothes, "To je moc drahÈ.", DIA_Lobart_BuyClothes_NotYet );
	Info_AddChoice		(DIA_Lobart_BuyClothes, "Dej mi ty pracovnÌ öaty. (Ochrana: zbranÏ 15, öÌpy 15)", DIA_Lobart_BuyClothes_BUY );
};

func void DIA_Lobart_BuyClothes_BUY()
{
	AI_Output (other, self, "DIA_Lobart_BuyClothes_BUY_15_00"); //Tak to mi ty öaty dej.
	
	if (B_GiveInvItems (other, self, ItMi_gold, Wert_LobartsRuestung))
	{
		if (Npc_HasItems(self,ItAr_BAU_L) > 0)
		{
			AI_Output (self, other, "DIA_Lobart_BuyClothes_BUY_05_01"); //Fajn, chlapËe. S poctivostÌ nejd·l dojdeö. Tady je m·ö!
			
			B_GiveInvItems (self, other, ItAr_BAU_L, 1);
		}
		else 
		{
			AI_Output (self, other, "DIA_Lobart_BuyClothes_BUY_05_02"); //V mÈm domÏ je truhla, ve kterÈ najdeö Ëist˝ odÏv.
			AI_Output (self, other, "DIA_Lobart_BuyClothes_BUY_05_03"); //Ale ani nepomysli na to, ûe by sis bez opt·nÌ vzal cokoli dalöÌho!
		};
		
		Lobart_Kleidung_Verkauft = TRUE;
		Wld_AssignRoomToGuild ("farm03", GIL_NONE);  	//Schlaf Raum
				
		B_CheckLog ();
	}
	else //nicht genug Gold
	{
		AI_Output (self, other, "DIA_Lobart_BuyClothes_BUY_05_04"); //Nem·ö dost zlata!
	};
	
	Info_ClearChoices	(DIA_Lobart_BuyClothes);
};

func void DIA_Lobart_BuyClothes_NotYet()
{
	AI_Output (other, self, "DIA_Lobart_BuyClothes_NotYet_15_00"); //To je moc drahÈ.
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
	AI_Output (self, other, "DIA_Lobart_AufstandInfo_05_01"); //Jak, jinak? Hochu, ODKUD jsi? Jsme na pokraji obËanskÈ v·lky!

	if 	(hero.guild == GIL_NONE)
	 {
		AI_Output (self, other, "DIA_Lobart_AufstandInfo_05_02"); //Aû doteÔ pohlÌûeli vöichni farm·¯i na odvody mÏstu jako na spravedlivou formu zdanÏnÌ.
		AI_Output (self, other, "DIA_Lobart_AufstandInfo_05_03"); //Ale od tÈ doby, co jsou v Khorinidu paladinovÈ, n·s voj·ci z domobrany navötÏvujÌ ËÌm d·l tÌm ËastÏjc a uû si pomalu berou ˙plnÏ vöechno.
		AI_Output (self, other, "DIA_Lobart_AufstandInfo_05_04"); //Jestli to tak p˘jde d·l, nic uû n·m nezbude.
	 };

	AI_Output (self, other, "DIA_Lobart_AufstandInfo_05_05"); //NÏkte¯Ì farm·¯i se zaËali bou¯it. Onar byl prvnÌ!
};

///////////////////////////////////////////////////////////////////////
//	Mehr ¸ber Onar
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_OnarStory (C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 1;
	condition	= DIA_Lobart_OnarStory_Condition;
	information	= DIA_Lobart_OnarStory_Info;
	permanent 	= FALSE;
	description	= "PovÏz mi nÏco o tom Onarovi.";
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
	AI_Output (other, self, "DIA_Lobart_OnarStory_15_00"); //ÿekni mi nÏco o tom Onarovi.

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Lobart_OnarStory_05_01"); //Ty jsi ûold·k, ne? Tak co bych ti mÏl dalöÌho ¯Ìkat o tvÈm öÈfovi?
		}
		else
		{
			AI_Output (self, other, "DIA_Lobart_OnarStory_05_02"); //Onar je nejvÏtöÌ farm·¯ v okolÌ. Odtrhl se od mÏsta.
			AI_Output (self, other, "DIA_Lobart_OnarStory_05_03"); //ÿÌk· se, ûe si najal ûold·ky, aby udrûel domobranu na uzdÏ!
			AI_Output (self, other, "DIA_Lobart_OnarStory_05_04"); //NenÌ se mu co divit.
			AI_Output (self, other, "DIA_Lobart_OnarStory_05_05"); //V kaûdÈm p¯ÌpadÏ se na jeho farmu uû û·dn˝ kr·lovsk˝ voj·k neodv·ûÌ vstoupit.
		};
};

///////////////////////////////////////////////////////////////////////
//	Mehr ¸ber Sˆldner
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_SldInfo (C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 1;
	condition	= DIA_Lobart_SldInfo_Condition;
	information	= DIA_Lobart_SldInfo_Info;
	permanent 	= FALSE;
	description	= "Kdo jsou ti ûoldnÈ¯i, co si Onar najal?";
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
	AI_Output (other, self, "DIA_Lobart_SldInfo_15_00"); //Kdo jsou ti ûoldnÈ¯i, co si Onar najal?
	AI_Output (self, other, "DIA_Lobart_SldInfo_05_01"); //O tÏch chlapech toho moc nevÌm. ⁄dajnÏ jsou to vÏtöinou b˝valÌ vÏzÚovÈ z trestaneckÈ kolonie.
	AI_Output (self, other, "DIA_Lobart_SldInfo_05_02"); //(opovrûlivÏ) Vöichni moc dob¯e vÏdÌ, co se od nich d· oËek·vat.
};

///////////////////////////////////////////////////////////////////////
//	F¸r wen bist du?
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_WhichSide (C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 1;
	condition	= DIA_Lobart_WhichSide_Condition;
	information	= DIA_Lobart_WhichSide_Info;
	permanent 	= FALSE;
	description	= "Na ËÌ stranÏ stojÌö? Jsi se sedl·ky, nebo s kr·lem?";
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
	AI_Output (other, self, "DIA_Lobart_WhichSide_15_00"); //A co ty? Na ËÌ stranÏ jsi? RolnÌci, nebo kr·l?
	AI_Output (self, other, "DIA_Lobart_WhichSide_05_01"); //Jsem p¯Ìliö blÌzko mÏstu, neû abych mÏl na v˝bÏr.
	AI_Output (self, other, "DIA_Lobart_WhichSide_05_02"); //Ale j· jsem vlastnÏ r·d. NevÏdÏl bych, jak se rozhodnout.
	
	if (hero.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Lobart_WhichSide_05_03"); //Kr·l n·s vys·v· a Onar posÌl· sv˝ ûold·ky na kaûd˝ho, kdo se k nÏmu odmÌtl p¯idat.
		AI_Output (self, other, "DIA_Lobart_WhichSide_05_04"); //To je taky d˘vod, proË se vÏtöina ostatnÌch farm·¯˘ jeötÏ nerozhodla. Ale d¯Ìve Ëi pozdÏji se budou muset k jednÈ stranÏ p¯idat.
	};
};


///////////////////////////////////////////////////////////////////////
//	*** MISSION: R¸ben ziehen ***
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_WorkNOW (C_INFO)
{
	npc			= BAU_950_Lobart;
	nr			= 1;
	condition	= DIA_Lobart_WorkNOW_Condition;
	information	= DIA_Lobart_WorkNOW_Info;
	permanent 	= FALSE;
	description	= "Hled·m pr·ci.";
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
	AI_Output (other, self, "DIA_Lobart_WorkNOW_15_00"); //Hled·m pr·ci.
	AI_Output (self, other, "DIA_Lobart_WorkNOW_05_01"); //DalöÌho rolnÌka uû nem˘ûu pot¯ebovat. Ale m˘ûu ti nabÌdnout pr·ci n·denÌka.
	AI_Output (self, other, "DIA_Lobart_WorkNOW_05_02"); //TÌm myslÌm, ûe m˘ûeö p¯iloûit ruku k dÌlu na poli. A taky se urËitÏ najde p·r dalöÌch vÏcÌ, co se tu kolem musÌ udÏlat.

	if (hero.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Lobart_WorkNOW_05_03"); //M˘ûu ti zaplatit zlatem. Nebo ti d·m nÏjakÈ sluönÈ vÏci na sebe.
		AI_Output (self, other, "DIA_Lobart_WorkNOW_05_04"); //Ty vÏci docela stojÌ za to. Nem˘ûu ti je d·t zadarmo, ale m˘ûu ti je pak prodat se slevou.
			
		Log_CreateTopic (TOPIC_Kleidung,LOG_MISSION);  
		Log_SetTopicStatus  (TOPIC_Kleidung,LOG_RUNNING);  
		B_LogEntry (TOPIC_Kleidung,"Sedl·k Lobart mi m˘ûe prodat pracovnÌ odÏv. »·st ceny si mohu odpracovat na jeho statku - ËÌm vÌc pr·ce odvedu, tÌm mÈnÏ mÏ ty öaty budou st·t.");
			
		if (Npc_HasEquippedArmor(other) == FALSE)
		|| (Lobart_Kleidung_Verkauft == TRUE)
		{
			AI_Output (self, other, "DIA_Lobart_WorkNOW_05_05"); //Ale jak na tebe tak kouk·m, musÌm ¯Ìct: vezmi si ty öaty.
		}
		else
		{
			AI_Output (self, other, "DIA_Lobart_WorkNOW_05_06"); //Ale ty uû m·ö öaty, takûe asi budeö chtÌt zlato.
		};
	};

	AI_Output (self, other, "DIA_Lobart_WorkNOW_05_07"); //Takûe - ten tu¯Ìnov˝ z·hon za stodolou se musÌ sklidit.
	
	Info_ClearChoices	(DIA_Lobart_WorkNOW);
	Info_AddChoice		(DIA_Lobart_WorkNOW, "J· m·m tahat ze zemÏ tu¯Ìn? To si ze mÏ dÏl·ö srandu!", DIA_Lobart_WorkNOW_WannaFoolMe );
	Info_AddChoice		(DIA_Lobart_WorkNOW, "Dobr·.", DIA_Lobart_WorkNOW_Ok );
};

func void DIA_Lobart_WorkNOW_Ok()
{
	AI_Output (other, self, "DIA_Lobart_WorkNOW_Ok_15_00"); //Dobr·...

	if (hero.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Lobart_WorkNOW_Ok_05_01"); //Tak si s tÌm koukej pospÌöit, neû si to rozmyslÌm.
	};
	Log_CreateTopic (TOPIC_Rueben,LOG_MISSION);  
	Log_SetTopicStatus  (TOPIC_Rueben,LOG_RUNNING);  
	B_LogEntry (TOPIC_Rueben,"Sedl·k Lobart chce, abych mu z pole sklidil tu¯Ìny. Za odmÏnu dostanu p·r zlaù·k˘ a budu si u nÏj moci koupit oöacenÌ se slevou.");
	
	MIS_Lobart_Rueben = LOG_RUNNING;
	Info_ClearChoices	(DIA_Lobart_WorkNOW);
};

func void DIA_Lobart_WorkNOW_WannaFoolMe()
{
	AI_Output (other, self, "DIA_Lobart_WorkNOW_WannaFoolMe_15_00"); //J· m·m tahat ze zemÏ tu¯Ìn? To si musÌö dÏlat srandu!
	AI_Output (self, other, "DIA_Lobart_WorkNOW_WannaFoolMe_05_01"); //Po¯·dn· chlapsk· pr·ce nenÌ pro takov˝ho 'nafrnÏn˝ho dûentlmena', eh?

	if (hero.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Lobart_WorkNOW_WannaFoolMe_05_02"); //BuÔ vytahej ty tu¯Ìny ze zemÏ, nebo t·hni z mojÌ farmy!
	}
	else
	{
		AI_Output (self, other, "DIA_Lobart_WorkNOW_WannaFoolMe_05_03"); //Pr·vÏ teÔ pro tebe nem·m û·dnou dalöÌ pr·ci.
	};
	
	Log_CreateTopic (TOPIC_Rueben,LOG_MISSION);  
	Log_SetTopicStatus  (TOPIC_Rueben,LOG_RUNNING);  
	B_LogEntry (TOPIC_Rueben,"Sedl·k Lobart chce, abych mu z pole sklidil tu¯Ìny. Za odmÏnu dostanu p·r zlaù·k˘ a budu si u nÏj moci koupit oöacenÌ se slevou.");
	
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
	description	 = 	"Tady jsou tvoje tu¯Ìny!";
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
	AI_Output (other, self, "DIA_Lobart_RuebenRunning_15_00"); //Tady jsou tvoje tu¯Ìny!

	if (Npc_HasItems (other,ItPl_Beet) >= 20)
	{
		if (hero.guild == GIL_NONE)
			{
				AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_01"); //Hej, ty p¯ece jen nebudeö takovej darmoûrout.
			};

		if ((Npc_IsDead(Hilda))== FALSE)
		{
			AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_02"); //Dej je mÈ ûenÏ v kuchyni a ¯ekni jÌ, aù je uva¯Ì.
	
			MIS_Lobart_RuebenToHilda = LOG_RUNNING;
			Log_CreateTopic (TOPIC_Ruebenbringen,LOG_MISSION);
			Log_SetTopicStatus (TOPIC_Ruebenbringen,LOG_RUNNING);
			B_LogEntry (TOPIC_Ruebenbringen,"MusÌm ty tu¯Ìny doruËit do domu a p¯edat je LobartovÏ ûenÏ, kter· z nich nÏco dobrÈho uva¯Ì.");
		};
		
		MIS_Lobart_Rueben = LOG_SUCCESS;
		B_GivePlayerXP (XP_LobartHolRueben);
		 
	//	Log_SetTopicStatus(TOPIC_BauerLobart, LOG_SUCCESS); ALT
	//	Log_AddEntry (TOPIC_BauerLobart,"Ich habe Lobart seine R¸ben gebracht, er hat mich daf¸r entlohnt."); 
		
		AI_Output (other, self, "DIA_Lobart_RuebenRunning_15_03"); //A co moje mzda?
		AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_04"); //M˘ûu ti d·t 5 zlat˝ch.
		
		if (hero.guild == GIL_NONE)
			{
				AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_05"); //...nebo ti slevit z ceny tÏch öat˘. Tak co to bude?
			};
	
		Info_ClearChoices 	(DIA_Lobart_RuebenRunning);

		if (hero.guild == GIL_NONE)
			{
				Info_AddChoice		(DIA_Lobart_RuebenRunning, "Chci slevu na ty öaty!",	DIA_Lobart_RuebenRunning_Billiger );
			};

		Info_AddChoice		(DIA_Lobart_RuebenRunning, "Dej mi tÏch 5 zlat˝ch!", 		DIA_Lobart_RuebenRunning_Gold );

	}
	else
	{
		AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_06"); //Ale to nenÌ vöech 20!
		
		if (hero.guild == GIL_NONE)
			{
				AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_07"); //Jsi tady na dovolenÈ?! Douf·m, ûe ne, chlapËe, jinak m˘ûeö na svou mzdu zapomenout!
				AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_08"); //Vraù se tam a p¯ines jich vÌc! Mazej do pr·ce, nebo ti uk·ûu!
			};
		
		AI_StopProcessInfos (self);
	};
};

func void DIA_Lobart_RuebenRunning_Gold ()
{
	AI_Output (other, self, "DIA_Lobart_RuebenRunning_Gold_15_00"); //Dej mi tÏch 5 zlat˝ch!
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
	AI_Output (other, self, "DIA_Lobart_RuebenRunning_Billiger_15_00"); //Chci slevu na ty öaty!
	AI_Output (self, other, "DIA_Lobart_RuebenRunning_Billiger_05_01"); //Fajn! D·m ti je o 10 zlat˝ch levnÏjc.
	
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
	description	= "M·ö pro mÏ jeötÏ nÏjakou dalöÌ pr·ci?";
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
	AI_Output (other, self, "DIA_Lobart_MoreWork_15_00"); //M·ö pro mÏ jeötÏ nÏjakou dalöÌ pr·ci?
	
	if (MIS_Lobart_Rueben == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Lobart_MoreWork_05_01"); //Nejd¯Ìv skliÔ ty tu¯Ìny a pak se uvidÌ.
	}
	else //SUCCESS
	{
		AI_Output (self, other, "DIA_Lobart_MoreWork_05_02"); //J· ne, ale m˘ûeö se zeptat mÈ ûeny nebo chlap˘ na polÌch. T¯eba budou pot¯ebovat s nÏËÌm pomoct.
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
	description	 = 	"PosÌl· mÏ za tebou Andre.";
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
	AI_Output			(other, self, "DIA_Lobart_ANDREHELPLOBART_15_00"); //Andre mÏ poslal za tebou. M·ö pro mÏ nÏjakou pr·ci?
	AI_Output			(self, other, "DIA_Lobart_ANDREHELPLOBART_05_01"); //Jo, jasnÏ. Z tÏch zatracenejch polnÌch ök˘dc˘ uû se mi zved· kufr.
	AI_Output			(self, other, "DIA_Lobart_ANDREHELPLOBART_05_02"); //OddÏlej je vöechny. Je mi jedno jak!

	Log_AddEntry (TOPIC_BecomeMIL,"Lobartova pole suûujÌ polnÌ ök˘dci - m·m je vöechny zahnat."); 
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
	description	 = 	"ZatoËil jsem s tÏma vÏcma!";
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
			AI_Output			(other, self, "DIA_Lobart_BUGDEAD_15_00"); //ZatoËil jsem s tÏma vÏcma!
			AI_Output			(self, other, "DIA_Lobart_BUGDEAD_05_01"); //Dobr· pr·ce. Nejsi zas tak öpatnej deratiz·tor. DoporuËÌm tÏ soused˘m. Na opl·tku si vezmi tohle.
			
			B_StartOtherRoutine	(Vino,"Start");
			B_StartOtherRoutine	(LobartsBauer1,"Start");
			B_StartOtherRoutine	(LobartsBauer2,"Start");

			CreateInvItems (self, ItMi_Gold, 20);
			B_GiveInvItems (self, other, ItMi_Gold, 20);

			MIS_LobartKillBugs 	= LOG_SUCCESS;
			MIS_AndreHelpLobart = LOG_SUCCESS;
			Log_AddEntry (TOPIC_BecomeMIL,"PolnÌ ök˘dci uû nebudou Lobarta obtÏûovat - vöichni uû jsou pryË."); 
			DIA_Lobart_BUGDEAD_noPerm = TRUE;
		}
		else  
		{
			AI_Output			(other, self, "DIA_Lobart_BUGDEAD_15_02"); //ZatoËil jsem s tÏma vÏcma!
			AI_Output			(self, other, "DIA_Lobart_BUGDEAD_05_03"); //Nepokouöej si ze mÏ dÏlat bl·zny. Po¯·d je tam vidÌm. BuÔ ty zvÌ¯ata zabijeö, nebo na celou tu vÏc zapomeÚ.
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
	AI_Output			(self, other, "DIA_Lobart_DMT_05_01"); //Uû se to ned· vydrûet.
	AI_Output			(self, other, "DIA_Lobart_DMT_05_02"); //Najednou se tu objevili ti chl·pci v Ëern˝ch k·pÌch a post·vajÌ u cesty a u mojÌ farmy.


	Info_ClearChoices	(DIA_Lobart_DMT);

	Info_AddChoice	(DIA_Lobart_DMT, DIALOG_ENDE, DIA_Lobart_DMT_BACK );

	if (hero.guild == GIL_KDF)
	&& (Vino_isAlive_Kap3 == TRUE)
		{
		AI_Output			(self, other, "DIA_Lobart_DMT_05_03"); //Nejd¯Ìv hroznÏ dlouho mluvili s Vinem a pak zmizeli i s nÌm.

			if (NpcObsessedByDMT_Vino == FALSE)
			{
			Info_AddChoice	(DIA_Lobart_DMT, "Kam odvlekli Vina?", DIA_Lobart_DMT_VinoWohin );
			};
			Info_AddChoice	(DIA_Lobart_DMT, "Co mÏli za köefty s Vinem?", DIA_Lobart_DMT_VinoWas );
		};

	if ((Npc_IsDead(Hilda))== FALSE)
	&& ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)	||	(hero.guild == GIL_KDF))
	{
		AI_Output			(self, other, "DIA_Lobart_DMT_05_04"); //Moje ûena zase onemocnÏla. Uû moc dlouho jenom leûÌ v posteli. St·v· se jÌ to docela Ëasto.
	};

	AI_Output			(self, other, "DIA_Lobart_DMT_05_05"); //J· uû se z toho sloûÌm!

	if (MIS_HealHilda != LOG_SUCCESS)
	&& ((Npc_IsDead(Hilda)) == FALSE)
	&& ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)	||	(hero.guild == GIL_KDF))
	{
		Info_AddChoice	(DIA_Lobart_DMT, "ProË svou ûenu nevezmeö k lÈËiteli?", DIA_Lobart_DMT_FrauHeilen );
	};

	Info_AddChoice	(DIA_Lobart_DMT, "ProË s tÏmi Ëernokab·tnÌky nÏco neudÏl·ö?", DIA_Lobart_DMT_hof );
	Info_AddChoice	(DIA_Lobart_DMT, "Mluvil jsi s tÏmi muûi v ËernÈm?", DIA_Lobart_DMT_spokeToThem );
	
};
func void DIA_Lobart_DMT_FrauHeilen ()
{
	AI_Output			(other, self, "DIA_Lobart_DMT_FrauHeilen_15_00"); //ProË svou ûenu nevezmeö k lÈËiteli?
	AI_Output			(self, other, "DIA_Lobart_DMT_FrauHeilen_05_01"); //MÏli bychom zajÌt do mÏsta za Vatrasem, ale nem˘ûu vyt·hnout paty z domu, dokud se to tu nÏjak neurovn·.
	
	Log_CreateTopic (TOPIC_HealHilda, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HealHilda, LOG_RUNNING);
	B_LogEntry (TOPIC_HealHilda,"LobartovÏ ûenÏ HildÏ je öpatnÏ, ale Vatras by pro ni mÏl mÌt nÏjak˝ lÈk."); 

	MIS_HealHilda = LOG_RUNNING;	
};

func void DIA_Lobart_DMT_BACK ()
{
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start"); 
};

func void DIA_Lobart_DMT_spokeToThem ()
{
	AI_Output			(other, self, "DIA_Lobart_DMT_spokeToThem_15_00"); //Mluvil jsi s tÏmi muûi v ËernÈm?
	AI_Output			(self, other, "DIA_Lobart_DMT_spokeToThem_05_01"); //JasnÏ. Tomu se nejde vyhnout.
	AI_Output			(self, other, "DIA_Lobart_DMT_spokeToThem_05_02"); //M·m dojem, ûe nÏkoho hledajÌ.
};

func void DIA_Lobart_DMT_hof ()
{
	AI_Output			(other, self, "DIA_Lobart_DMT_hof_15_00"); //ProË s tÏmi Ëernokab·tnÌky nÏco neudÏl·ö?
	AI_Output			(self, other, "DIA_Lobart_DMT_hof_05_01"); //V·ûnÏ bych r·d. Ale vidÏl jsem, jak jednoho ËlovÏka z mÏsta up·lili zaûiva. Jenom tak.
	AI_Output			(self, other, "DIA_Lobart_DMT_hof_05_02"); //ProË bych mÏl riskovat ûivot?
};

func void DIA_Lobart_DMT_VinoWas ()
{
	AI_Output			(other, self, "DIA_Lobart_DMT_VinoWas_15_00"); //Co mÏli za köefty s Vinem?
	AI_Output			(self, other, "DIA_Lobart_DMT_VinoWas_05_01"); //To ne¯Ìkal. ProstÏ ho vzali s sebou.
};

func void DIA_Lobart_DMT_VinoWohin ()
{
	AI_Output			(other, self, "DIA_Lobart_DMT_VinoWohin_15_00"); //Kam odvlekli Vina?
	AI_Output			(self, other, "DIA_Lobart_DMT_VinoWohin_05_01"); //Odeöli s nÌm do hor.
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

	description	 = 	"Vino se uû nevr·tÌ.";
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
	AI_Output			(other, self, "DIA_Lobart_VINOTOT_15_00"); //Vino se uû nevr·tÌ.

	if (Npc_IsDead(Vino))	
	{
		AI_Output			(other, self, "DIA_Lobart_VINOTOT_15_01"); //Je mrtv˝.
	}
	else
	{
		AI_Output			(other, self, "DIA_Lobart_VINOTOT_15_02"); //P¯ivedli ho k öÌlenstvÌ.
	};
	
	AI_Output			(self, other, "DIA_Lobart_VINOTOT_05_03"); //U Innose. Doufejme, ûe ta noËnÌ m˘ra uû brzy skonËÌ.
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

	description	 = 	"D·vej na svou farmu pozor!";
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
	AI_Output			(other, self, "DIA_Lobart_PERM_15_00"); //D·vej na svou farmu pozor!
	AI_Output			(self, other, "DIA_Lobart_PERM_05_01"); //PokusÌm se.
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

	description	 = 	"M·m problÈm se sk¯ety.";
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
	AI_Output			(other, self, "DIA_Lobart_ORKPROBLEM_15_00"); //M·m problÈm se sk¯ety.
	AI_Output			(self, other, "DIA_Lobart_ORKPROBLEM_05_01"); //(¯ve) ZatracenÏ. Copak to nikdy neskonËÌ?
	AI_Output			(self, other, "DIA_Lobart_ORKPROBLEM_05_02"); //Kdyû to takhle p˘jde d·l, nebude mÌt moje farma hodnotu ani 3 zlat˝ch.
	
	Log_CreateTopic (TOPIC_LobartsOrKProblem, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LobartsOrKProblem, LOG_RUNNING);
	B_LogEntry (TOPIC_LobartsOrKProblem,"Na LobartovÏ statku se usadili sk¯eti. M·m je nÏjak zahnat."); 

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

	description	 = 	"Vyhnal jsem ty sk¯ety z tvÈho pozemku.";
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
	AI_Output			(other, self, "DIA_Lobart_ORKSWEG_15_00"); //Vyhnal jsem ty sk¯ety z tvÈho pozemku.
	if (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Lobart_ORKSWEG_05_01"); //Nedovol nikomu, aby o paladinech ¯Ìkal, ûe pro n·s malÈ farm·¯e nic nedÏlajÌ.
	};
	AI_Output			(self, other, "DIA_Lobart_ORKSWEG_05_02"); //DÌky Innosovi. Nem˘ûu ti toho d·t zrovna moc, ale douf·m, ûe alespoÚ ocenÌö vyj·d¯enÌ mÈ vdÏËnosti.
	
	B_StartOtherRoutine	(Vino,"Start");
	B_StartOtherRoutine	(LobartsBauer1,"Start");
	B_StartOtherRoutine	(LobartsBauer2,"Start");
	
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




















































































