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
	AI_Output (self, other,"DIA_Thorben_angepisst_06_00"); //Zavraždil jsi moji Grittu. To ti nikdy neodpustím. Bêž mi z oèí, vrahu!
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
	AI_Output (self, other,"DIA_Thorben_Hallo_06_00"); //Á! Nová tváâ. Ty nejsi z Khorinidu, co?
	AI_Output (self, other,"DIA_Thorben_Hallo_06_01"); //Tohle není ta správná doba pro poutníky. Všude samí banditi, žádná práce a teë si ještê zaèali vyskakovat rolníci.
	AI_Output (self, other,"DIA_Thorben_Hallo_06_02"); //Co tê sem pâivádí?
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
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_01"); //Víš nêco o truhlaâinê?
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_02"); //Jediný, co dokážu ze dâeva udêlat, je oheà.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_03"); //A co zámky?
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_04"); //Noooo...
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_05"); //Je mi líto, ale pokud o mém âemesle nic nevíš, nemùžu tê potâebovat.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_06"); //A nemám peníze na to, abych si platil uèedníka.
	
	Log_CreateTopic (TOPIC_Lehrling,LOG_MISSION); 
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling, "Thorben mê do uèení nepâijme.");
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
	description = "Co kdybych chtêl zaèít jako uèedník u jednoho z ostatních mistrù?";
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
	AI_Output (other, self,"DIA_Thorben_OtherMasters_15_00"); //Co kdybych chtêl zaèít jako uèedník u jednoho z ostatních mistrù?
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_01"); //Dobrá, dám ti své doporuèení.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_02"); //Ale nejdâív bys mêl získat požehnání od bohù.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_03"); //Âekni, jsi zbožný muž?
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_PAL)
	{
		Info_AddChoice (DIA_Thorben_OtherMasters, "No, když myslíš, že bych se mêl modlit pravidelnê...", DIA_Thorben_OtherMasters_Naja);
	};
	Info_AddChoice (DIA_Thorben_OtherMasters, "Ano. Nejpokornêjší služebník, mistâe Thorbne.", DIA_Thorben_OtherMasters_Devoutly);
};

func void B_Thorben_GetBlessings()
{
	AI_Output (self, other,"B_Thorben_GetBlessings_06_00"); //Tak to jdi za Vatrasem, Adanovým knêzem, a popros ho, aã ti požehná.
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_PAL)
	{
		AI_Output (self, other,"B_Thorben_GetBlessings_06_01"); //On už ti âekne, kde najít Innosovy knêze. Taky od nêj mùžeš dostat požehnání.
	};
	AI_Output (self, other,"B_Thorben_GetBlessings_06_02"); //Jakmile získáš požehnání, máš mùj souhlas.
	
	MIS_Thorben_GetBlessings = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_Thorben,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Thorben,LOG_RUNNING);
	B_LogEntry (TOPIC_Thorben,"Thorben se za mê pâimluví teprve tehdy, až si vyprosím požehnání od Adanova a Innosova knêze.");
};

func void DIA_Thorben_OtherMasters_Devoutly()
{
	AI_Output (other, self,"DIA_Thorben_OtherMasters_Devoutly_15_00"); //Ano. Nejpokornêjší služebník, mistâe Thorbene.
	B_Thorben_GetBlessings();
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
};

