// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Thorben_EXIT(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 999;
	condition	= DIA_Thorben_EXIT_Condition;
	information	= DIA_Thorben_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Thorben_EXIT_Condition()
{
		return TRUE;
};
FUNC VOID DIA_Thorben_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Thorben_PICKPOCKET (C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 900;
	condition	= DIA_Thorben_PICKPOCKET_Condition;
	information	= DIA_Thorben_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Thorben_PICKPOCKET_Condition()
{
	C_Beklauen (30, 28);
};
 
FUNC VOID DIA_Thorben_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Thorben_PICKPOCKET);
	Info_AddChoice		(DIA_Thorben_PICKPOCKET, DIALOG_BACK 		,DIA_Thorben_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Thorben_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Thorben_PICKPOCKET_DoIt);
};

func void DIA_Thorben_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Thorben_PICKPOCKET);
};
	
func void DIA_Thorben_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Thorben_PICKPOCKET);
};

// ************************************************************
// 		NEWS - Gritta ist tot Thorben ist angepisst
// ************************************************************
INSTANCE DIA_Thorben_angepisst(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 1;
	condition	= DIA_Thorben_angepisst_Condition;
	information	= DIA_Thorben_angepisst_Info;
	permanent	= TRUE;
	important   = TRUE; 
};                       
FUNC INT DIA_Thorben_angepisst_Condition()
{	
	if (Npc_IsDead (Gritta))
	&& (Npc_IsInState (self, ZS_Talk))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_angepisst_Info()
{	
	AI_Output (self, other,"DIA_Thorben_angepisst_06_00"); //Zavradil jsi moji Grittu. To ti nikdy neodpustím. Bì mi z oèí, vrahu!
	AI_StopProcessInfos (self);
};

// ************************************************************
// 		Hallo
// ************************************************************
INSTANCE DIA_Thorben_Hallo(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Hallo_Condition;
	information	= DIA_Thorben_Hallo_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Thorben_Hallo_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Hallo_Info()
{	
	AI_Output (self, other,"DIA_Thorben_Hallo_06_00"); //Á! Nová tváø. Ty nejsi z Khorinidu, co?
	AI_Output (self, other,"DIA_Thorben_Hallo_06_01"); //Tohle není ta správná doba pro poutníky. Všude samí banditi, ádná práce a teï si ještì zaèali vyskakovat rolníci.
	AI_Output (self, other,"DIA_Thorben_Hallo_06_02"); //Co tì sem pøivádí?
};

// ************************************************************
// 		Suche Arbeit			//E1
// ************************************************************
INSTANCE DIA_Thorben_Arbeit(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Arbeit_Condition;
	information	= DIA_Thorben_Arbeit_Info;
	permanent	= FALSE;
	description = "Hledám práci.";
};                       
FUNC INT DIA_Thorben_Arbeit_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Thorben_Arbeit_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_00"); //Hledám práci.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_01"); //Víš nìco o truhlaøinì?
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_02"); //Jedinı, co dokáu ze døeva udìlat, je oheò.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_03"); //A co zámky?
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_04"); //Noooo...
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_05"); //Je mi líto, ale pokud o mém øemesle nic nevíš, nemùu tì potøebovat.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_06"); //A nemám peníze na to, abych si platil uèedníka.
	
	Log_CreateTopic (TOPIC_Lehrling,LOG_MISSION); 
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling, "Thorben mì do uèení nepøijme.");
};

// ************************************************************
// 		Bei anderem Meister		(MIS Blessings)	//E2
// ************************************************************
INSTANCE DIA_Thorben_OtherMasters(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_OtherMasters_Condition;
	information	= DIA_Thorben_OtherMasters_Info;
	permanent	= FALSE;
	description = "Co kdybych chtìl zaèít jako uèedník u jednoho z ostatních mistrù?";
};                       
FUNC INT DIA_Thorben_OtherMasters_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_OtherMasters_Info()
{	
	AI_Output (other, self,"DIA_Thorben_OtherMasters_15_00"); //Co kdybych chtìl zaèít jako uèedník u jednoho z ostatních mistrù?
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_01"); //Dobrá, dám ti své doporuèení.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_02"); //Ale nejdøív bys mìl získat poehnání od bohù.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_03"); //Øekni, jsi zbonı mu?
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_PAL)
	{
		Info_AddChoice (DIA_Thorben_OtherMasters, "No, kdy myslíš, e bych se mìl modlit pravidelnì...", DIA_Thorben_OtherMasters_Naja);
	};
	Info_AddChoice (DIA_Thorben_OtherMasters, "Ano. Nejpokornìjší sluebník, mistøe Thorbne.", DIA_Thorben_OtherMasters_Devoutly);
};

