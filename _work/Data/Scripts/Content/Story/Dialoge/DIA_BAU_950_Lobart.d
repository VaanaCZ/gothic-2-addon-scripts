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
		AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_05_00"); //Ich glaubs ja nicht! Der Mistkerl rennt mit MEINEN Klamotten rum!
	}	
	else
	{
		AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_05_01"); //Hey du!
		AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_05_02"); //Seit du das letzte Mal hier warst, fehlen ein paar Sachen aus meiner Truhe!
	};
	
	// ------ SC hat nach Arbeit gefragt -------
	if (Npc_KnowsInfo (other, DIA_Lobart_WorkNOW))
	{
		AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_05_03"); //Du solltest dich hier nützlich machen und nicht in meinem Haus rumschnüffeln, du Tagedieb!
	};
	
	AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_05_04"); //Du gibst mir auf der Stelle meine Klamotten wieder!
	
	Info_ClearChoices	(DIA_Lobart_STOLENCLOTHS);
	Info_AddChoice		(DIA_Lobart_STOLENCLOTHS, "Vergiß es!", 				DIA_Lobart_STOLENCLOTHS_ForgetIt );
	if (Npc_HasItems (other, ItAr_BAU_L) > 0)
	{
		Info_AddChoice		(DIA_Lobart_STOLENCLOTHS, "Hier hast du sie wieder.", 	DIA_Lobart_STOLENCLOTHS_HereYouGo );
	}
	else
	{
		Info_AddChoice		(DIA_Lobart_STOLENCLOTHS, "Ich habe sie nicht mehr.", 	DIA_Lobart_STOLENCLOTHS_DontHaveIt );
	};
};
	
func void DIA_Lobart_STOLENCLOTHS_HereYouGo ()
{
	AI_Output (other, self, "DIA_Lobart_STOLENCLOTHS_HereYouGo_15_00"); //Hier hast du sie wieder.
	AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_HereYouGo_05_01"); //Wenn du sie haben willst, musst du dafür BEZAHLEN!
	AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_HereYouGo_05_02"); //(schroff) Jetzt sieh zu, dass du dich nützlich machst!
	
	B_GiveInvItems (other, self, ItAr_BAU_L, 1);
	
	Info_ClearChoices	(DIA_Lobart_STOLENCLOTHS);
};

func void DIA_Lobart_STOLENCLOTHS_DontHaveIt ()
{
	AI_Output (other, self, "DIA_Lobart_STOLENCLOTHS_DontHaveIt_15_00"); //Ich habe sie nicht mehr.
	AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_DontHaveIt_05_01"); //Hast sie wohl schon verkauft, was? (poltert) Ich werd dir helfen, Bürschchen!
	
	Lobart_Kleidung_gestohlen = TRUE;
	AI_StopProcessInfos (self);	
	B_Attack (self, other, AR_Theft, 1); 
};
	
func void DIA_Lobart_STOLENCLOTHS_ForgetIt ()
{
	AI_Output (other, self, "DIA_Lobart_STOLENCLOTHS_ForgetIt_15_00"); //Vergiss es!
	AI_Output (self, other, "DIA_Lobart_STOLENCLOTHS_ForgetIt_05_01"); //(poltert) Ich werd dir helfen, Bürschchen!
	
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
		AI_Output (self, other, "DIA_Lobart_Hallo_05_00"); //Warum treibst du dich hier auf meinem Land rum?
		AI_Output (self, other, "DIA_Lobart_Hallo_05_01"); //(abschätzend) Für wen bist du? Für die aufständischen Bauern oder für den König?
	
		Info_ClearChoices	(DIA_Lobart_Hallo);
		Info_AddChoice		(DIA_Lobart_Hallo, "Ich verstehe nicht...", DIA_Lobart_Hallo_What );
		Info_AddChoice		(DIA_Lobart_Hallo, "Für den König!", 		DIA_Lobart_Hallo_ForTheKing );
		Info_AddChoice		(DIA_Lobart_Hallo, "Für die Bauern!",		DIA_Lobart_Hallo_ForThePeasants );
	}
	else
	{
		AI_Output (self, other, "DIA_Lobart_Hallo_05_02"); //Was kann ich für dich tun?
	};
};

