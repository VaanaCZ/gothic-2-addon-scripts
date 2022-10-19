// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Alrik_EXIT(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 999;
	condition	= DIA_Alrik_EXIT_Condition;
	information	= DIA_Alrik_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Alrik_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Alrik_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Alrik_PICKPOCKET (C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 900;
	condition	= DIA_Alrik_PICKPOCKET_Condition;
	information	= DIA_Alrik_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Alrik_PICKPOCKET_Condition()
{
	C_Beklauen (55, 50);
};
 
FUNC VOID DIA_Alrik_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Alrik_PICKPOCKET);
	Info_AddChoice		(DIA_Alrik_PICKPOCKET, DIALOG_BACK 		,DIA_Alrik_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Alrik_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Alrik_PICKPOCKET_DoIt);
};

func void DIA_Alrik_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Alrik_PICKPOCKET);
};
	
func void DIA_Alrik_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Alrik_PICKPOCKET);
};
// ************************************************************
// 			  				  Hallo
// ************************************************************

INSTANCE DIA_Alrik_Hallo(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_Hallo_Condition;
	information	= DIA_Alrik_Hallo_Info;
	permanent	= FALSE;
	description = "Was machst du hier?";
};                       

FUNC INT DIA_Alrik_Hallo_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Alrik_Hallo_Info()
{	
	AI_Output (other,self ,"DIA_Alrik_Hallo_15_00"); //Was machst du hier?
	
	if (Npc_GetDistToWP (self,"NW_CITY_PATH_HABOUR_16_01") <= 500) //In Ecke
	{
		AI_Output (self ,other,"DIA_Alrik_Hallo_09_01"); //(lacht) Das hier ist mein Zuhause!
	}
	else //In Kneipe oder auf dem Weg
	{
		if (Npc_GetDistToWP (self,"NW_CITY_HABOUR_TAVERN01_01") <= 500)
		{
			AI_Output (self ,other,"DIA_Alrik_Hallo_09_02"); //Was soll man hier schon machen? Ich trinke.
		}
		else
		{
			AI_Output (self ,other,"DIA_Alrik_Hallo_09_03"); //Ich gehe ein bisschen spazieren.
		};
	};
	AI_Output (self ,other,"DIA_Alrik_Hallo_09_04"); //Aber wenn du meinst, was ich so den ganzen Tag treibe - ich veranstalte Kämpfe.
};

// ************************************************************
// 			  				Du kämpfst?
// ************************************************************

INSTANCE DIA_Alrik_YouFight(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_YouFight_Condition;
	information	= DIA_Alrik_YouFight_Info;
	permanent	= FALSE;
	description = "Du veranstaltest Kämpfe?";
};                       

FUNC INT DIA_Alrik_YouFight_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Alrik_Hallo))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Alrik_YouFight_Info()
{
	AI_Output (other,self ,"DIA_Alrik_YouFight_15_00"); //Du veranstaltest Kämpfe?
	AI_Output (self ,other,"DIA_Alrik_YouFight_09_01"); //Jeden Tag von mittags bis abends.
	if (Npc_GetDistToWP (self,"NW_CITY_PATH_HABOUR_16_01") <= 500) //In Ecke
	{
		AI_Output (self ,other,"DIA_Alrik_YouFight_09_02"); //Und zwar genau hier!
	};
	AI_Output (self ,other,"DIA_Alrik_YouFight_09_03"); //Hinter dem Lagerhaus im Hafenviertel - trautes Heim, Glück allein!
};


// ************************************************************
// 			  				Regeln
// ************************************************************

INSTANCE DIA_Alrik_Regeln(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_Regeln_Condition;
	information	= DIA_Alrik_Regeln_Info;
	permanent	= FALSE;
	description = "Wie sind die Regeln für den Kampf?";
};                       