func void B_Thorben_GetBlessings()
{
	AI_Output (self, other,"B_Thorben_GetBlessings_06_00"); //Tak to jdi za Vatrasem, Adanovım knìzem, a popros ho, a ti poehná.
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_PAL)
	{
		AI_Output (self, other,"B_Thorben_GetBlessings_06_01"); //On u ti øekne, kde najít Innosovy knìze. Taky od nìj mùeš dostat poehnání.
	};
	AI_Output (self, other,"B_Thorben_GetBlessings_06_02"); //Jakmile získáš poehnání, máš mùj souhlas.
	
	MIS_Thorben_GetBlessings = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_Thorben,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Thorben,LOG_RUNNING);
	B_LogEntry (TOPIC_Thorben,"Thorben se za mì pøimluví teprve tehdy, a si vyprosím poehnání od Adanova a Innosova knìze.");
};

func void DIA_Thorben_OtherMasters_Devoutly()
{
	AI_Output (other, self,"DIA_Thorben_OtherMasters_Devoutly_15_00"); //Ano. Nejpokornìjší sluebník, mistøe Thorbene.
	B_Thorben_GetBlessings();
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
};

func void DIA_Thorben_OtherMasters_Naja()
{
	AI_Output (other, self,"DIA_Thorben_OtherMasters_Naja_15_00"); //No, kdy myslíš, e bych se mìl modlit pravidelnì...
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_01"); //Já si to nemyslím. Vím to!
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_02"); //Nìkdo, kdo není dostateènì zbonı, mùj souhlas nikdy nezíská.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_03"); //Pros bohy za shovívavost nad tvımi høíchy.
	B_Thorben_GetBlessings();
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
};

