//////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_EXIT   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 999;
	condition   = DIA_Ramirez_EXIT_Condition;
	information = DIA_Ramirez_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Ramirez_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ramirez_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ramirez_PICKPOCKET (C_INFO)
{
	npc			= VLK_445_Ramirez;
	nr			= 900;
	condition	= DIA_Ramirez_PICKPOCKET_Condition;
	information	= DIA_Ramirez_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Ramirez_PICKPOCKET_Condition()
{
	C_Beklauen (90, 300);
};
 
FUNC VOID DIA_Ramirez_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ramirez_PICKPOCKET);
	Info_AddChoice		(DIA_Ramirez_PICKPOCKET, DIALOG_BACK 		,DIA_Ramirez_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ramirez_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ramirez_PICKPOCKET_DoIt);
};

func void DIA_Ramirez_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Ramirez_PICKPOCKET);
};
	
func void DIA_Ramirez_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ramirez_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Zeichen   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 2;
	condition   = DIA_Ramirez_Zeichen_Condition;
	information = DIA_Ramirez_Zeichen_Info;
	permanent   = FALSE;
	description = "(Poka¿ z³odziejski gest)";
};

FUNC INT DIA_Ramirez_Zeichen_Condition()
{
	if (Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Zeichen_Info()
{
	AI_PlayAni (other, "T_YES");
	AI_Output (self, other, "DIA_Ramirez_Zeichen_14_00");//No, no, widzê, ¿e ktoœ pokaza³ ci znak. Jestem pod wra¿eniem.
};

//////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Hallo   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 2;
	condition   = DIA_Ramirez_Hallo_Condition;
	information = DIA_Ramirez_Hallo_Info;
	permanent   = TRUE;
	important	= TRUE;
};
//----------------------------------
var int DIA_Ramirez_Hallo_permanent;
//----------------------------------
FUNC INT DIA_Ramirez_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (DIA_Ramirez_Hallo_permanent == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Hallo_Info()
{
	if (self.aivar [AIV_TalkedToPlayer] == FALSE)
	&& (Join_Thiefs == FALSE) 
	{
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_00");//Zab³¹dzi³eœ? To chyba nie jest odpowiednie miejsce dla ciebie.
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_01");//Jeœli coœ ci siê tutaj stanie, to mo¿esz byæ pewien, ¿e nikt nie przyjdzie ci na ratunek. Wiêc lepiej uwa¿aj.
	};
	if  (Join_Thiefs == TRUE)  
	{
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_02");//Uda³o ci siê wejœæ. Có¿, ¿yczê szczêœcia - i uwa¿aj na siebie, cokolwiek bêdziesz robi³.
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_03");//Och, i jeszcze coœ - nie obchodzi mnie, kim jesteœ na górze, ani dla kogo pracujesz.
		AI_Output (self, other, "DIA_Ramirez_Hallo_14_04");//Tu, na dole, wszyscy jesteœmy z³odziejami. Ni mniej, ni wiêcej.
		DIA_Ramirez_Hallo_permanent = TRUE;
	};
	
	DG_gefunden = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Info Beute
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Beute   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 3;
	condition   = DIA_Ramirez_Beute_Condition;
	information = DIA_Ramirez_Beute_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Ramirez_Beute_Condition()
{
	if ((Mob_HasItems ("THIEF_CHEST_01",ItMi_Gold) < 50)
	|| (Mob_HasItems  ("THIEF_CHEST_02",ItMi_Gold) < 100)
	|| (Mob_HasItems  ("THIEF_CHEST_02",ItMi_Silvercup) == FALSE)
	|| (Mob_HasItems  ("THIEF_CHEST_03",ItMi_Gold) < 75))
	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Beute_Info()
{
	AI_Output (self, other, "DIA_Ramirez_Beute_14_00");//S³uchaj, ty chyba nie masz w sobie za grosz godnoœci, co? Kradniesz nam nasze w³asne z³oto?
	AI_Output (other, self, "DIA_Ramirez_Beute_15_01");//Nie gor¹czkuj siê tak z powodu kilku monet.
	AI_Output (other, self, "DIA_Ramirez_Beute_15_02");//To znaczy, czy to jest wasz ca³y ³up? Czy tylko tyle ma do zaoferowania gildia z³odziei z Khorinis?
	AI_Output (self, other, "DIA_Ramirez_Beute_14_03");//A kto mówi, ¿e ³upy trzymamy tutaj?
	AI_Output (other, self, "DIA_Ramirez_Beute_15_04");//Mnie te¿ coœ nie chce siê w to uwierzyæ. Gdzie wiêc ukryliœcie skarby?
	AI_Output (self, other, "DIA_Ramirez_Beute_14_05");//W bardzo bezpiecznym miejscu.
	AI_Output (other, self, "DIA_Ramirez_Beute_15_06");//Rozumiem.
	AI_Output (self, other, "DIA_Ramirez_Beute_14_07");//W porz¹dku, mo¿esz zatrzymaæ z³oto, ale uwa¿aj, bêdê mia³ na ciebie oko. Nie przesadzaj.
};
//////////////////////////////////////////////////////////////////////
//	Info Lernen freischalten
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Bezahlen   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 9;
	condition   = DIA_Ramirez_Bezahlen_Condition;
	information = DIA_Ramirez_Bezahlen_Info;
	permanent   = TRUE;
	description	= "Mo¿esz mnie czegoœ nauczyæ?";
};
//--------------------------------------
var int DIA_Ramirez_Bezahlen_permanent;
//--------------------------------------
FUNC INT DIA_Ramirez_Bezahlen_Condition()
{	
	if (Join_Thiefs == TRUE)
	&& (DIA_Ramirez_Bezahlen_permanent == FALSE)
	&& (Npc_KnowsInfo (other,DIA_Cassia_Lernen))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Bezahlen_Info()
{	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		Ramirez_Cost = 150;
	}
	else 
	{
		Ramirez_Cost = 300;
	};	
		
	AI_Output (other, self, "DIA_Ramirez_Bezahlen_15_00");//Czy móg³byœ mnie czegoœ nauczyæ?
	
	if (Npc_GetTalentSkill  (other, NPC_TALENT_PICKLOCK) == TRUE)
	{ 
		AI_Output (self, other, "DIA_Ramirez_Bezahlen_14_01");//Nie mogê nauczyæ ciê nic wiêcej. Przekaza³em ci ca³¹ moj¹ wiedzê na temat otwierania zamków.
		if (other.attribute[ATR_DEXTERITY] < T_MAX)
		{
			AI_Output (self, other, "DIA_Ramirez_Add_14_00"); //Teraz musisz ju¿ tylko poprawiæ swoj¹ zrêcznoœæ.
		};
		DIA_Ramirez_Bezahlen_permanent = TRUE;
		Info_ClearChoices (DIA_Ramirez_Bezahlen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Ramirez_Bezahlen_14_02");//Mogê ci pokazaæ, jak otwieraæ zamki. Bêdzie ciê to kosztowaæ jakieœ...
		B_Say_Gold (self, other, Ramirez_Cost);
		
		Info_ClearChoices (DIA_Ramirez_Bezahlen);
		Info_AddChoice (DIA_Ramirez_Bezahlen,"Mo¿e póŸniej... (POWRÓT)",DIA_Ramirez_Bezahlen_Spaeter);
		Info_AddChoice (DIA_Ramirez_Bezahlen,"Dobra, zap³acê...",DIA_Ramirez_Bezahlen_Okay);
	};
};
FUNC VOID DIA_Ramirez_Bezahlen_Spaeter()
{
	Info_ClearChoices (DIA_Ramirez_Bezahlen);
};
FUNC VOID DIA_Ramirez_Bezahlen_Okay()
{
	AI_Output (other, self, "DIA_Ramirez_Bezahlen_Okay_15_00");//Dobra, zap³acê...
	
	if B_GiveInvItems (other, self, ItMi_Gold, Ramirez_Cost)
	{
		AI_Output (other, self, "DIA_Ramirez_Bezahlen_Okay_15_01");//...Oto twoje z³oto.
		AI_Output (self, other, "DIA_Ramirez_Bezahlen_Okay_14_02");//Œwietnie. S³u¿ê pomoc¹.
		Ramirez_TeachPlayer = TRUE;
		DIA_Ramirez_Bezahlen_permanent = TRUE;
		Info_ClearChoices (DIA_Ramirez_Bezahlen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Ramirez_Bezahlen_Okay_14_03");//Bierz wiêc z³oto i wracaj.
		Info_ClearChoices (DIA_Ramirez_Bezahlen);
	};

};
//////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Teach   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 99;
	condition   = DIA_Ramirez_Teach_Condition;
	information = DIA_Ramirez_Teach_Info;
	permanent   = TRUE;
	description = "Naucz mnie otwieraæ zamki!";
};

FUNC INT DIA_Ramirez_Teach_Condition()
{	
	if (Ramirez_TeachPlayer == TRUE)
	&& (Npc_GetTalentSkill  (other, NPC_TALENT_PICKLOCK) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Teach_Info()
{
	AI_Output (other,self, "DIA_Ramirez_Teach_15_00");//Poka¿ mi, jak otwieraæ zamki.
	
	if (Ramirez_Zweimal == FALSE)
	{
		AI_Output (self, other, "DIA_Ramirez_Teach_14_06");//Umiejêtnoœæ otwierania zamków to niemal sztuka.
		AI_Output (self, other, "DIA_Ramirez_Teach_14_01");//Potrzeba do tego wiele uczucia i intuicji. No, i kilka dobrych wytrychów.
		AI_Output (self, other, "DIA_Ramirez_Teach_14_02");//Niektóre skrzynie s¹ jednak zabezpieczone zamkami, daj¹cymi siê otworzyæ tylko przez u¿ycie odpowiedniego klucza.
		Ramirez_Zweimal = TRUE;
	}
	if B_TeachThiefTalent (self, other, NPC_TALENT_PICKLOCK)
	{
		AI_Output (self, other, "DIA_Ramirez_Teach_14_03");//Tak wiêc, klêcz¹c przy zamku, nale¿y ³agodnie obróciæ wytrych, w lewo i w prawo.
		AI_Output (self, other, "DIA_Ramirez_Teach_14_04");//Jeœli obrócisz go zbyt szybko lub zbyt mocno - z³amie siê.
		AI_Output (self, other, "DIA_Ramirez_Teach_14_05");//Jednak z czasem nabierzesz wprawy w pos³ugiwaniu siê tym narzêdziem.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info oberes Viertel
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Viertel   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 8;
	condition   = DIA_Ramirez_Viertel_Condition;
	information = DIA_Ramirez_Viertel_Info;
	permanent   = FALSE;
	description = "Gdzie warto siê w³amywaæ?";
};
FUNC INT DIA_Ramirez_Viertel_Condition()
{
	if (Knows_SecretSign == TRUE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Viertel_Info()
{	
	AI_Output (other, self, "DIA_Ramirez_Viertel_15_00");//Gdzie warto siê w³amywaæ?
	AI_Output (self, other, "DIA_Ramirez_Viertel_14_01");//Oczywiœcie w górnym mieœcie.
	AI_Output (self, other, "DIA_Ramirez_Viertel_14_02");//Jednak jeœli przyjdzie ci do g³owy gdzieœ tam siê w³amywaæ, lepiej zaczekaj, a¿ zapadnie zmrok. Miasto zapada wtedy w sen, oczywiœcie pozostaj¹ jeszcze stra¿e.
	AI_Output (self, other, "DIA_Ramirez_Viertel_14_03");//Stra¿nicy kontroluj¹ miasto noc¹. Znam jednego - Wambo, to jedyny z nich, którego interesuje tylko z³oto.
	AI_Output (self, other, "DIA_Ramirez_Viertel_14_04");//Liczy sobie doœæ sporo, ale jeœli raz mu zap³acisz, nie bêdzie wiêcej sprawia³ k³opotów.
};
///////////////////////////////////////////////////////////////////////
//	Info Sextant
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Sextant   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 2;
	condition   = DIA_Ramirez_Sextant_Condition;
	information = DIA_Ramirez_Sextant_Info;
	permanent   = FALSE;
	description = "Masz dla mnie jak¹œ robotê?";
};

FUNC INT DIA_Ramirez_Sextant_Condition()
{
	if (Knows_SecretSign == TRUE)
	&& (MIS_CassiaRing == LOG_SUCCESS)
	&& (Kapitel >= 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Sextant_Info()
{
	AI_Output (other, self, "DIA_Ramirez_Sextant_15_00");//Czy masz dla mnie jak¹œ pracê?
	AI_Output (self, other, "DIA_Ramirez_Sextant_14_01");//Hmmm... Jest pewna rzecz, która mnie interesuje. Jednak dotychczas nie uda³o mi siê jej zdobyæ.
	AI_Output (other, self, "DIA_Ramirez_Sextant_15_02");//Có¿ to takiego?
	AI_Output (self, other, "DIA_Ramirez_Sextant_14_03");//Sekstans. Przynieœ mi go, a dobrze zap³acê.
	
	Log_CreateTopic (Topic_RamirezSextant,LOG_MISSION);
	Log_SetTopicStatus (Topic_RamirezSextant, LOG_RUNNING);
	B_LogEntry (Topic_RamirezSextant, "Ramirez chce, abym przyniós³ mu sekstans.");
	
	MIS_RamirezSextant = LOG_RUNNING;
};
///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ramirez_Success   (C_INFO)
{
	npc         = VLK_445_Ramirez;
	nr          = 2;
	condition   = DIA_Ramirez_Success_Condition;
	information = DIA_Ramirez_Success_Info;
	permanent   = FALSE;
	description = "Mam dla ciebie sekstans.";
};

FUNC INT DIA_Ramirez_Success_Condition()
{
	if Npc_KnowsInfo (other, DIA_Ramirez_Sextant)
	&& (Npc_HasItems (other, Itmi_Sextant ) > 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ramirez_Success_Info()
{
	AI_Output (other, self, "DIA_Ramirez_Success_15_00");//Mam dla ciebie sekstans.
	B_GiveInvItems (other, self, Itmi_Sextant,1);
	AI_Output (self, other, "DIA_Ramirez_Success_14_01");//Niewiarygodne. Naprawdê uda³o ci siê go zdobyæ.
	AI_Output (self, other, "DIA_Ramirez_Success_14_02");//Proszê, naprawdê zas³u¿y³eœ sobie na te pieni¹dze.
	
	B_GiveInvItems (self, other, Itmi_Gold,Value_Sextant/2);
	Ramirez_Sextant = TRUE;
	MIS_RamirezSextant = LOG_SUCCESS;
	B_GivePlayerXP (XP_RamirezSextant);
};