FUNC INT DIA_Alrik_Regeln_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Alrik_YouFight))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Alrik_Regeln_Info()
{
	AI_Output (other,self ,"DIA_Alrik_Regeln_15_00"); //Wie sind die Regeln für den Kampf?
	AI_Output (self ,other,"DIA_Alrik_Regeln_09_01"); //Ganz einfach: Alle normalen Waffen sind erlaubt. Keine Bögen oder Armbrüste und KEINE Magie!
	AI_Output (self ,other,"DIA_Alrik_Regeln_09_02"); //Wir kämpfen, bis einer von uns beiden zu Boden geht. Und sobald einer flachliegt, wird aufgehört, klar?
	AI_Output (self ,other,"DIA_Alrik_Regeln_09_03"); //Wer die Ecke verlässt, ist draußen! Wenn du also abhaust, gewinne ich!
	AI_Output (self ,other,"DIA_Alrik_Regeln_09_04"); //Dein Einsatz sind 50 Goldmünzen. Wenn du gewinnst, bekommst du 100 zurück. Wenn nicht - nun ja - dann ist dein Geld futsch. (grinst)
	AI_Output (self ,other,"DIA_Alrik_Regeln_09_05"); //Alles kapiert?
	AI_Output (other,self ,"DIA_Alrik_Regeln_15_06"); //Klar!
};


// ************************************************************
// 		  			Important für NEUE 3 Kämpfe ab Kap 3
// ************************************************************

		func void B_Alrik_Again()
		{
			AI_Output (self, other, "DIA_Alrik_Add_09_03"); //Wie sieht's aus? Willst du nochmal gegen mich antreten? Ich glaube, ich bin mittlerweile besser geworden...
		};