// ************************************************************
// 		ZUSTIMMUNG		//E3  (PERM)
// ************************************************************
INSTANCE DIA_Thorben_ZUSTIMMUNG(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 1;
	condition	= DIA_Thorben_ZUSTIMMUNG_Condition;
	information	= DIA_Thorben_ZUSTIMMUNG_Info;
	permanent	= TRUE;
	description = "Tak jak s tím doporuèením, mistøe?";
};                       
FUNC INT DIA_Thorben_ZUSTIMMUNG_Condition()
{	
	if (Player_IsApprentice == APP_NONE)
	&& (MIS_Thorben_GetBlessings == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_ZUSTIMMUNG_Info()
{	
	AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_00"); //Tak jak s tím doporuèením, mistøe?
	AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_01"); //Poehnal ti Vatras?
	
	if (Vatras_Segen == TRUE)
	{
		AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_02"); //Ano.
		AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_03"); //A získal jsi také poehnání Innose?
		
		if (Daron_Segen == TRUE)
		|| (Isgaroth_Segen == TRUE)
		|| (other.guild == GIL_KDF)
		{
			AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_04"); //Ano, získal.
			AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_05"); //V tom pøípadì máš i mé poehnání. Nezáleí na tom, jakou cestu sis vybral - buï hrdı na svou práci, chlapèe!
			
			MIS_Thorben_GetBlessings = LOG_SUCCESS;
			B_GivePlayerXP (XP_Zustimmung);
			
			Log_CreateTopic (TOPIC_Lehrling,LOG_MISSION);
			Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
			B_LogEntry (TOPIC_Lehrling,"Budu-li k nìkomu chtít vstoupit do uèení, Thorben se za mì pøimluví.");
		}
		else
		{
			AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_06"); //Ne. Ještì ne.
			AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_07"); //Znáš moje podmínky. Svım záleitostem se mùeš vìnovat jen s poehnáním bohù.
		};
	}
	else
	{
		AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_08"); //Ještì ne...
		AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_09"); //V tom pøípadì nevím, proè se mì znovu ptáš. Znáš moje podmínky.
	};
};

// ************************************************************
// 		Was weißt du über Schlösser?		//E2
// ************************************************************
INSTANCE DIA_Thorben_Locksmith(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Locksmith_Condition;
	information	= DIA_Thorben_Locksmith_Info;
	permanent	= FALSE;
	description = "Tak ty se vyznáš v zámcích?";
};                       
FUNC INT DIA_Thorben_Locksmith_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Locksmith_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Locksmith_15_00"); //Tak ty se vyznáš v zámcích?
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_01"); //Co by to bylo za poøádnou truhlu bez dobrého zámku?
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_02"); //Vyrábím si své vlastní zámky. Takhle si mùu bıt pøinejmenším jistı, e jsem neudìlal bytelnou truhlu jen tak pro nic za nic.
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_03"); //Odbytı zámek se dá snadno zlomit. A tady v Khorinidu se všude kolem potuluje spousta zlodìjù. Zvláštì poslední dobou!
};

// ************************************************************
// 		Schuldenbuch
// ************************************************************
INSTANCE DIA_Thorben_Schuldenbuch(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Schuldenbuch_Condition;
	information	= DIA_Thorben_Schuldenbuch_Info;
	permanent	= FALSE;
	description = "Mám tady Lehmarovu úèetní knihu...";
};                       
FUNC INT DIA_Thorben_Schuldenbuch_Condition()
{	
	if (Npc_HasItems (other, ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Schuldenbuch_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_00"); //Mám tady Lehmarovu úèetní knihu.
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_01"); //(podezíravì) Jak ses k tomu dostal?
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_02"); //Spíš by tì mìlo zajímat, e je v ní tvé jméno.
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_03"); //Dej to sem!
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_04"); //A co mi za to dáš?
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_05"); //Nemám peníze nazbyt a nemùu ti dát nic jiného ne mé srdeèné podìkování.
	B_GivePlayerXP (XP_Schuldenbuch);
};

// ************************************************************
// 		Kann ich Schlösser knacken lernen		//E3
// ************************************************************
INSTANCE DIA_Thorben_PleaseTeach(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_PleaseTeach_Condition;
	information	= DIA_Thorben_PleaseTeach_Info;
	permanent	= TRUE;
	description = "Mùeš mì nauèit, jak páèit zámky?";
};                       
FUNC INT DIA_Thorben_PleaseTeach_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Locksmith))
	&& (Thorben_TeachPlayer == FALSE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_PleaseTeach_Info()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_15_00"); //Mùeš mì nauèit, jak páèit zámky?
		
	if (Npc_HasItems (self, ItWr_Schuldenbuch) > 0)
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_01"); //Kdyby nebylo tebe, budu Lehmarovi platit po celı zbytek svého ivota.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_02"); //Nauèím tì, co budeš chtít.
		Thorben_TeachPlayer = TRUE;
	}
	else if (Thorben_GotGold == TRUE) //100 Gold bekommen
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_03"); //Pøinesl jsi mi 100 zlatıch. To od tebe bylo velmi milé.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_04"); //Pøivádí mì to do rozpakù, ale musím tì poádat ještì o jednu laskavost.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_05"); //Jeliko v dohledné dobì nemùu Lehmarovi svùj dluh splatit, chystá se na mì poslat ty své gorily.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_06"); //Dej mi ještì dalších 100 zlatıch a já tì zaènu uèit.

		Info_ClearChoices (DIA_Thorben_PleaseTeach);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Kolik?", DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Dobrá. Tady je 100 zlatıch.", DIA_Thorben_PleaseTeach_Pay100);
	}
	else if (MIS_Matteo_Gold == LOG_SUCCESS) //Grittas Schulden bezahlt
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_07"); //Zaplatil jsi Grittin dluh u Mattea. Vypadáš jako správnı chlap. Nauèím tì, co budeš chtít.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_08"); //Nicménì nemùu to dìlat zadarmo. Ještì poøád mám fùru dluhù a potøebuju peníze.
		AI_Output (other, self,"DIA_Thorben_PleaseTeach_15_09"); //Kolik?
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_10"); //200 zlatıch.
		
		Info_ClearChoices (DIA_Thorben_PleaseTeach);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Kolik?", DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Dobrá. Tady je 200 zlatıch.", DIA_Thorben_PleaseTeach_Pay200);
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_11"); //Hmm... nevím, jestli se ti dá vìøit, nebo ne.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_12"); //Podle toho, co vím, mùeš klidnì bıt jedním z tìch darmošlapù, co pøišli do mìsta jen proto, aby vyprázdnili truhlice bohatıch lidí.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_13"); //Nebudu tì uèit nic, dokud se nepøesvìdèím, e jsi dobrı èlovìk.
	};
};

