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
	description = "Co tady dÏl·ö?";
};                       

FUNC INT DIA_Alrik_Hallo_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Alrik_Hallo_Info()
{	
	AI_Output (other,self ,"DIA_Alrik_Hallo_15_00"); //Co tady dÏl·ö?
	
	if (Npc_GetDistToWP (self,"NW_CITY_PATH_HABOUR_16_01") <= 500) //In Ecke
	{
		AI_Output (self ,other,"DIA_Alrik_Hallo_09_01"); //(smÏje se) J· tady bydlÌm!
	}
	else //In Kneipe oder auf dem Weg
	{
		if (Npc_GetDistToWP (self,"NW_CITY_HABOUR_TAVERN01_01") <= 500)
		{
			AI_Output (self ,other,"DIA_Alrik_Hallo_09_02"); //Co bych tu asi tak mÏl dÏlat? Piju!
		}
		else
		{
			AI_Output (self ,other,"DIA_Alrik_Hallo_09_03"); //Vyjdu si na menöÌ proch·zku.
		};
	};
	AI_Output (self ,other,"DIA_Alrik_Hallo_09_04"); //Ale jestli tÌm myslÌö, co dÏl·m cel˝ den, tak po¯·d·m souboje.
};

// ************************************************************
// 			  				Du k‰mpfst?
// ************************************************************

INSTANCE DIA_Alrik_YouFight(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_YouFight_Condition;
	information	= DIA_Alrik_YouFight_Info;
	permanent	= FALSE;
	description = "Ty po¯·d·ö souboje?";
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
	AI_Output (other,self ,"DIA_Alrik_YouFight_15_00"); //Ty po¯·d·ö souboje?
	AI_Output (self ,other,"DIA_Alrik_YouFight_09_01"); //Kaûd˝ den od poledne do veËera.
	if (Npc_GetDistToWP (self,"NW_CITY_PATH_HABOUR_16_01") <= 500) //In Ecke
	{
		AI_Output (self ,other,"DIA_Alrik_YouFight_09_02"); //A p¯Ìmo tady!
	};
	AI_Output (self ,other,"DIA_Alrik_YouFight_09_03"); //Za skladiötÏm v p¯ÌstavnÌ Ëtvrti - vöude dob¯e, doma nejlÌp!
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
	description = "M· to nÏjak˝ pravidla?";
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
	AI_Output (other,self ,"DIA_Alrik_Regeln_15_00"); //Jsou nÏjak˝ pravidla?
	AI_Output (self ,other,"DIA_Alrik_Regeln_09_01"); //Je to jednoduch˝: jsou povolen˝ vöechny norm·lnÌ zbranÏ. é·dn˝ luky ani kuöe a é¡DN¡ magie!
	AI_Output (self ,other,"DIA_Alrik_Regeln_09_02"); //Bojujeme, dokud jeden z n·s nepadne. Jakmile bude jeden leûet s drûkou v hlÌnÏ, je konec, jasn˝?
	AI_Output (self ,other,"DIA_Alrik_Regeln_09_03"); //Kaûd˝, kdo opustÌ mÌsto z·pasu, taky prohr·l. Takûe kdyû uteËeö, vyhr·l jsem j·!
	AI_Output (self ,other,"DIA_Alrik_Regeln_09_04"); //Z·pisnÈ je 50 zlaù·k˘, a kdyû vyhrajeö, dostaneö zp·tky stovku. Kdyû ne, tak o ty prachy p¯ijdeö (uöklÌbne se).
	AI_Output (self ,other,"DIA_Alrik_Regeln_09_05"); //Ch·peö?
	AI_Output (other,self ,"DIA_Alrik_Regeln_15_06"); //Jo!
};


// ************************************************************
// 		  			Important f¸r NEUE 3 K‰mpfe ab Kap 3
// ************************************************************

		func void B_Alrik_Again()
		{
			AI_Output (self, other, "DIA_Alrik_Add_09_03"); //Tak co? Chceö si to se mnou znova rozdat? MyslÌm, ûe jsem se od poslednÏ o nÏco zlepöil.
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
// 		  			Important f¸r NEUE 3 K‰mpfe ab Kap 5
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
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_05"); //ÿekl bych, ûe uû ses navyhr·val dost.
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_06"); //Nech·pej mÏ öpatnÏ, ale od minula mi jeötÏ nep¯estalo huËet v hlavÏ.
		};
		
		func void B_Alrik_ComeBackLater()
		{
			AI_Output (self, other, "DIA_Alrik_Add_09_02"); //Tak se vraù pozdÏji - j· mezitÌm budu cviËit.
		};
		