INSTANCE DIA_Alrik_NewFights3(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_NewFights3_Condition;
	information	= DIA_Alrik_NewFights3_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Alrik_NewFights3_Condition()
{
	if (Kapitel >= 3)
	&& (Kapitel <= 4)
	&& (Alrik_ArenaKampfVerloren <= 6)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Alrik_NewFights3_Info()
{
	B_AddFightSkill (self, NPC_TALENT_1H, 20);
	B_SetAttributesToChapter (self, 4);
	B_Alrik_Again();
};

// ************************************************************
// 		  			Important für NEUE 3 Kämpfe ab Kap 5
// ************************************************************

INSTANCE DIA_Alrik_NewFights5(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_NewFights5_Condition;
	information	= DIA_Alrik_NewFights5_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Alrik_NewFights5_Condition()
{
	if (Kapitel >= 5)
	&& (Alrik_ArenaKampfVerloren <= 9)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Alrik_NewFights5_Info()
{
	B_AddFightSkill (self, NPC_TALENT_1H, 20);
	B_SetAttributesToChapter (self, 6);
	B_Alrik_Again();
};

// ************************************************************
// 			  			WannaFight
// ************************************************************
		
		func void B_Alrik_Enough()
		{
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_05"); //Ich denke, du hast schon oft genug gewonnen.
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_06"); //Nimm's mir nicht übel, aber mein Schädel brummt jetzt noch vom letzten Mal ...
		};
		
		func void B_Alrik_ComeBackLater()
		{
			AI_Output (self, other, "DIA_Alrik_Add_09_02"); //Komm später nochmal wieder. Ich werde in der Zwischenzeit trainieren,,,
		};
		

INSTANCE DIA_Alrik_WannaFight(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_WannaFight_Condition;
	information	= DIA_Alrik_WannaFight_Info;
	permanent	= TRUE;
	description = "Ich will gegen dich kämpfen!";
};                       

FUNC INT DIA_Alrik_WannaFight_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Alrik_Regeln))
	&& (self.aivar[AIV_ArenaFight] == AF_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Alrik_WannaFight_Info()
{
	AI_Output (other,self ,"DIA_Alrik_WannaFight_15_00"); //Ich will gegen dich kämpfen!
	
	Info_ClearChoices 	(DIA_Alrik_WannaFight);
	
	// ------ EXIT: Wenn Alrik schonmal verloren, nächster Kampf erst, wenn Alrik das bessere Schwert hat ------
	if ( (Alrik_ArenaKampfVerloren > 0) && (Npc_HasItems (self, ItMW_AlriksSword_Mis) == 0) )
	|| (Npc_HasEquippedMeleeWeapon (self) == FALSE)
	{
		if (MIS_Alrik_Sword == LOG_SUCCESS) //Wenn nach Schwert-Mission niedergeschlagen und Schwert weggenommen
		{
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_01"); //Gib mir erst mein Schwert zurück. Dann sehen wir weiter ...
		}
		else
		{
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_02"); //Nee, nee. Bevor ich noch mal gegen dich antrete, brauch ich 'ne bessere Waffe!
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_03"); //Ich musste vor ein paar Tagen mein Schwert verkaufen.
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_04"); //Mit dem Teil bin ich unschlagbar! Wenn du es mir wieder besorgst, trete ich noch mal gegen dich an!
			
			Alrik_VomSchwertErzaehlt = TRUE;
			
			Log_CreateTopic (TOPIC_AlrikSchwert,LOG_MISSION);
			Log_SetTopicStatus (TOPIC_AlrikSchwert,LOG_RUNNING);
			B_LogEntry (TOPIC_AlrikSchwert,"Alrik hat sein Schwert an den Händler Jora verkauft. Er kämpft nur gegen mich, wenn ich es ihm zurückbringe.");
		};
	}
	
	// ----- EXIT: ÜBER DREI MAL Alrik_ArenaKampfVerloren ------
	else if (Kapitel <= 2)
	&& (Alrik_ArenaKampfVerloren > 3)
	{
		AI_Output (self, other, "DIA_Alrik_Add_09_00"); //Ich denke für's erste reicht es...
		AI_Output (self, other, "DIA_Alrik_Add_09_01"); //Gönn mir mal ne kurze Pause.
		B_Alrik_ComeBackLater();
	}
	
	else if (Kapitel >= 3)
	&& (Kapitel <= 4)
	&& (Alrik_ArenaKampfVerloren > 6)
	{
		B_Alrik_Enough();
		B_Alrik_ComeBackLater();
	}
	
	else if (Kapitel >= 5)
	&& (Alrik_ArenaKampfVerloren > 9)
	{
		B_Alrik_Enough();
		AI_Output (self, other, "DIA_Alrik_Add_09_04"); //Außerdem habe ich mittlerweile genug Geld zusammen.
		AI_Output (self, other, "DIA_Alrik_Add_09_05"); //Ich hör auf und such' mir hier irgendwo in der Stadt 'ne Bleibe...
		AI_Output (self, other, "DIA_Alrik_Add_09_06"); //Mal sehen, vielleicht mach in 'nen Waffenladen auf...
	}
	
	// ------ normaler KAMPF ------
	else if (Wld_IsTime(11,00,19,00))
	{
		AI_Output (self ,other,"DIA_Alrik_WannaFight_09_07"); //Hast du die 50 Goldstücke?
		Info_ClearChoices 	(DIA_Alrik_WannaFight);
		Info_AddChoice 		(DIA_Alrik_WannaFight, "Nö...",	DIA_Alrik_WannaFight_NoGold);
		if (Npc_HasItems (other, itmi_gold) >= 50)
		{
			Info_AddChoice 		(DIA_Alrik_WannaFight, "Hier sind sie...",	DIA_Alrik_WannaFight_Gold);
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Alrik_WannaFight_09_08"); //Ich mache nur Kämpfe von mittags bis abends.
		AI_Output (self ,other,"DIA_Alrik_WannaFight_09_09"); //Das Kämpfen lohnt sich nur, wenn genug Zuschauer da sind, die Wetten abschließen!
		if (Wld_IsTime(19,00,03,30))
		{
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_10"); //Jetzt ist es viel zu spät. Komm morgen Mittag wieder!
		}
		else // 03,30 - 11,00 
		{
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_11"); //Jetzt ist es noch zu früh, komm später wieder!
		};
	};
};

func void DIA_Alrik_WannaFight_Gold()
{
	AI_Output (other, self,"DIA_Alrik_WannaFight_Gold_15_00"); //Hier sind sie ...
	B_GiveInvItems (other, self, itmi_gold, 50);
	AI_Output (self ,other,"DIA_Alrik_WannaFight_Gold_09_01"); //(laut) Wir haben einen neuen Herausforderer!
	AI_Output (self ,other,"DIA_Alrik_WannaFight_Gold_09_02"); //Die Wetten sind platziert ...
	
	Npc_RemoveInvItems (self, itmi_gold, Npc_HasItems(self, itmi_gold) );
	CreateInvItems (self, itmi_gold, 100); //50 vom Spieler und 50 Einsatz von Alrik...
	
	AI_Output (self ,other,"DIA_Alrik_WannaFight_Gold_09_03"); //Bist du bereit?
	
	//--------------------------------------
	self.aivar[AIV_ArenaFight] = AF_RUNNING;
	Alrik_Kaempfe 		= Alrik_Kaempfe + 1;
	//--------------------------------------
	
	Info_ClearChoices 	(DIA_Alrik_WannaFight);
	Info_AddChoice 		(DIA_Alrik_WannaFight, "Moment...",	DIA_Alrik_WannaFight_Moment);
	Info_AddChoice 		(DIA_Alrik_WannaFight, "Komm her!",	DIA_Alrik_WannaFight_NOW);
};

func void DIA_Alrik_WannaFight_NoGold()
{
	AI_Output (other, self,"DIA_Alrik_WannaFight_NoGold_15_00"); //Nö ...
	AI_Output (self, other,"DIA_Alrik_WannaFight_NoGold_09_01"); //Dann besorg sie dir! Kein Kampf ohne Einsatz!
	
	Info_ClearChoices 	(DIA_Alrik_WannaFight);
};

func void DIA_Alrik_WannaFight_NOW()
{
	AI_Output (other, self,"DIA_Alrik_WannaFight_NOW_15_00"); //Komm her!
	AI_Output (self, other,"DIA_Alrik_WannaFight_NOW_09_01"); //Dann lass mal sehen, was du kannst!
	
	if (self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems (self, ItPo_Health_03, 1); 
		B_UseItem (self, ItPo_Health_03);
	};
	
	AI_StopProcessInfos (self);
	B_Attack (self,other, AR_NONE, 1);
};	

func void DIA_Alrik_WannaFight_Moment()
{
	AI_Output (other, self,"DIA_Alrik_WannaFight_Moment_15_00"); //Moment ...
	AI_Output (self, other,"DIA_Alrik_WannaFight_Moment_09_01"); //Lass dir Zeit ... ich fang schon mal an!
	
	if (self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems (self, ItPo_Health_03, 1); 
		B_UseItem (self, ItPo_Health_03);
	};
	
	AI_StopProcessInfos (self);
	B_Attack (self,other, AR_NONE, 1);
};	


// ************************************************************
// 			  			NACH Kampf
// ************************************************************

INSTANCE DIA_Alrik_AfterFight(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_AfterFight_Condition;
	information	= DIA_Alrik_AfterFight_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       

FUNC INT DIA_Alrik_AfterFight_Condition()
{
	if (self.aivar[AIV_LastFightComment] == FALSE)
	&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE)
	{
		if (self.aivar[AIV_ArenaFight] != AF_NONE)
		{	
			return TRUE;	//direkt ansprechen
		}
		else if (Npc_IsInState (self, ZS_Talk))
		{
			return TRUE; 	//wenn kein Kampf war, nur reagieren, wenn SC ihn angesprochen hat
		};
	};
};
 
FUNC VOID DIA_Alrik_AfterFight_Info()
{
	if (self.aivar[AIV_LastPlayerAR] == AR_NONE) //Kampf aus Dialog heraus.
	&& (self.aivar[AIV_ArenaFight] != AF_NONE)
	&& (self.aivar[AIV_ArenaFight] != AF_AFTER_PLUS_DAMAGE)
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_00"); //Mannomann! Du hast ja 'nen ganz schönen Schlag drauf.
			
			if (Npc_HasItems (self, itmi_gold) >= 100)
			{
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_01"); //Hier sind deine 100 Goldstücke! Du hast sie dir verdient!
				B_GiveInvItems (self, other, itmi_gold, 100);
			}
			else if (Npc_HasItems (self, itmi_gold) == 0)
			{
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_02"); //Dein Gold hast du dir ja schon genommen.
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_03"); //Hättest auch warten können, bis ich's dir gebe - ich halte mein Wort!
			}
			else //zwischen 1 und 99 Gold...
			{
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_04"); //Du warst an meinen Taschen, während ich bewusstlos war!
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_05"); //Das ist kein guter Stil, Mann! Egal, das Geld war sowieso deins! Hier hast du den Rest.
				B_GiveInvItems (self, other, itmi_gold, Npc_HasItems(self, itmi_gold) );
			};
			
			Alrik_ArenaKampfVerloren = Alrik_ArenaKampfVerloren + 1;
		}
		else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_06"); //War ein guter Kampf. Dein Einsatz ist weg - mach dir nicht so viel draus, es war fürn guten Zweck! (grinst)
		}
		else //FIGHT_CANCEL
		{
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_07"); //Tja, wie schon gesagt, wer die Ecke verlässt, verliert den Kampf! Wenn du noch mal willst, ich stehe zu deiner Verfügung!
		};
		
		// ------ nur einmal ------
		if (Alrik_Kaempfe == 1)
		{
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_08"); //Und eine Sache noch: Niemand redet darüber, was hinterm Lagerhaus passiert.
			
			if (other.guild != GIL_MIL)
			&& (other.guild != GIL_PAL)
			{
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_09"); //Die Milizen lochen hier jeden ein, der sich auch nur die kleinste Sache leistet. Und Kampfwetten sehen die Jungs sicher nicht gerne.
			};
		};
				
		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;
		
		// ------ AIVAR resetten! ------	
		self.aivar[AIV_LastFightComment] = TRUE;
	}
	else //anderer Kampfgrund gegen den Spieler ODER kein sauberer Kampf
	{
		if (self.aivar[AIV_ArenaFight] == AF_AFTER_PLUS_DAMAGE) // NACH Kampf und VOR Bewertung nochmal angegriffen.
		{
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_10"); //Der Kampf war vorbei, du Penner!
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_11"); //Ich steh nicht drauf, wenn sich die Leute nicht an die Regeln halten.
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_12"); //Mach, dass du wegkommst!
		}
		else //einfach so angegriffen (unvorbereitet)
		{
			if (Alrik_Kaempfe == 0)
			{	
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_13"); //Wenn du mit mir kämpfen wolltest, hättest du mich nur herauszufordern brauchen.
			}
			else // > 0
			{
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_14"); //Wenn du noch einen Kampf machen wolltest, hättest du mich nur herauszufordern brauchen!
			};
			
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_15"); //Mit solchen Pennern will ich nichts zu tun haben! Verschwinde!
		};
		
		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;
		
		AI_StopProcessInfos(self);
	};
};
	

// ************************************************************
// 			  			Du wohnst hier?
// ************************************************************

INSTANCE DIA_Alrik_DuWohnst(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_DuWohnst_Condition;
	information	= DIA_Alrik_DuWohnst_Info;
	permanent	= FALSE;
	description = "Du 'wohnst' hinterm Lagerhaus?";
};                       

FUNC INT DIA_Alrik_DuWohnst_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Alrik_YouFight))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Alrik_DuWohnst_Info()
{
	AI_Output (other,self ,"DIA_Alrik_DuWohnst_15_00"); //(erstaunt) Du 'wohnst' hinterm Lagerhaus?
	AI_Output (self ,other,"DIA_Alrik_DuWohnst_09_01"); //Ist nur vorübergehend. (grinst) Wenn man so viel Geld hat wie ich, kann man sich eben so einen Luxus leisten!
	AI_Output (self ,other,"DIA_Alrik_DuWohnst_09_02"); //Ich war Ausbilder bei der Armee, hab den Haufen dann aber verlassen, um mein Glück im Abenteuer zu finden.
	AI_Output (self ,other,"DIA_Alrik_DuWohnst_09_03"); //Jetzt bin ich hier in diesem Dreckskaff gelandet. Meine letzten 100 Goldstücke sind bei den Stadttorwachen draufgegangen.
	AI_Output (self ,other,"DIA_Alrik_DuWohnst_09_04"); //Also seh ich zu, dass ich wieder zu Geld komme. Ich musste sogar mein Schwert verkaufen.
	
	Alrik_VomSchwertErzaehlt = TRUE;
};