func void DIA_Thorben_PleaseTeach_Pay200()
{
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Pay200_15_00"); //Dobrá. Tady je 200 zlatıch.
	
	if (B_GiveInvItems (other, self, ItMi_Gold, 200))
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay200_06_01"); //Tyhle peníze by mi mìly pomoct. Mùeme zaèít hned, jak budeš pøipraven.
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay200_06_02"); //Ještì poøád ti do 200 zlatıch pár mincí chybí. Ty peníze potøebuju.
	};
	
	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};

func void DIA_Thorben_PleaseTeach_Pay100()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Pay100_15_00"); //Dobrá. Tady je 100 zlatıch.
		
	if (B_GiveInvItems (other, self, ItMi_Gold, 100))
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay100_06_01"); //V tom pøípadì mùeme zaèít hned, jak budeš pøipraven.
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay100_06_02"); //Hej, ještì poøád ti do 100 zlatıch chybí pár mincí.
	};
	
	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};
	
func void DIA_Thorben_PleaseTeach_Later()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Later_15_00"); //Moná pozdìji.

	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};

// ************************************************************
// 		Schlösser knacken lernen		//E4
// ************************************************************
INSTANCE DIA_Thorben_Teach(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Teach_Condition;
	information	= DIA_Thorben_Teach_Info;
	permanent	= TRUE;
	description = B_BuildLearnString("Nauè mì páèit zámky!", B_GetLearnCostTalent(other, NPC_TALENT_PICKLOCK, 1));
};                       
FUNC INT DIA_Thorben_Teach_Condition()
{	
	if (Thorben_TeachPlayer == TRUE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Teach_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Teach_15_00"); //Nauè mì páèit zámky!
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_PICKLOCK)
	{
		AI_Output (self, other,"DIA_Thorben_Teach_06_01"); //Potøebuješ akorát nìjakı paklíè. Pokud jím budeš v zámku opatrnì otáèet doprava a doleva, mùeš mechanismus otevøít.
		AI_Output (self, other,"DIA_Thorben_Teach_06_02"); //Ale pokud otoèíš pøíliš rychle nebo moc silnì ve špatném smìru, paklíè se zlomí.
		AI_Output (self, other,"DIA_Thorben_Teach_06_03"); //Èím budeš obratnìjší, tím ménì budeš potøebovat paklíèù. To je všechno, opravdu.
	};
};

// ************************************************************
// 		TRADE (PERM)
// ************************************************************
INSTANCE DIA_Thorben_TRADE(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 3;
	condition	= DIA_Thorben_TRADE_Condition;
	information	= DIA_Thorben_TRADE_Info;
	permanent	= TRUE;
	description = "Mùeš mi prodat nìjaké paklíèe?";
	trade		= TRUE;
};                       
FUNC INT DIA_Thorben_TRADE_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Locksmith))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_TRADE_Info()
{	
	AI_Output (other, self,"DIA_Thorben_TRADE_15_00"); //Mùeš mi prodat nìjaké paklíèe?
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) > 0)
	{
		AI_Output (self, other,"DIA_Thorben_TRADE_06_01"); //Pokud mi ještì nìjaké zbyly...
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_TRADE_06_02"); //No tak dobrá. Ale dokud nevíš, jak s nimi zacházet, tak ti budou k nièemu.
	};
	
	if (Npc_HasItems (self, ITke_Lockpick) == 0) 
	&& (Kapitel > Dietrichgeben) 
	{
		CreateInvItems (self, ITKE_LOCKPICK,5);
		Dietrichgeben = Dietrichgeben +1;
	};
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Tesaø Thorben prodává paklíèe."); 
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Thorben_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_462_Thorben;
	nr		 = 	4;
	condition	 = 	DIA_Addon_Thorben_MissingPeople_Condition;
	information	 = 	DIA_Addon_Thorben_MissingPeople_Info;

	description	 = 	"Ty u jsi nìkdy nìjakého uèedníka mìl?";
};