func void DIA_Lobart_Hallo_ForThePeasants()
{
	AI_Output (other, self, "DIA_Lobart_Hallo_ForThePeasants_15_00"); //Für die Bauern!
	AI_Output (self, other, "DIA_Lobart_Hallo_ForThePeasants_05_01"); //Ha! Onar, dieser verdammte Kriegstreiber, bringt uns noch alle ins Grab!
	AI_Output (self, other, "DIA_Lobart_Hallo_ForThePeasants_05_02"); //Was glaubst du, wie lange sich die Paladine das ansehen?
	AI_Output (self, other, "DIA_Lobart_Hallo_ForThePeasants_05_03"); //Nach dem, was Onar sich geleistet hat, ist die ganze Stadt in Aufruhr.

	Lobart_AgainstKing = TRUE;
	Info_ClearChoices	(DIA_Lobart_Hallo);
};

func void DIA_Lobart_Hallo_ForTheKing()
{
	AI_Output (other, self, "DIA_Lobart_Hallo_ForTheKing_15_00"); //Für den König!
	AI_Output (self, other, "DIA_Lobart_Hallo_ForTheKing_05_01"); //(verächtlich) 'Für den König!' Das haben die Stadtwachen gesagt, als sie die Hälfte meiner Schafe geholt haben.
	AI_Output (self, other, "DIA_Lobart_Hallo_ForTheKing_05_02"); //Aber wo sind die Drecksäcke, wenn wir uns die Banditen vom Hals halten müssen? Wo werden sie sein, wenn uns die Orks überrennen?
	AI_Output (self, other, "DIA_Lobart_Hallo_ForTheKing_05_03"); //Ich werd's dir sagen: In der Stadt, hinter den dicken Mauern.
	AI_Output (self, other, "DIA_Lobart_Hallo_ForTheKing_05_04"); //Also hör mir auf mit dem König.
	
	Lobart_AgainstKing = FALSE;
	Info_ClearChoices	(DIA_Lobart_Hallo);
};