// ************************************************************
// 			  		Wer hat dein Schwert?
// ************************************************************

INSTANCE DIA_Alrik_WerSchwert(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_WerSchwert_Condition;
	information	= DIA_Alrik_WerSchwert_Info;
	permanent	= FALSE;
	description = "Wem hast du dein Schwert verkauft?";
};                       

FUNC INT DIA_Alrik_WerSchwert_Condition()
{
	if (Alrik_VomSchwertErzaehlt == TRUE)
	&& (MIS_Alrik_Sword != LOG_SUCCESS)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Alrik_WerSchwert_Info()
{
	AI_Output (other,self ,"DIA_Alrik_WerSchwert_15_00"); //Wem hast du dein Schwert verkauft?
	AI_Output (self ,other,"DIA_Alrik_WerSchwert_09_01"); //Ich hab es bei einem der Händler auf dem Marktplatz für ein bisschen Krempel eingetauscht.
	AI_Output (self ,other,"DIA_Alrik_WerSchwert_09_02"); //Jora hieß der Kerl. Die Fackeln und das bisschen Fleisch, das er mir gegeben hat, sind schon lange aufgebraucht.
	AI_Output (other,self ,"DIA_Alrik_WerSchwert_15_03"); //Er wird mir das Schwert wohl kaum umsonst geben ...
	AI_Output (self ,other,"DIA_Alrik_WerSchwert_09_04"); //Es ist ein altes Schwert. Er wird nicht viel dafür haben wollen. Betrachte das Geld einfach als zusätzlichen Einsatz für den Kampf. (grinst)
		
	MIS_Alrik_Sword = LOG_RUNNING;
};

// **************************************
//			Ich hab dein Schwert
// **************************************
var int Alrik_EinmalSchwertBonus;

INSTANCE DIA_Alrik_HaveSword(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_HaveSword_Condition;
	information	= DIA_Alrik_HaveSword_Info;
	permanent	= TRUE;
	description = "Ich hab dein Schwert!";
};                       

FUNC INT DIA_Alrik_HaveSword_Condition()
{
	IF (Npc_HasItems (other,ItMw_AlriksSword_Mis) > 0)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Alrik_HaveSword_Info()
{	
	AI_Output (other,self ,"DIA_Alrik_HaveSword_15_00"); //Ich hab dein Schwert!
	B_GiveInvItems (other,self,ItMW_AlriksSword_Mis,1);
	
	if (MIS_Alrik_Sword != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Alrik_HaveSword_09_01"); //Ah! Das ist schon viel besser, als mit einem altem Ast zu kämpfen!
		
		MIS_Alrik_Sword = LOG_SUCCESS;
		B_GivePlayerXP (XP_AlriksSword);
	}
	else
	{	
		AI_Output (self ,other,"DIA_Alrik_HaveSword_09_02"); //Gut! Bin gespannt, ob du's jetzt noch mal wagst, mich herauszufordern!
	};
		
	if (Alrik_EinmalSchwertBonus == FALSE)
	{
		B_AddFightSkill (self, NPC_TALENT_1H, 20);
		Alrik_EinmalSchwertBonus = TRUE;
	};
	AI_EquipBestMeleeWeapon (self);
};

// ************************************************************
// 			  			Krieg mit Orks
// ************************************************************

INSTANCE DIA_Alrik_Krieg(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_Krieg_Condition;
	information	= DIA_Alrik_Krieg_Info;
	permanent	= FALSE;
	description = "Was weißt du über den Krieg mit den Orks?";
};                       

FUNC INT DIA_Alrik_Krieg_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Alrik_DuWohnst))
	|| (hero.guild != GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Alrik_Krieg_Info()
{
	AI_Output (other,self ,"DIA_Alrik_Krieg_15_00"); //Was weißt du über den Krieg mit den Orks?
	AI_Output (self ,other,"DIA_Alrik_Krieg_09_01"); //Da gibt's nicht viel zu erzählen. Der Krieg dauert schon zu lange.
	AI_Output (self ,other,"DIA_Alrik_Krieg_09_02"); //Die Landbevölkerung hungert. Überall gibt es Bauernaufstände, die vom König erbarmungslos unterdrückt werden.
	AI_Output (self ,other,"DIA_Alrik_Krieg_09_03"); //Aber es sind einfach zu viele. Wenn der Krieg nicht bald endet, wird das Reich auseinanderbrechen.
};

// ************************************************************
// 			  			Mich ausbilden?
// ************************************************************

// -------------------------------
	var int Alrik_VorausErzaehlt;
// -------------------------------


instance DIA_Alrik_Ausbilden(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_Ausbilden_Condition;
	information	= DIA_Alrik_Ausbilden_Info;
	permanent	= TRUE;
	description = "Kannst du mich ausbilden?";
};                       

FUNC INT DIA_Alrik_Ausbilden_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Alrik_DuWohnst))
	|| (hero.guild != GIL_NONE))
	&& (Alrik_Teach1H == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Alrik_Ausbilden_Info()
{
	AI_Output (other,self ,"DIA_Alrik_Ausbilden_15_00"); //Kannst du mich ausbilden?
	
	if (Alrik_Kaempfe == 0)
	&& (hero.guild == GIL_NONE)
	{
		AI_Output (self ,other,"DIA_Alrik_Ausbilden_09_01"); //Wenn du wirklich kämpfen lernen willst, dann tritt gegen mich an. (schmunzelt) Die Lektion ist ganz umsonst.
		Alrik_VorausErzaehlt = TRUE; 
	}
	else //>0
	{
		if (Alrik_VorausErzaehlt == TRUE)
		{
			AI_Output (self ,other,"DIA_Alrik_Ausbilden_09_02"); //Ich stehe zu meinem Wort. Ich werde dir alles beibringen, was ich weiß - vorausgesetzt, du bringst die nötige Erfahrung mit.
		}
		else
		{
			AI_Output (self ,other,"DIA_Alrik_Ausbilden_09_03"); //Vorausgesetzt, du bringst die nötige Erfahrung mit - klar.
		};
		
		
		Alrik_Teach1H = TRUE;
		Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
		B_LogEntry (Topic_CityTeacher,"Alrik kann mich im Kampf mit einhändigen Waffen trainieren. Er hält sich hinter dem Lagerhaus im Hafenviertel auf.");
	};
};

//**************************************
//			Ich will trainieren
//**************************************

// -------------------------------------
	var int Alrik_Merke_1h;
// -------------------------------------

instance DIA_Alrik_Teach(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_Teach_Condition;
	information	= DIA_Alrik_Teach_Info;
	permanent	= TRUE;
	description = "Trainier mich im Schwertkampf!";
};                       

FUNC INT DIA_Alrik_Teach_Condition()
{
	if (Alrik_Teach1H == TRUE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Alrik_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Alrik_Teach_15_00"); //Trainier mich im Schwertkampf!
	
	Alrik_Merke_1h =  other.HitChance[NPC_TALENT_1H];
	
	Info_ClearChoices 	(DIA_Alrik_Teach);
	Info_AddChoice 		(DIA_Alrik_Teach, DIALOG_BACK,	DIA_Alrik_Teach_Back);
	Info_AddChoice		(DIA_Alrik_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Alrik_Teach_1H_1);
	Info_AddChoice		(DIA_Alrik_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Alrik_Teach_1H_5);
};

FUNC VOID DIA_Alrik_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_1H] >= (60-30))
	{
		AI_Output (self ,other,"DIA_Alrik_Teach_Back_09_00"); //Du bist kein Anfänger mehr!
	}
	else if (other.HitChance[NPC_TALENT_1H] > Alrik_Merke_1h)
	{
		AI_Output (self ,other,"DIA_Alrik_Teach_Back_09_01"); //Du bist schon besser geworden. Bald wird aus dir ein ordentlicher Kämpfer!
	};
	
	Info_ClearChoices (DIA_Alrik_Teach);
};

FUNC VOID DIA_Alrik_Teach_1H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 60);
	
	Info_ClearChoices 	(DIA_Alrik_Teach);
	Info_AddChoice 		(DIA_Alrik_Teach, DIALOG_BACK,	DIA_Alrik_Teach_Back);
	Info_AddChoice		(DIA_Alrik_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Alrik_Teach_1H_1);
	Info_AddChoice		(DIA_Alrik_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Alrik_Teach_1H_5);
};

FUNC VOID DIA_Alrik_Teach_1H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 60);

	Info_ClearChoices 	(DIA_Alrik_Teach);
	Info_AddChoice 		(DIA_Alrik_Teach, DIALOG_BACK,	DIA_Alrik_Teach_Back);
	Info_AddChoice		(DIA_Alrik_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Alrik_Teach_1H_1);
	Info_AddChoice		(DIA_Alrik_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Alrik_Teach_1H_5);
};



		






		