INSTANCE DIA_Alrik_WannaFight(C_INFO)
{
	npc			= VLK_438_Alrik;
	nr			= 1;
	condition	= DIA_Alrik_WannaFight_Condition;
	information	= DIA_Alrik_WannaFight_Info;
	permanent	= TRUE;
	description = "Chci s tebou bojovat!";
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
	AI_Output (other,self ,"DIA_Alrik_WannaFight_15_00"); //Chci s tebou bojovat!
	
	Info_ClearChoices 	(DIA_Alrik_WannaFight);
	
	// ------ EXIT: Wenn Alrik schonmal verloren, n‰chster Kampf erst, wenn Alrik das bessere Schwert hat ------
	if ( (Alrik_ArenaKampfVerloren > 0) && (Npc_HasItems (self, ItMW_AlriksSword_Mis) == 0) )
	|| (Npc_HasEquippedMeleeWeapon (self) == FALSE)
	{
		if (MIS_Alrik_Sword == LOG_SUCCESS) //Wenn nach Schwert-Mission niedergeschlagen und Schwert weggenommen
		{
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_01"); //Nejd¯Ìv mi vraù meË a pak uvidÌme.
		}
		else
		{
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_02"); //Ne-e, neû se ti znova postavÌm, pot¯ebuju lepöÌ zbraÚ!
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_03"); //P¯ed p·r dny jsem musel prodat sv˘j meË.
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_04"); //S nÌm mÏ totiû nikdo neporazÌ, hochu! Kdyû mi ho p¯ineseö, klidnÏ si s tebou zase zabojuju!
			
			Alrik_VomSchwertErzaehlt = TRUE;
			
			Log_CreateTopic (TOPIC_AlrikSchwert,LOG_MISSION);
			Log_SetTopicStatus (TOPIC_AlrikSchwert,LOG_RUNNING);
			B_LogEntry (TOPIC_AlrikSchwert,"Alrik prodal sv˘j meË obchodnÌku Jorovi. Bude se se mnou bÌt pouze tehdy, pokud mu jej p¯inesu zp·tky.");
		};
	}
	
	// ----- EXIT: ‹BER DREI MAL Alrik_ArenaKampfVerloren ------
	else if (Kapitel <= 2)
	&& (Alrik_ArenaKampfVerloren > 3)
	{
		AI_Output (self, other, "DIA_Alrik_Add_09_00"); //MyslÌm, ûe to by prozatÌm mohlo staËit.
		AI_Output (self, other, "DIA_Alrik_Add_09_01"); //Nech mÏ trochu vydechnout.
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
		AI_Output (self, other, "DIA_Alrik_Add_09_04"); //Krom toho jsem uû dal dohromady dost penÏz.
		AI_Output (self, other, "DIA_Alrik_Add_09_05"); //KonËÌm a jdu si ve mÏstÏ najÌt nÏjakÈ mÌsto, kde bych mohl z˘stat.
		AI_Output (self, other, "DIA_Alrik_Add_09_06"); //Kdo vÌ, moûn· si otev¯u obchod se zbranÏmi.
	}
	
	// ------ normaler KAMPF ------
	else if (Wld_IsTime(11,00,19,00))
	{
		AI_Output (self ,other,"DIA_Alrik_WannaFight_09_07"); //M·ö 50 zlaù·k˘?
		Info_ClearChoices 	(DIA_Alrik_WannaFight);
		Info_AddChoice 		(DIA_Alrik_WannaFight, "Ani n·hodou...",	DIA_Alrik_WannaFight_NoGold);
		if (Npc_HasItems (other, itmi_gold) >= 50)
		{
			Info_AddChoice 		(DIA_Alrik_WannaFight, "Jak chceö...",	DIA_Alrik_WannaFight_Gold);
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Alrik_WannaFight_09_08"); //Bojuju jenom od obÏda do veËera.
		AI_Output (self ,other,"DIA_Alrik_WannaFight_09_09"); //Boj stojÌ za to jenom tehdy, kdyû je kolem dost div·k˘, co uzavÌrajÌ s·zky!
		if (Wld_IsTime(19,00,03,30))
		{
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_10"); //TeÔ uû je moc pozdÏ, vraù se zÌtra v poledne!
		}
		else // 03,30 - 11,00 
		{
			AI_Output (self ,other,"DIA_Alrik_WannaFight_09_11"); //TeÔ je jeötÏ brzo, vraù se pozdÏji!
		};
	};
};

func void DIA_Alrik_WannaFight_Gold()
{
	AI_Output (other, self,"DIA_Alrik_WannaFight_Gold_15_00"); //Jak si p¯ejeö.
	B_GiveInvItems (other, self, itmi_gold, 50);
	AI_Output (self ,other,"DIA_Alrik_WannaFight_Gold_09_01"); //(hlasitÏ) M·me tu novÈho vyzyvatele!
	AI_Output (self ,other,"DIA_Alrik_WannaFight_Gold_09_02"); //S·zky jsou uzav¯eny.
	
	Npc_RemoveInvItems (self, itmi_gold, Npc_HasItems(self, itmi_gold) );
	CreateInvItems (self, itmi_gold, 100); //50 vom Spieler und 50 Einsatz von Alrik...
	
	AI_Output (self ,other,"DIA_Alrik_WannaFight_Gold_09_03"); //Jsi p¯ipraven?
	
	//--------------------------------------
	self.aivar[AIV_ArenaFight] = AF_RUNNING;
	Alrik_Kaempfe 		= Alrik_Kaempfe + 1;
	//--------------------------------------
	
	Info_ClearChoices 	(DIA_Alrik_WannaFight);
	Info_AddChoice 		(DIA_Alrik_WannaFight, "JeötÏ chvilku...",	DIA_Alrik_WannaFight_Moment);
	Info_AddChoice 		(DIA_Alrik_WannaFight, "Tak pojÔ!",	DIA_Alrik_WannaFight_NOW);
};

func void DIA_Alrik_WannaFight_NoGold()
{
	AI_Output (other, self,"DIA_Alrik_WannaFight_NoGold_15_00"); //Ani n·hodou.
	AI_Output (self, other,"DIA_Alrik_WannaFight_NoGold_09_01"); //Tak je seûeÚ! Bez s·zek nenÌ û·dn˝ boj!
	
	Info_ClearChoices 	(DIA_Alrik_WannaFight);
};

func void DIA_Alrik_WannaFight_NOW()
{
	AI_Output (other, self,"DIA_Alrik_WannaFight_NOW_15_00"); //Tak pojÔ!
	AI_Output (self, other,"DIA_Alrik_WannaFight_NOW_09_01"); //Tak uvidÌme, jak to zvl·dneö!
	
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
	AI_Output (other, self,"DIA_Alrik_WannaFight_Moment_15_00"); //JeötÏ chvilku.
	AI_Output (self, other,"DIA_Alrik_WannaFight_Moment_09_01"); //KlidnÏ si dej na Ëas - j· zaËÌn·m teÔ!
	
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
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_00"); //P·ni, chlape, ty m·ö ale sÌlu!
			
			if (Npc_HasItems (self, itmi_gold) >= 100)
			{
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_01"); //Tady m·ö tÏch 100 zlaù·k˘, zaslouûil sis je!
				B_GiveInvItems (self, other, itmi_gold, 100);
			}
			else if (Npc_HasItems (self, itmi_gold) == 0)
			{
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_02"); //VidÌm, ûe svÈ zlato sis uû vzal.
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_03"); //MÏls ale poËkat, aû ti je d·m - j· svÈ slovo drûÌm!
			}
			else //zwischen 1 und 99 Gold...
			{
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_04"); //Tys mÏ ale proöacoval, kdyû jsem byl v bezvÏdomÌ!
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_05"); //To nenÌ dobr˝, chlape! No, nevadÌ, ty prachy ti stejnÏ pat¯ily - a tady je zbytek!
				B_GiveInvItems (self, other, itmi_gold, Npc_HasItems(self, itmi_gold) );
			};
			
			Alrik_ArenaKampfVerloren = Alrik_ArenaKampfVerloren + 1;
		}
		else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_06"); //To byl dobr˝ boj. S·zku jsi sice prohr·l - nic si z toho ale nedÏlej, p¯ispÏls na dobrou vÏc! (uöklÌbne se)
		}
		else //FIGHT_CANCEL
		{
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_07"); //Hej, jak jsem ¯ekl, kaûd˝, kdo se vzd·lÌ ze z·pasiötÏ, prohr·l! Jestli to chceö ale zkusit znova, jsem ti k dispozici!
		};
		
		// ------ nur einmal ------
		if (Alrik_Kaempfe == 1)
		{
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_08"); //A jeötÏ jedna vÏc: o tom, co se dÏje za skladiötÏm, se nemluvÌ.
			
			if (other.guild != GIL_MIL)
			&& (other.guild != GIL_PAL)
			{
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_09"); //Domobrana tÏ m˘ûe öoupnout za m¯Ìûe za sebemenöÌ proh¯eöek - a s·zenÌ na souboje se jim rozhodnÏ moc nelÌbÌ.
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
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_10"); //Boj skonËil, b¯Ìdile!
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_11"); //NelÌbÌ se mi, kdyû nÏkdo poruöuje pravidla.
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_12"); //Vypadni odsud!
		}
		else //einfach so angegriffen (unvorbereitet)
		{
			if (Alrik_Kaempfe == 0)
			{	
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_13"); //Jestlis se mnou chtÏl bojovat, staËilo, abys mÏ prostÏ vyzval.
			}
			else // > 0
			{
				AI_Output (self, other,"DIA_Alrik_AfterFight_09_14"); //Jestli chceö dalöÌ boj, tak mÏ k nÏmu prostÏ vyzvi!
			};
			
			AI_Output (self, other,"DIA_Alrik_AfterFight_09_15"); //S takov˝mi pobudy, jako jsi ty, nechci nic mÌt! Odpal!
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
	description = "Ty 'bydlÌö' za skladiötÏm?";
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
	AI_Output (other,self ,"DIA_Alrik_DuWohnst_15_00"); //(p¯ekvapenÏ) Ty bydlÌö za skladiötÏm?
	AI_Output (self ,other,"DIA_Alrik_DuWohnst_09_01"); //Je to jenom doËasnÈ. (uöklÌbne se) Kdybys mÏl tolik penÏz co j·, taky by sis dop¯·l trochu pohodlÌ!
	AI_Output (self ,other,"DIA_Alrik_DuWohnst_09_02"); //B˝val jsem v˝cvikov˝m instruktorem v arm·dÏ, ale pak jsem toho nechal a vydal se za dobrodruûstvÌm.
	AI_Output (self ,other,"DIA_Alrik_DuWohnst_09_03"); //A teÔ jsem skonËil v t˝hle öpinav˝ dÌ¯e a poslednÌch 100 zlaù·k˘ vysolil str·ûÌm u br·ny.
	AI_Output (self ,other,"DIA_Alrik_DuWohnst_09_04"); //Takûe teÔ kouk·m zase p¯ijÌt k nÏjak˝m penÏz˘m. Dokonce jsem musel prodat i sv˘j meË.
	
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
	description = "Komu jsi sv˘j meË prodal?";
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
	AI_Output (other,self ,"DIA_Alrik_WerSchwert_15_00"); //Komu jsi sv˘j meË prodal?
	AI_Output (self ,other,"DIA_Alrik_WerSchwert_09_01"); //U jednoho obchodnÌka na trûiöti jsem ho vymÏnil za nÏjakÈ z·soby.
	AI_Output (self ,other,"DIA_Alrik_WerSchwert_09_02"); //Ten chl·pek se jmenuje Jora. Ty pochodnÏ a trochu jÌdla, co mi dal, jsem uû d·vno spot¯eboval.
	AI_Output (other,self ,"DIA_Alrik_WerSchwert_15_03"); //Ten meË mi ale asi jen tak zadarmo ned·.
	AI_Output (self ,other,"DIA_Alrik_WerSchwert_09_04"); //Ten meË je star˝ a nejspÌö za nÏj moc chtÌt nebude. Mysli p¯itom na prachy, kterÈ si vydÏl·ö na s·zk·ch p¯i z·pase. (uöklÌbne se)
		
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
	description = "M·m ten tv˘j meË.";
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
	AI_Output (other,self ,"DIA_Alrik_HaveSword_15_00"); //M·m ten tv˘j meË.
	B_GiveInvItems (other,self,ItMW_AlriksSword_Mis,1);
	
	if (MIS_Alrik_Sword != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Alrik_HaveSword_09_01"); //P·ni! To je mnohem lepöÌ neû bojovat s nÏjak˝m star˝m klackem!
		
		MIS_Alrik_Sword = LOG_SUCCESS;
		B_GivePlayerXP (XP_AlriksSword);
	}
	else
	{	
		AI_Output (self ,other,"DIA_Alrik_HaveSword_09_02"); //SkvÏlÈ! Jsem zvÏdav, jestli se mÏ teÔ odv·ûÌö vyzvat jeötÏ jednou!
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
	description = "Co vÌö o tÈ v·lce se sk¯ety?";
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
	AI_Output (other,self ,"DIA_Alrik_Krieg_15_00"); //Co vÌö o tÈ v·lce se sk¯ety?
	AI_Output (self ,other,"DIA_Alrik_Krieg_09_01"); //K tomu nenÌ moc co ¯Ìct. Ta v·lka prostÏ trv· uû moc dlouho.
	AI_Output (self ,other,"DIA_Alrik_Krieg_09_02"); //Cel· zemÏ hladovÌ. Vöude propukajÌ rolnickÈ nepokoje, kterÈ kr·l nemilosrdnÏ potÌr·.
	AI_Output (self ,other,"DIA_Alrik_Krieg_09_03"); //Ale moc mu to nepom˘ûe - tÏch vzpour je uû je moc. Jestli v·lka brzo neskonËÌ, cel· ¯Ìöe se rozpadne.
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
	description = "M˘ûeö mÏ uËit?";
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
	AI_Output (other,self ,"DIA_Alrik_Ausbilden_15_00"); //M˘ûeö mÏ uËit?
	
	if (Alrik_Kaempfe == 0)
	&& (hero.guild == GIL_NONE)
	{
		AI_Output (self ,other,"DIA_Alrik_Ausbilden_09_01"); //Jestli se opravdu chceö nauËit bojovat, tak si to pojÔ rozdat se mnou. (dom˝ölivÏ) A ani si za tu lekci nebudeö muset p¯iplatit.
		Alrik_VorausErzaehlt = TRUE; 
	}
	else //>0
	{
		if (Alrik_VorausErzaehlt == TRUE)
		{
			AI_Output (self ,other,"DIA_Alrik_Ausbilden_09_02"); //DodrûÌm slovo a nauËÌm tÏ vöechno, co zn·m - pokud m·ö tedy dostatek zkuöenostÌ.
		}
		else
		{
			AI_Output (self ,other,"DIA_Alrik_Ausbilden_09_03"); //Jestli m·ö dostatek zkuöenostÌ, tak jasnÏ!
		};
		
		
		Alrik_Teach1H = TRUE;
		Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
		B_LogEntry (Topic_CityTeacher,"Alrik mÏ vycviËÌ v boji s jednoruËnÌmi zbranÏmi. Potlouk· se kdesi za skladiötÏm v p¯ÌstavnÌ Ëtvrti.");
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
	description = "VycviË mÏ v boji s meËem!";
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
	AI_Output (other,self ,"DIA_Alrik_Teach_15_00"); //VycviË mÏ v boji s meËem!
	
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
		AI_Output (self ,other,"DIA_Alrik_Teach_Back_09_00"); //Uû nejsi û·dn˝ nov·Ëek!
	}
	else if (other.HitChance[NPC_TALENT_1H] > Alrik_Merke_1h)
	{
		AI_Output (self ,other,"DIA_Alrik_Teach_Back_09_01"); //Uû ses po¯·dnÏ zlepöil - brzo z tebe bude po¯·dn˝ bojovnÌk!
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



		






		