func void DIA_Lobart_Hallo_What()
{
	AI_Output (other, self, "DIA_Lobart_Hallo_What_15_00"); //Ich verstehe nicht ...
	AI_Output (self, other, "DIA_Lobart_Hallo_What_05_01"); //Was?! Verarsch mich nicht, Junge! Ich will wissen, wo du stehst! Also, für wen bist du?!
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
	description	= "Ich brauche vernünftige Kleidung!";
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
	AI_Output (other, self, "DIA_Lobart_KLEIDUNG_15_00"); //Ich brauche vernünftige Kleidung!
	AI_Output (self, other, "DIA_Lobart_KLEIDUNG_05_01"); //Ich kann dir saubere Landarbeiterkleidung geben.
	AI_Output (self, other, "DIA_Lobart_KLEIDUNG_05_02"); //Kannst du sie denn bezahlen?
	
			Log_CreateTopic (TOPIC_Kleidung,LOG_MISSION);  
			Log_SetTopicStatus  (TOPIC_Kleidung,LOG_RUNNING);  
			B_LogEntry (TOPIC_Kleidung,"Der Bauer Lobart ist bereit, mir Arbeiterkleidung zu verkaufen.");
			  
		
	if (! Npc_KnowsInfo(other, 	DIA_Lobart_WorkNOW))
	{
		AI_Output (self, other, "DIA_Lobart_KLEIDUNG_05_03"); //Du könntest einen Teil des Preises abarbeiten ... falls du jemand bist, der Arbeit SUCHT.
		B_LogEntry (TOPIC_Kleidung,"Ich kann einen Teil des Preises auf seinem Hof abarbeiten. Je mehr ich arbeite, desto billiger wird die Kleidung.");

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
	description	= "Was kostet die Landarbeiterkleidung?";
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
	
	AI_Output (other, self, "DIA_Lobart_BuyClothes_15_00"); //Was kostet die Landarbeiterkleidung?
	AI_Output (self, other, "DIA_Lobart_BuyClothes_05_01"); //Tja, mal sehen ...
	
	if (Lobart_AgainstKing == TRUE)
	{
		//stillschweigender Abzug
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};
	
	if (MIS_Lobart_Rueben == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Lobart_BuyClothes_05_02"); //Du hast für mich die Feldarbeit gemacht.
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};
	
	if (MIS_Hilda_PfanneKaufen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Lobart_BuyClothes_05_03"); //Du bist meiner Frau zur Hand gegangen.
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};
	
	if (MIS_Vino_Wein == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Lobart_BuyClothes_05_04"); //Vino sagt, du warst ihm eine echte Hilfe. Ich meine, das will schon was heißen - er hält sonst nichts von Tagelöhnern.
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};
	
	if (MIS_Maleth_Bandits == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Lobart_BuyClothes_05_05"); //Maleth sagt, du hast uns die Banditen vom Hals geschafft. Die Mistkerle haben uns 'ne Menge Ärger gemacht. Dank dir sind wir sie jetzt los!
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};

	// ------------------------------
	// ------ Wert der Rüstung ------
	// ------------------------------
		B_Say_Gold (self, other, Wert_LobartsRuestung);
		
		if (Wert_LobartsRuestung == 30) 
		{
			AI_Output (self, other, "DIA_Lobart_GOLD_05_06"); //Billiger wird sie nicht.
			B_LogEntry (TOPIC_Kleidung,"Für weniger als 30 Goldstücke, wird er sie mir allerdings nicht verkaufen.");
		};

	Info_ClearChoices	(DIA_Lobart_BuyClothes);
	Info_AddChoice		(DIA_Lobart_BuyClothes, "Ist mir noch zu teuer.", DIA_Lobart_BuyClothes_NotYet );
	Info_AddChoice		(DIA_Lobart_BuyClothes, "Gib mir die Arbeiterkleidung (Schutz: Waffen 15, Pfeile 15)", DIA_Lobart_BuyClothes_BUY );
};

func void DIA_Lobart_BuyClothes_BUY()
{
	AI_Output (other, self, "DIA_Lobart_BuyClothes_BUY_15_00"); //Gib mir die Arbeiterkleidung.
	
	if (B_GiveInvItems (other, self, ItMi_gold, Wert_LobartsRuestung))
	{
		if (Npc_HasItems(self,ItAr_BAU_L) > 0)
		{
			AI_Output (self, other, "DIA_Lobart_BuyClothes_BUY_05_01"); //Tja, mein Junge. Ehrlich währt am längsten! Hier hast du sie!
			
			B_GiveInvItems (self, other, ItAr_BAU_L, 1);
		}
		else 
		{
			AI_Output (self, other, "DIA_Lobart_BuyClothes_BUY_05_02"); //In meinem Haus steht eine Truhe, da findest du saubere Sachen.
			AI_Output (self, other, "DIA_Lobart_BuyClothes_BUY_05_03"); //Aber lass dir bloß nicht einfallen, noch was anderes zu nehmen, ohne zu fragen!
		};
		
		Lobart_Kleidung_Verkauft = TRUE;
		Wld_AssignRoomToGuild ("farm03", GIL_NONE);  	//Schlaf Raum
				
		B_CheckLog ();
	}
	else //nicht genug Gold
	{
		AI_Output (self, other, "DIA_Lobart_BuyClothes_BUY_05_04"); //Du hast nicht genug Gold!
	};
	
	Info_ClearChoices	(DIA_Lobart_BuyClothes);
};

func void DIA_Lobart_BuyClothes_NotYet()
{
	AI_Output (other, self, "DIA_Lobart_BuyClothes_NotYet_15_00"); //Ist mir noch zu teuer.
	AI_Output (self, other, "DIA_Lobart_BuyClothes_NotYet_05_01"); //Wie du meinst ...
	
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
	description	= "Was ist hier eigentlich los?";
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
	AI_Output (other, self, "DIA_Lobart_AufstandInfo_15_00"); //Was ist hier eigentlich los?
	AI_Output (self, other, "DIA_Lobart_AufstandInfo_05_01"); //Du weißt nicht, was los ist? Junge, wo kommst du HER? Wir befinden uns am Rande eines Bürgerkrieges!

	if 	(hero.guild == GIL_NONE)
	 {
		AI_Output (self, other, "DIA_Lobart_AufstandInfo_05_02"); //Bis jetzt haben alle Bauern die Abgaben an die Stadt als gerechten Tribut angesehen.
		AI_Output (self, other, "DIA_Lobart_AufstandInfo_05_03"); //Aber seit die Paladine in Khorinis sind, kommen die Stadtwachen immer öfter - und sie holen nach und nach alles ab.
		AI_Output (self, other, "DIA_Lobart_AufstandInfo_05_04"); //Wenn das so weitergeht, haben wir bald selbst nichts mehr.
	 };

	AI_Output (self, other, "DIA_Lobart_AufstandInfo_05_05"); //Einige Bauern fangen an, sich aufzulehnen! Onar war der erste von ihnen!
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
	description	= "Erzähl mir mehr über diesen Onar...";
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
	AI_Output (other, self, "DIA_Lobart_OnarStory_15_00"); //Erzähl mir mehr über diesen Onar...

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Lobart_OnarStory_05_01"); //Du bist doch Söldner, oder? Was soll ich dir dann noch über deinen Boss erzählen?
		}
		else
		{
			AI_Output (self, other, "DIA_Lobart_OnarStory_05_02"); //Onar ist der größte Bauer hier in der Gegend. Er hat sich von der Stadt losgesagt.
			AI_Output (self, other, "DIA_Lobart_OnarStory_05_03"); //Es heißt, er hat Söldner angeheuert, damit sie ihm die Stadtwache vom Hals halten!
			AI_Output (self, other, "DIA_Lobart_OnarStory_05_04"); //Kann's ihm nicht verübeln.
			AI_Output (self, other, "DIA_Lobart_OnarStory_05_05"); //Jedenfalls traut sich jetzt kein königlicher Soldat mehr auf seinen Hof.
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
	description	= "Was sind das für Söldner, die Onar angeheuert hat?";
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
	AI_Output (other, self, "DIA_Lobart_SldInfo_15_00"); //Was sind das für Söldner, die Onar angeheuert hat?
	AI_Output (self, other, "DIA_Lobart_SldInfo_05_01"); //Ich weiß nicht viel über die Kerle. Angeblich sollen viele von ihnen ehemalige Gefangene aus der Minenkolonie sein.
	AI_Output (self, other, "DIA_Lobart_SldInfo_05_02"); //(abfällig) Was man von denen zu halten hat, ist ja bekannt ...
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
	description	= "Für wen bist du? Bauern oder König?";
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
	AI_Output (other, self, "DIA_Lobart_WhichSide_15_00"); //Was ist mit dir? Für wen bist du? Bauern oder König?
	AI_Output (self, other, "DIA_Lobart_WhichSide_05_01"); //Ich bin zu nah an der Stadt, um wirklich eine Wahl zu haben.
	AI_Output (self, other, "DIA_Lobart_WhichSide_05_02"); //Aber ich bin ganz froh darüber. Ich wüsste nicht, wie ich mich entscheiden soll.
	
	if (hero.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Lobart_WhichSide_05_03"); //Der König lässt uns ausbluten und Onar hetzt allen, die sich ihm nicht anschließen, seine Söldner auf den Hals.
		AI_Output (self, other, "DIA_Lobart_WhichSide_05_04"); //Deswegen sind die meisten anderen Bauern noch unentschlossen, aber auf kurz oder lang werden sie sich schon für eine Seite entscheiden MÜSSEN.
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
	description	= "Ich suche Arbeit!";
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
	AI_Output (other, self, "DIA_Lobart_WorkNOW_15_00"); //Ich suche Arbeit!
	AI_Output (self, other, "DIA_Lobart_WorkNOW_05_01"); //Einen weiteren Knecht kann ich nicht gebrauchen. Aber für einen Tagelöhner hätte ich schon was zu tun.
	AI_Output (self, other, "DIA_Lobart_WorkNOW_05_02"); //Ich meine, du kannst mir ein bisschen auf dem Feld zur Hand gehen. Und es gibt auch sicher noch ein paar andere Dinge, die hier zu tun sind.

	if (hero.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Lobart_WorkNOW_05_03"); //Ich könnte dich mit Gold bezahlen. Oder dir ein paar gute Sachen zum Anziehen geben.
		AI_Output (self, other, "DIA_Lobart_WorkNOW_05_04"); //Die Sachen sind 'ne Menge wert. Ich kann sie dir nicht umsonst geben, aber ich kann sie dir billiger verkaufen, wenn du für mich arbeitest.
			
		Log_CreateTopic (TOPIC_Kleidung,LOG_MISSION);  
		Log_SetTopicStatus  (TOPIC_Kleidung,LOG_RUNNING);  
		B_LogEntry (TOPIC_Kleidung,"Der Bauer Lobart ist bereit, mir Arbeiterkleidung zu verkaufen. Einen Teil des Preises kann ich auf seinem Hof abarbeiten. Je mehr ich arbeite, desto billiger wird die Kleidung.");
			
		if (Npc_HasEquippedArmor(other) == FALSE)
		|| (Lobart_Kleidung_Verkauft == TRUE)
		{
			AI_Output (self, other, "DIA_Lobart_WorkNOW_05_05"); //So, wie du rumläufst, solltest du die Klamotten nehmen.
		}
		else
		{
			AI_Output (self, other, "DIA_Lobart_WorkNOW_05_06"); //Aber du hast ja schon Klamotten, also willst du vermutlich das Gold.
		};
	};

	AI_Output (self, other, "DIA_Lobart_WorkNOW_05_07"); //Wie auch immer - das kleine Rübenfeld neben der Scheune muss abgeerntet werden.
	
	Info_ClearChoices	(DIA_Lobart_WorkNOW);
	Info_AddChoice		(DIA_Lobart_WorkNOW, "Ich soll Rüben ziehen? Willst du mich verarschen?", DIA_Lobart_WorkNOW_WannaFoolMe );
	Info_AddChoice		(DIA_Lobart_WorkNOW, "Na gut...", DIA_Lobart_WorkNOW_Ok );
};

func void DIA_Lobart_WorkNOW_Ok()
{
	AI_Output (other, self, "DIA_Lobart_WorkNOW_Ok_15_00"); //Na gut ...

	if (hero.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Lobart_WorkNOW_Ok_05_01"); //Dann beeil dich ein bisschen, bevor ich es mir anders überlege.
	};
	Log_CreateTopic (TOPIC_Rueben,LOG_MISSION);  
	Log_SetTopicStatus  (TOPIC_Rueben,LOG_RUNNING);  
	B_LogEntry (TOPIC_Rueben,"Ich soll für Bauer Lobart das Rübenfeld ernten. Dafür bezahlt er mir Gold oder geht mit dem Preis für die Kleidung runter.");
	
	MIS_Lobart_Rueben = LOG_RUNNING;
	Info_ClearChoices	(DIA_Lobart_WorkNOW);
};

func void DIA_Lobart_WorkNOW_WannaFoolMe()
{
	AI_Output (other, self, "DIA_Lobart_WorkNOW_WannaFoolMe_15_00"); //Ich soll Rüben ziehen? Willst du mich verarschen?
	AI_Output (self, other, "DIA_Lobart_WorkNOW_WannaFoolMe_05_01"); //Richtige Männerarbeit ist wohl nichts für so einen 'feinen Herrn', was?

	if (hero.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Lobart_WorkNOW_WannaFoolMe_05_02"); //Mach, dass du aufs Feld kommst, oder verschwinde von meinem Hof!
	}
	else
	{
		AI_Output (self, other, "DIA_Lobart_WorkNOW_WannaFoolMe_05_03"); //Was anderes habe ich im Moment nicht zu tun.
	};
	
	Log_CreateTopic (TOPIC_Rueben,LOG_MISSION);  
	Log_SetTopicStatus  (TOPIC_Rueben,LOG_RUNNING);  
	B_LogEntry (TOPIC_Rueben,"Ich soll für Bauer Lobart das Rübenfeld ernten. Dafür bezahlt er mir Gold oder geht mit dem Preis für die Kleidung runter.");
	
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
	description	 = 	"Hier hast du deine Rüben!";
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
	AI_Output (other, self, "DIA_Lobart_RuebenRunning_15_00"); //Hier hast du deine Rüben!

	if (Npc_HasItems (other,ItPl_Beet) >= 20)
	{
		if (hero.guild == GIL_NONE)
			{
				AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_01"); //Du bist ja doch zu was zu gebrauchen.
			};

		if ((Npc_IsDead(Hilda))== FALSE)
		{
			AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_02"); //Bring sie zu meiner Frau ins Haus, sie soll sie kochen.
	
			MIS_Lobart_RuebenToHilda = LOG_RUNNING;
			Log_CreateTopic (TOPIC_Ruebenbringen,LOG_MISSION);
			Log_SetTopicStatus (TOPIC_Ruebenbringen,LOG_RUNNING);
			B_LogEntry (TOPIC_Ruebenbringen,"Ich soll die geernteten Rüben zu Lobart's Frau im Haus bringen. Sie soll sie kochen. ");
		};
		
		MIS_Lobart_Rueben = LOG_SUCCESS;
		B_GivePlayerXP (XP_LobartHolRueben);
		 
	//	Log_SetTopicStatus(TOPIC_BauerLobart, LOG_SUCCESS); ALT
	//	Log_AddEntry (TOPIC_BauerLobart,"Ich habe Lobart seine Rüben gebracht, er hat mich dafür entlohnt."); 
		
		AI_Output (other, self, "DIA_Lobart_RuebenRunning_15_03"); //Was ist mit meinem Lohn?
		AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_04"); //Ich kann dir 5 Goldstücke geben.
		
		if (hero.guild == GIL_NONE)
			{
				AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_05"); //... oder die Klamotten billiger verkaufen, was soll's sein?
			};
	
		Info_ClearChoices 	(DIA_Lobart_RuebenRunning);

		if (hero.guild == GIL_NONE)
			{
				Info_AddChoice		(DIA_Lobart_RuebenRunning, "Mach mir einen besseren Preis für die Klamotten!",	DIA_Lobart_RuebenRunning_Billiger );
			};

		Info_AddChoice		(DIA_Lobart_RuebenRunning, "Gib mir 5 Goldmünzen!", 		DIA_Lobart_RuebenRunning_Gold );

	}
	else
	{
		AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_06"); //Das sind ja noch nicht mal 20 Stück!
		
		if (hero.guild == GIL_NONE)
			{
				AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_07"); //Hast du den Rest etwa aufgefressen?! Das will ich nicht hoffen, mein Junge, sonst kannst du deinen Lohn vergessen!
				AI_Output (self, other, "DIA_Lobart_RuebenRunning_05_08"); //Sieh zu, dass du mehr holst! Los, an die Arbeit, sonst mach ich dir Beine!
			};
		
		AI_StopProcessInfos (self);
	};
};

func void DIA_Lobart_RuebenRunning_Gold ()
{
	AI_Output (other, self, "DIA_Lobart_RuebenRunning_Gold_15_00"); //Gib mir 5 Goldmünzen!
	AI_Output (self, other, "DIA_Lobart_RuebenRunning_Gold_05_01"); //Hier.

	B_GiveInvItems (self, other, ItMi_Gold, 5);

		if (hero.guild == GIL_NONE)
			{
					AI_Output (self, other, "DIA_Lobart_RuebenRunning_Gold_05_02"); //Und versauf nicht gleich alles auf einmal.
			};
			

	Info_ClearChoices 	(DIA_Lobart_RuebenRunning);
};

func void DIA_Lobart_RuebenRunning_Billiger ()
{
	AI_Output (other, self, "DIA_Lobart_RuebenRunning_Billiger_15_00"); //Mach mir einen besseren Preis für die Klamotten!
	AI_Output (self, other, "DIA_Lobart_RuebenRunning_Billiger_05_01"); //Gut! Ich werde sie dir für 10 Goldstücke weniger geben.
	
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
	description	= "Hast du sonst noch was für mich zu tun?";
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
	AI_Output (other, self, "DIA_Lobart_MoreWork_15_00"); //Hast du sonst noch was für mich zu tun?
	
	if (MIS_Lobart_Rueben == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Lobart_MoreWork_05_01"); //Hol erst die Rüben vom Feld. Dann sehen wir weiter.
	}
	else //SUCCESS
	{
		AI_Output (self, other, "DIA_Lobart_MoreWork_05_02"); //Ich nicht, aber du kannst meine Frau fragen oder die Jungs auf den Feldern. Vielleicht brauchen die Hilfe.
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
	description	 = 	"Andre schickt mich zu dir.";
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
	AI_Output			(other, self, "DIA_Lobart_ANDREHELPLOBART_15_00"); //Andre schickt mich zu dir. Kann ich irgendwas für dich tun?
	AI_Output			(self, other, "DIA_Lobart_ANDREHELPLOBART_05_01"); //Ja, klar. Diese verdammten Feldräuber machen mich noch ganz krank.
	AI_Output			(self, other, "DIA_Lobart_ANDREHELPLOBART_05_02"); //Mach sie alle kalt. Wie du das anstellst, ist mir egal!

	Log_AddEntry (TOPIC_BecomeMIL,"Lobarts Felder werden von Feldräubern heimgesucht. Er will, daß ich sie alle vertreibe."); 
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
	description	 = 	"Ich hab die Biester erledigt!";
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
			AI_Output			(other, self, "DIA_Lobart_BUGDEAD_15_00"); //Ich hab die Biester erledigt!
			AI_Output			(self, other, "DIA_Lobart_BUGDEAD_05_01"); //Alle Achtung. Als Kammerjäger taugst du was. Ich werde dich weiter empfehlen. Hier, nimm das als Entlohnung.
			
			B_StartOtherRoutine	(Vino,"Start");
			B_StartOtherRoutine	(LobartsBauer1,"Start");
			B_StartOtherRoutine	(LobartsBauer2,"Start");

			CreateInvItems (self, ItMi_Gold, 20);
			B_GiveInvItems (self, other, ItMi_Gold, 20);

			MIS_LobartKillBugs 	= LOG_SUCCESS;
			MIS_AndreHelpLobart = LOG_SUCCESS;
			Log_AddEntry (TOPIC_BecomeMIL,"Lobart ist seine Feldräuber los geworden. Ich habe sie beseitigt"); 
			DIA_Lobart_BUGDEAD_noPerm = TRUE;
		}
		else  
		{
			AI_Output			(other, self, "DIA_Lobart_BUGDEAD_15_02"); //Ich denke, ich hab die Biester erledigt!
			AI_Output			(self, other, "DIA_Lobart_BUGDEAD_05_03"); //Verarsch mich nicht. Ich seh sie doch noch. Entweder bringst du die Viecher um, oder wir vergessen die ganze Geschichte.
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

	description	 = 	"Wie geht's deinem Hof?";
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
	AI_Output			(other, self, "DIA_Lobart_DMT_15_00"); //Wie geht's deinem Hof?
	AI_Output			(self, other, "DIA_Lobart_DMT_05_01"); //Es ist nicht mehr auszuhalten.
	AI_Output			(self, other, "DIA_Lobart_DMT_05_02"); //Auf einmal sind überall diese schwarzen Kapuzenkerle aufgetaucht und haben sich an der Straße und auf meinem Hof postiert.


	Info_ClearChoices	(DIA_Lobart_DMT);

	Info_AddChoice	(DIA_Lobart_DMT, DIALOG_ENDE, DIA_Lobart_DMT_BACK );

	if (hero.guild == GIL_KDF)
	&& (Vino_isAlive_Kap3 == TRUE)
		{
		AI_Output			(self, other, "DIA_Lobart_DMT_05_03"); //Sie haben sich ziemlich lange mit Vino unterhalten und dann sind sie mit ihm verschwunden.

			if (NpcObsessedByDMT_Vino == FALSE)
			{
			Info_AddChoice	(DIA_Lobart_DMT, "Wohin haben sie Vino verschleppt?", DIA_Lobart_DMT_VinoWohin );
			};
			Info_AddChoice	(DIA_Lobart_DMT, "Was wollten sie von Vino?", DIA_Lobart_DMT_VinoWas );
		};

	if ((Npc_IsDead(Hilda))== FALSE)
	&& ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)	||	(hero.guild == GIL_KDF))
	{
		AI_Output			(self, other, "DIA_Lobart_DMT_05_04"); //Kurze Zeit später ist meine Frau wieder todkrank geworden. Sie liegt die meiste Zeit im Bett. Das hatte sie schon öfter.
	};

	AI_Output			(self, other, "DIA_Lobart_DMT_05_05"); //Ich dreh hier noch durch!

	if (MIS_HealHilda != LOG_SUCCESS)
	&& ((Npc_IsDead(Hilda)) == FALSE)
	&& ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)	||	(hero.guild == GIL_KDF))
	{
		Info_AddChoice	(DIA_Lobart_DMT, "Warum gehst du mit deiner Frau nicht zum Heiler?", DIA_Lobart_DMT_FrauHeilen );
	};

	Info_AddChoice	(DIA_Lobart_DMT, "Warum unternimmst du nichts gegen die schwarzen Männer?", DIA_Lobart_DMT_hof );
	Info_AddChoice	(DIA_Lobart_DMT, "Hast du mit den schwarzen Männern gesprochen?", DIA_Lobart_DMT_spokeToThem );
	
};
func void DIA_Lobart_DMT_FrauHeilen ()
{
	AI_Output			(other, self, "DIA_Lobart_DMT_FrauHeilen_15_00"); //Warum gehst du mit deiner Frau nicht zum Heiler?
	AI_Output			(self, other, "DIA_Lobart_DMT_FrauHeilen_05_01"); //Dazu müssten wir zu Vatras in die Stadt gehen, aber ich geh hier keinen Meter von meinem Hof, solange hier so ein Chaos herrscht.
	
	Log_CreateTopic (TOPIC_HealHilda, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HealHilda, LOG_RUNNING);
	B_LogEntry (TOPIC_HealHilda,"Lobarts Frau Hilda ist krank, aber Vatras hat ein Heilmittel."); 

	MIS_HealHilda = LOG_RUNNING;	
};