func void DIA_Thorben_OtherMasters_Naja()
{
	AI_Output (other, self,"DIA_Thorben_OtherMasters_Naja_15_00"); //No, když myslíš, že bych se mêl modlit pravidelnê...
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_01"); //Já si to nemyslím. Vím to!
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_02"); //Nêkdo, kdo není dostateènê zbožný, mùj souhlas nikdy nezíská.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_03"); //Pros bohy za shovívavost nad tvými hâíchy.
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
	description = "Tak jak s tím doporuèením, mistâe?";
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
	AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_00"); //Tak jak s tím doporuèením, mistâe?
	AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_01"); //Požehnal ti Vatras?
	
	if (Vatras_Segen == TRUE)
	{
		AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_02"); //Ano.
		AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_03"); //A získal jsi také požehnání Innose?
		
		if (Daron_Segen == TRUE)
		|| (Isgaroth_Segen == TRUE)
		|| (other.guild == GIL_KDF)
		{
			AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_04"); //Ano, získal.
			AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_05"); //V tom pâípadê máš i mé požehnání. Nezáleží na tom, jakou cestu sis vybral - buë hrdý na svou práci, chlapèe!
			
			MIS_Thorben_GetBlessings = LOG_SUCCESS;
			B_GivePlayerXP (XP_Zustimmung);
			
			Log_CreateTopic (TOPIC_Lehrling,LOG_MISSION);
			Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
			B_LogEntry (TOPIC_Lehrling,"Budu-li k nêkomu chtít vstoupit do uèení, Thorben se za mê pâimluví.");
		}
		else
		{
			AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_06"); //Ne. Ještê ne.
			AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_07"); //Znáš moje podmínky. Svým záležitostem se mùžeš vênovat jen s požehnáním bohù.
		};
	}
	else
	{
		AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_08"); //Ještê ne...
		AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_09"); //V tom pâípadê nevím, proè se mê znovu ptáš. Znáš moje podmínky.
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
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_01"); //Co by to bylo za poâádnou truhlu bez dobrého zámku?
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_02"); //Vyrábím si své vlastní zámky. Takhle si mùžu být pâinejmenším jistý, že jsem neudêlal bytelnou truhlu jen tak pro nic za nic.
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_03"); //Odbytý zámek se dá snadno zlomit. A tady v Khorinidu se všude kolem potuluje spousta zlodêjù. Zvláštê poslední dobou!
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
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_01"); //(podezíravê) Jak ses k tomu dostal?
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_02"); //Spíš by tê mêlo zajímat, že je v ní tvé jméno.
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_03"); //Dej to sem!
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_04"); //A co mi za to dáš?
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_05"); //Nemám peníze nazbyt a nemùžu ti dát nic jiného než mé srdeèné podêkování.
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
	description = "Mùžeš mê nauèit, jak páèit zámky?";
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
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_15_00"); //Mùžeš mê nauèit, jak páèit zámky?
		
	if (Npc_HasItems (self, ItWr_Schuldenbuch) > 0)
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_01"); //Kdyby nebylo tebe, budu Lehmarovi platit po celý zbytek svého života.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_02"); //Nauèím tê, co budeš chtít.
		Thorben_TeachPlayer = TRUE;
	}
	else if (Thorben_GotGold == TRUE) //100 Gold bekommen
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_03"); //Pâinesl jsi mi 100 zlatých. To od tebe bylo velmi milé.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_04"); //Pâivádí mê to do rozpakù, ale musím tê požádat ještê o jednu laskavost.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_05"); //Jelikož v dohledné dobê nemùžu Lehmarovi svùj dluh splatit, chystá se na mê poslat ty své gorily.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_06"); //Dej mi ještê dalších 100 zlatých a já tê zaènu uèit.

		Info_ClearChoices (DIA_Thorben_PleaseTeach);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Kolik?", DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Dobrá. Tady je 100 zlatých.", DIA_Thorben_PleaseTeach_Pay100);
	}
	else if (MIS_Matteo_Gold == LOG_SUCCESS) //Grittas Schulden bezahlt
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_07"); //Zaplatil jsi Grittin dluh u Mattea. Vypadáš jako správný chlap. Nauèím tê, co budeš chtít.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_08"); //Nicménê nemùžu to dêlat zadarmo. Ještê poâád mám fùru dluhù a potâebuju peníze.
		AI_Output (other, self,"DIA_Thorben_PleaseTeach_15_09"); //Kolik?
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_10"); //200 zlatých.
		
		Info_ClearChoices (DIA_Thorben_PleaseTeach);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Kolik?", DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Dobrá. Tady je 200 zlatých.", DIA_Thorben_PleaseTeach_Pay200);
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_11"); //Hmm... nevím, jestli se ti dá vêâit, nebo ne.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_12"); //Podle toho, co vím, mùžeš klidnê být jedním z têch darmošlapù, co pâišli do mêsta jen proto, aby vyprázdnili truhlice bohatých lidí.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_13"); //Nebudu tê uèit nic, dokud se nepâesvêdèím, že jsi dobrý èlovêk.
	};
};

func void DIA_Thorben_PleaseTeach_Pay200()
{
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Pay200_15_00"); //Dobrá. Tady je 200 zlatých.
	
	if (B_GiveInvItems (other, self, ItMi_Gold, 200))
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay200_06_01"); //Tyhle peníze by mi mêly pomoct. Mùžeme zaèít hned, jak budeš pâipraven.
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay200_06_02"); //Ještê poâád ti do 200 zlatých pár mincí chybí. Ty peníze potâebuju.
	};
	
	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};

func void DIA_Thorben_PleaseTeach_Pay100()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Pay100_15_00"); //Dobrá. Tady je 100 zlatých.
		
	if (B_GiveInvItems (other, self, ItMi_Gold, 100))
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay100_06_01"); //V tom pâípadê mùžeme zaèít hned, jak budeš pâipraven.
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay100_06_02"); //Hej, ještê poâád ti do 100 zlatých chybí pár mincí.
	};
	
	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};
	