func int DIA_Addon_Thorben_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (Elvrich_GoesBack2Thorben == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Thorben_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Thorben_MissingPeople_15_00"); //U jsi nìkdy mìl nìjakého uèedníka?
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_01"); //Jo, a ani to není tak dávno.
	AI_Output	(other, self, "DIA_Addon_Thorben_MissingPeople_15_02"); //A co se stalo?
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_03"); //Jmenoval se Elvrich. Byl to mùj synovec.
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_04"); //A byl jsem s ním docela spokojenı, ale jednoho dne prostì nepøišel do práce.
	
	MIS_Thorben_BringElvrichBack = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Elvrich, uèedník tesaøe Thorbena, zmizel."); 
	
	Info_ClearChoices	(DIA_Addon_Thorben_MissingPeople);
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, DIALOG_BACK, DIA_Addon_Thorben_MissingPeople_Back );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "A ohlásil jsi to domobranì?", DIA_Addon_Thorben_MissingPeople_Mil );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "Jak je to dlouho, co jsi ho vidìl naposledy?", DIA_Addon_Thorben_MissingPeople_wann );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "Kde je Elvrich teï?", DIA_Addon_Thorben_MissingPeople_where );
};

func void DIA_Addon_Thorben_MissingPeople_Back ()
{
	Info_ClearChoices	(DIA_Addon_Thorben_MissingPeople);
};

func void DIA_Addon_Thorben_MissingPeople_wann ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_wann_15_00"); //Jak je to dlouho, co jsi ho nevidìl?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_wann_06_01"); //Asi tak ètrnáct dní.
};

func void DIA_Addon_Thorben_MissingPeople_where ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_where_15_00"); //Kde je Elvrich teï?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_where_06_01"); //Jak to mám vìdìt? Ale furt se poflakoval kolem toho špinavıho bordelu v pøístavu.
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_where_06_02"); //Ani by mì nepøekvapilo, kdyby si tam ještì teï uíval s nìjakou štìtkou.
};

func void DIA_Addon_Thorben_MissingPeople_Mil ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_Mil_15_00"); //Ohlásil jsi to domobranì?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_Mil_06_01"); //Samozøejmì. Mìli ho chytit a dohlídnout, aby se ta líná kùe vrátila zpátky do práce. Ale já u to stejnì zabalil.
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_Mil_06_02"); //A si dìlá, co chce. Døív nebo pozdìji stejnì zjistí, e bez slušné práce si v Khorinidu neškrtne.
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_Mil_15_03"); //(cynicky) Opravdu?
};

///////////////////////////////////////////////////////////////////////
//	Info ElvrichIsBack
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Thorben_ElvrichIsBack		(C_INFO)
{
	npc		 = 	VLK_462_Thorben;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Thorben_ElvrichIsBack_Condition;
	information	 = 	DIA_Addon_Thorben_ElvrichIsBack_Info;

	description	 = 	"Elvrich pro tebe bude od nynìjška znovu pracovat.";
};