func void DIA_Lobart_DMT_BACK ()
{
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start"); 
};

func void DIA_Lobart_DMT_spokeToThem ()
{
	AI_Output			(other, self, "DIA_Lobart_DMT_spokeToThem_15_00"); //Hast du mit den schwarzen Männern gesprochen?
	AI_Output			(self, other, "DIA_Lobart_DMT_spokeToThem_05_01"); //Sicher. Es ließ sich ja gar nicht verhindern.
	AI_Output			(self, other, "DIA_Lobart_DMT_spokeToThem_05_02"); //Ich glaube, sie suchen jemanden.
};

func void DIA_Lobart_DMT_hof ()
{
	AI_Output			(other, self, "DIA_Lobart_DMT_hof_15_00"); //Warum unternimmst du nichts gegen die schwarzen Männer?
	AI_Output			(self, other, "DIA_Lobart_DMT_hof_05_01"); //Würde ich ja liebend gerne tun. Aber ich hab gesehen, wie sie einen Stadtbewohner bei lebendigem Leib verbrannt haben. Einfach so.
	AI_Output			(self, other, "DIA_Lobart_DMT_hof_05_02"); //Wozu soll ich mein Leben aufs Spiel setzen?
};

func void DIA_Lobart_DMT_VinoWas ()
{
	AI_Output			(other, self, "DIA_Lobart_DMT_VinoWas_15_00"); //Was wollten sie von Vino?
	AI_Output			(self, other, "DIA_Lobart_DMT_VinoWas_05_01"); //Das sagten sie nicht. Sie haben ihn einfach mitgenommen.
};