func void DIA_Thorben_PleaseTeach_Later()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Later_15_00"); //Možná pozdêji.

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
	description = B_BuildLearnString("Nauè mê páèit zámky!", B_GetLearnCostTalent(other, NPC_TALENT_PICKLOCK, 1));
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
	AI_Output (other, self,"DIA_Thorben_Teach_15_00"); //Nauè mê páèit zámky!
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_PICKLOCK)
	{
		AI_Output (self, other,"DIA_Thorben_Teach_06_01"); //Potâebuješ akorát nêjaký paklíè. Pokud jím budeš v zámku opatrnê otáèet doprava a doleva, mùžeš mechanismus otevâít.
		AI_Output (self, other,"DIA_Thorben_Teach_06_02"); //Ale pokud otoèíš pâíliš rychle nebo moc silnê ve špatném smêru, paklíè se zlomí.
		AI_Output (self, other,"DIA_Thorben_Teach_06_03"); //Èím budeš obratnêjší, tím ménê budeš potâebovat paklíèù. To je všechno, opravdu.
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
	description = "Mùžeš mi prodat nêjaké paklíèe?";
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
	AI_Output (other, self,"DIA_Thorben_TRADE_15_00"); //Mùžeš mi prodat nêjaké paklíèe?
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) > 0)
	{
		AI_Output (self, other,"DIA_Thorben_TRADE_06_01"); //Pokud mi ještê nêjaké zbyly...
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
	B_LogEntry (Topic_CityTrader,"Tesaâ Thorben prodává paklíèe."); 
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

	description	 = 	"Ty už jsi nêkdy nêjakého uèedníka mêl?";
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
	AI_Output	(other, self, "DIA_Addon_Thorben_MissingPeople_15_00"); //Už jsi nêkdy mêl nêjakého uèedníka?
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_01"); //Jo, a ani to není tak dávno.
	AI_Output	(other, self, "DIA_Addon_Thorben_MissingPeople_15_02"); //A co se stalo?
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_03"); //Jmenoval se Elvrich. Byl to mùj synovec.
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_04"); //A byl jsem s ním docela spokojený, ale jednoho dne prostê nepâišel do práce.
	
	MIS_Thorben_BringElvrichBack = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Elvrich, uèedník tesaâe Thorbena, zmizel."); 
	
	Info_ClearChoices	(DIA_Addon_Thorben_MissingPeople);
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, DIALOG_BACK, DIA_Addon_Thorben_MissingPeople_Back );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "A ohlásil jsi to domobranê?", DIA_Addon_Thorben_MissingPeople_Mil );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "Jak je to dlouho, co jsi ho vidêl naposledy?", DIA_Addon_Thorben_MissingPeople_wann );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "Kde je Elvrich teë?", DIA_Addon_Thorben_MissingPeople_where );
};

func void DIA_Addon_Thorben_MissingPeople_Back ()
{
	Info_ClearChoices	(DIA_Addon_Thorben_MissingPeople);
};

func void DIA_Addon_Thorben_MissingPeople_wann ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_wann_15_00"); //Jak je to dlouho, co jsi ho nevidêl?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_wann_06_01"); //Asi tak ètrnáct dní.
};

func void DIA_Addon_Thorben_MissingPeople_where ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_where_15_00"); //Kde je Elvrich teë?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_where_06_01"); //Jak to mám vêdêt? Ale furt se poflakoval kolem toho špinavýho bordelu v pâístavu.
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_where_06_02"); //Ani by mê nepâekvapilo, kdyby si tam ještê teë užíval s nêjakou štêtkou.
};