func int DIA_Addon_Thorben_ElvrichIsBack_Condition ()
{
	if (Elvrich_GoesBack2Thorben == TRUE)
	&& ((Npc_IsDead(Elvrich)) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_ElvrichIsBack_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Thorben_ElvrichIsBack_15_00"); //Odteïka pro tebe bude Elvrich znovu pracovat.
	AI_Output	(self, other, "DIA_Addon_Thorben_ElvrichIsBack_06_01"); //Mùu jenom doufat, e nezmizí znova, a se kolem ochomıtne nìjaká suknì.
	AI_Output	(self, other, "DIA_Addon_Thorben_ElvrichIsBack_06_02"); //Za to, e jsi mi pøivedl uèedníka, si vezmi tohle zlato.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);
	MIS_Thorben_BringElvrichBack = LOG_SUCCESS;
	VLK_4302_Addon_Elvrich.flags = 0;
};

// ************************************************************
// 		Paladine		//E1
// ************************************************************
INSTANCE DIA_Thorben_Paladine(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 4;
	condition	= DIA_Thorben_Paladine_Condition;
	information	= DIA_Thorben_Paladine_Info;
	permanent	= FALSE;
	description = "Co víš o paladinech?";
};                       
FUNC INT DIA_Thorben_Paladine_Condition()
{	
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Thorben_Paladine_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Paladine_15_00"); //Co víš o paladinech?
	AI_Output (self, other,"DIA_Thorben_Paladine_06_01"); //Nic moc. Pøed dvìma tıdny sem na lodi pøipluli z pevniny.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_02"); //Od té doby jsou zavøení v horní èásti mìsta.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_03"); //Nikdo tady poøádnì neví, proè vlastnì pøijeli.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_04"); //Hodnì lidí se obává útoku skøetù.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_05"); //Ale já si stejnì myslím, e jsou tu kvùli rolnické vzpouøe.
};

// ************************************************************
// 		Bauernaufstand		//E2
// ************************************************************
INSTANCE DIA_Thorben_Bauernaufstand(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 4;
	condition	= DIA_Thorben_Bauernaufstand_Condition;
	information	= DIA_Thorben_Bauernaufstand_Info;
	permanent	= FALSE;
	description = "Víš nìco o té rolnické vzpouøe?";
};                       
FUNC INT DIA_Thorben_Bauernaufstand_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Paladine))
	&& (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Bauernaufstand_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Bauernaufstand_15_00"); //Víš nìco o té rolnické vzpouøe?
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_01"); //Povídá se, e si velkostatkáø Onar najal oldnéøe, aby ho chránili pøed královskımi vojsky.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_02"); //Asi u mìl dost toho, e mu paladinové a domobrana poøád berou úrodu a dobytek.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_03"); //Jediné, co jsme tady ve mìstì zaznamenali, je neustálé zvyšování cen potravin.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_04"); //Onarova farma leí na vıchod odsud, je to docela daleko. Nevíme, jestli se tam k nìèemu chystá.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_05"); //Pokud se chceš dozvìdìt víc, zeptej se kupcù na trišti. Mají o ostrovì vìtší pøehled ne já.
};

// ************************************************************
// 		Gritta
// ************************************************************
INSTANCE DIA_Thorben_Gritta(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 5;
	condition	= DIA_Thorben_Gritta_Condition;
	information	= DIA_Thorben_Gritta_Info;
	permanent	= FALSE;
	description = "Pøišel jsem kvùli Grittì...";
};                       
FUNC INT DIA_Thorben_Gritta_Condition()
{	
	if (MIS_Matteo_Gold == LOG_RUNNING)
	&& (!Npc_IsDead (Gritta))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Gritta_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Gritta_15_00"); //Pøišel jsem kvùli Grittì.
	AI_Output (self, other,"DIA_Thorben_Gritta_06_01"); //Mé neteøi? O co jde? Není to nic s penìzi, e ne?
	AI_Output (other, self,"DIA_Thorben_Gritta_15_02"); //Dluí 100 zlatıch kupci Matteovi.
	
	AI_Output (self, other,"DIA_Thorben_Gritta_06_03"); //Øekni, e to není pravda. Od té doby, co se ke mnì ta malá lenoška nastìhovala, mám jen samé potíe!
	AI_Output (self, other,"DIA_Thorben_Gritta_06_04"); //Má dluh snad u kadého kupce ve mìstì.
	AI_Output (self, other,"DIA_Thorben_Gritta_06_05"); //Musel jsem si pùjèit 200 zlatıch u lichváøe jen proto, abych vyrovnal její dluhy. A teï tohle!
	if (Npc_GetDistToWP(self, "NW_CITY_MERCHANT_SHOP01_FRONT_01") < 500)
	{
		AI_Output (self, other,"DIA_Thorben_Gritta_06_06"); //Gritta by mìla bıt v domì.
	};
	AI_Output (self, other,"DIA_Thorben_Gritta_06_07"); //Jdi dál, jen se jí zeptej. Ale mùu ti øíct jedno: nemá ani zlatku.
	if (Npc_HasItems(Gritta, itmi_gold) >= 100)
	{
		AI_Output (other, self,"DIA_Thorben_Gritta_15_08"); //Uvidíme...
	};
};