func void DIA_Lobart_DMT_VinoWohin ()
{
	AI_Output			(other, self, "DIA_Lobart_DMT_VinoWohin_15_00"); //Wohin haben sie Vino verschleppt?
	AI_Output			(self, other, "DIA_Lobart_DMT_VinoWohin_05_01"); //Sie sind mit ihm den Hügel da rauf.
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

	description	 = 	"Vino kommt nicht mehr zurück.";
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
	AI_Output			(other, self, "DIA_Lobart_VINOTOT_15_00"); //Vino kommt nicht mehr zurück.

	if (Npc_IsDead(Vino))	
	{
		AI_Output			(other, self, "DIA_Lobart_VINOTOT_15_01"); //Er ist tot.
	}
	else
	{
		AI_Output			(other, self, "DIA_Lobart_VINOTOT_15_02"); //Sie haben ihm den Verstand geraubt.
	};
	
	AI_Output			(self, other, "DIA_Lobart_VINOTOT_05_03"); //Bei Innos. Hoffentlich ist dieser Alptraum bald vorbei.
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

	description	 = 	"Gib acht auf deinen Hof!";
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
	AI_Output			(other, self, "DIA_Lobart_PERM_15_00"); //Gib Acht auf deinen Hof!
	AI_Output			(self, other, "DIA_Lobart_PERM_05_01"); //Ich werd's versuchen.
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

	description	 = 	"Du hast ein Orkproblem.";
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
	AI_Output			(other, self, "DIA_Lobart_ORKPROBLEM_15_00"); //Du hast ein Orkproblem.
	AI_Output			(self, other, "DIA_Lobart_ORKPROBLEM_05_01"); //(poltert) Verdammt noch mal. Hört der Stress denn nie auf.
	AI_Output			(self, other, "DIA_Lobart_ORKPROBLEM_05_02"); //Wenn das so weiter geht, ist mein Hof keine 3 Goldmünzen mehr wert.
	
	Log_CreateTopic (TOPIC_LobartsOrKProblem, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LobartsOrKProblem, LOG_RUNNING);
	B_LogEntry (TOPIC_LobartsOrKProblem,"Auf Lobarts Hof haben sich die Orks breit gemacht. Er will, dass ich sie beseitige."); 

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

	description	 = 	"Ich habe die Orks von deinem Land beseitigt.";
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
	AI_Output			(other, self, "DIA_Lobart_ORKSWEG_15_00"); //Ich habe die Orks von deinem Land beseitigt.
	if (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Lobart_ORKSWEG_05_01"); //Da soll noch mal einer sagen, dass die Paladine nichts für uns kleinen Bauern tun.
	};
	AI_Output			(self, other, "DIA_Lobart_ORKSWEG_05_02"); //Innos sei gedankt. Ich kann dir nicht viel geben, aber ich hoffe, du erkennst meine Geste der Dankbarkeit an.
	
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




















































