func void DIA_Addon_Thorben_MissingPeople_Mil ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_Mil_15_00"); //Ohlásil jsi to domobranê?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_Mil_06_01"); //Samozâejmê. Mêli ho chytit a dohlídnout, aby se ta líná kùže vrátila zpátky do práce. Ale já už to stejnê zabalil.
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_Mil_06_02"); //Aã si dêlá, co chce. Dâív nebo pozdêji stejnê zjistí, že bez slušné práce si v Khorinidu neškrtne.
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

	description	 = 	"Elvrich pro tebe bude od nynêjška znovu pracovat.";
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
	AI_Output	(other, self, "DIA_Addon_Thorben_ElvrichIsBack_15_00"); //Odteëka pro tebe bude Elvrich znovu pracovat.
	AI_Output	(self, other, "DIA_Addon_Thorben_ElvrichIsBack_06_01"); //Mùžu jenom doufat, že nezmizí znova, až se kolem ochomýtne nêjaká suknê.
	AI_Output	(self, other, "DIA_Addon_Thorben_ElvrichIsBack_06_02"); //Za to, že jsi mi pâivedl uèedníka, si vezmi tohle zlato.
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
	AI_Output (self, other,"DIA_Thorben_Paladine_06_01"); //Nic moc. Pâed dvêma týdny sem na lodi pâipluli z pevniny.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_02"); //Od té doby jsou zavâení v horní èásti mêsta.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_03"); //Nikdo tady poâádnê neví, proè vlastnê pâijeli.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_04"); //Hodnê lidí se obává útoku skâetù.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_05"); //Ale já si stejnê myslím, že jsou tu kvùli rolnické vzpouâe.
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
	description = "Víš nêco o té rolnické vzpouâe?";
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
	AI_Output (other, self,"DIA_Thorben_Bauernaufstand_15_00"); //Víš nêco o té rolnické vzpouâe?
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_01"); //Povídá se, že si velkostatkáâ Onar najal žoldnéâe, aby ho chránili pâed královskými vojsky.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_02"); //Asi už mêl dost toho, že mu paladinové a domobrana poâád berou úrodu a dobytek.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_03"); //Jediné, co jsme tady ve mêstê zaznamenali, je neustálé zvyšování cen potravin.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_04"); //Onarova farma leží na východ odsud, je to docela daleko. Nevíme, jestli se tam k nêèemu chystá.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_05"); //Pokud se chceš dozvêdêt víc, zeptej se kupcù na tržišti. Mají o ostrovê vêtší pâehled než já.
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
	description = "Pâišel jsem kvùli Grittê...";
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
	AI_Output (other, self,"DIA_Thorben_Gritta_15_00"); //Pâišel jsem kvùli Grittê.
	AI_Output (self, other,"DIA_Thorben_Gritta_06_01"); //Mé neteâi? O co jde? Není to nic s penêzi, že ne?
	AI_Output (other, self,"DIA_Thorben_Gritta_15_02"); //Dluží 100 zlatých kupci Matteovi.
	
	AI_Output (self, other,"DIA_Thorben_Gritta_06_03"); //Âekni, že to není pravda. Od té doby, co se ke mnê ta malá lenoška nastêhovala, mám jen samé potíže!
	AI_Output (self, other,"DIA_Thorben_Gritta_06_04"); //Má dluh snad u každého kupce ve mêstê.
	AI_Output (self, other,"DIA_Thorben_Gritta_06_05"); //Musel jsem si pùjèit 200 zlatých u lichváâe jen proto, abych vyrovnal její dluhy. A teë tohle!
	if (Npc_GetDistToWP(self, "NW_CITY_MERCHANT_SHOP01_FRONT_01") < 500)
	{
		AI_Output (self, other,"DIA_Thorben_Gritta_06_06"); //Gritta by mêla být v domê.
	};
	AI_Output (self, other,"DIA_Thorben_Gritta_06_07"); //Jdi dál, jen se jí zeptej. Ale mùžu ti âíct jedno: nemá ani zlatku.
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
	description = "Tvá neteâ mi dala 100 zlatých.";
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
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_15_00"); //Tvá neteâ mi dala 100 zlatých.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_06_01"); //CO? Ta malá nestydatá zmije - to bylo MOJE zlato! Vzala ho z mé truhly.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_06_02"); //Vraã mi to! Musím nejdâív zaplatit Lehmarovi. Matteo dostane své peníze pozdêji!

	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
	if (MIS_Matteo_Gold == LOG_SUCCESS)
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "Už jsem dal Matteovi jeho zlato!", DIA_Thorben_GrittaHatteGold_MatteoHatEs);
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
		AI_Output (self, other,"B_Thorben_DeletePetzCrimeGritta_06_00"); //A co vím o té malé zmiji, jsem si jistý, že bêžela pâímo za mêstskou stráží, aby tê taky obvinila!
		AI_Output (self, other,"B_Thorben_DeletePetzCrimeGritta_06_01"); //Dohlédnu na to, aby se to nêjak vyâešilo.
		B_DeletePetzCrime (Gritta);
	};
};

func void DIA_Thorben_GrittaHatteGold_MatteoHatEs()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_15_00"); //Už jsem dal Matteovi jeho zlato!
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_06_01"); //Sakra! Dobrá - dluh je dluh. Alespoà že sis ty peníze nenechal. Asi bych ti za to mêl podêkovat.
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_MatteoSollHaben()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_15_00"); //Ne. Ty peníze jsou Matteovy.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_01"); //Takhle mê dostaneš do poâádných trablù. Lehmar není zrovna pâehnanê shovívavý, když pâijde âeè na dluhy.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_02"); //Ale pâinejmenším se chystáš splatit dluh mé neteâe. Asi bych ti za to mêl podêkovat.
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_HereItIs()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_HereItIs_15_00"); //Tady je zlato.
	B_GiveInvItems(other, self, itmi_gold, 100);
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_01"); //Díky! Koneènê mám alespoà èást penêz, co dlužím Lehmarovi.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_02"); //Nemùžu uvêâit tomu, že mêla tu drzost vzít mé zlato!
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Thorben_GotGold = TRUE;
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};



