// ************************************************************
// 		Grittas Gold genommen
// ************************************************************
INSTANCE DIA_Thorben_GrittaHatteGold(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 5;
	condition	= DIA_Thorben_GrittaHatteGold_Condition;
	information	= DIA_Thorben_GrittaHatteGold_Info;
	permanent	= FALSE;
	description = "Tvá neteø mi dala 100 zlatıch.";
};                       
FUNC INT DIA_Thorben_GrittaHatteGold_Condition()
{	
	if (Npc_KnowsInfo(other, DIA_Thorben_Gritta))
	&& (Npc_HasItems(Gritta, itmi_gold) < 100)
	&& (!Npc_IsDead (Gritta))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_GrittaHatteGold_Info()
{	
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_15_00"); //Tvá neteø mi dala 100 zlatıch.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_06_01"); //CO? Ta malá nestydatá zmije - to bylo MOJE zlato! Vzala ho z mé truhly.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_06_02"); //Vra mi to! Musím nejdøív zaplatit Lehmarovi. Matteo dostane své peníze pozdìji!

	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
	if (MIS_Matteo_Gold == LOG_SUCCESS)
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "U jsem dal Matteovi jeho zlato!", DIA_Thorben_GrittaHatteGold_MatteoHatEs);
	}
	else
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "Ne. Ty peníze jsou Matteovy.", DIA_Thorben_GrittaHatteGold_MatteoSollHaben);
	};

	if (Npc_HasItems(other, itmi_gold) >= 100)
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "Tady je zlato.", DIA_Thorben_GrittaHatteGold_HereItIs);
	};
};

func void B_Thorben_DeletePetzCrimeGritta()
{
	if (Gritta_GoldGiven == FALSE)
	{
		AI_Output (self, other,"B_Thorben_DeletePetzCrimeGritta_06_00"); //A co vím o té malé zmiji, jsem si jistı, e bìela pøímo za mìstskou stráí, aby tì taky obvinila!
		AI_Output (self, other,"B_Thorben_DeletePetzCrimeGritta_06_01"); //Dohlédnu na to, aby se to nìjak vyøešilo.
		B_DeletePetzCrime (Gritta);
	};
};

func void DIA_Thorben_GrittaHatteGold_MatteoHatEs()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_15_00"); //U jsem dal Matteovi jeho zlato!
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_06_01"); //Sakra! Dobrá - dluh je dluh. Alespoò e sis ty peníze nenechal. Asi bych ti za to mìl podìkovat.
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_MatteoSollHaben()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_15_00"); //Ne. Ty peníze jsou Matteovy.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_01"); //Takhle mì dostaneš do poøádnıch trablù. Lehmar není zrovna pøehnanì shovívavı, kdy pøijde øeè na dluhy.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_02"); //Ale pøinejmenším se chystáš splatit dluh mé neteøe. Asi bych ti za to mìl podìkovat.
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_HereItIs()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_HereItIs_15_00"); //Tady je zlato.
	B_GiveInvItems(other, self, itmi_gold, 100);
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_01"); //Díky! Koneènì mám alespoò èást penìz, co dluím Lehmarovi.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_02"); //Nemùu uvìøit tomu, e mìla tu drzost vzít mé zlato!
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Thorben_GotGold = TRUE;
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};



















