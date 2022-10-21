///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Bilgot_EXIT   (C_INFO)
{
	npc         = VLK_4120_Bilgot;
	nr          = 999;
	condition   = DIA_Bilgot_EXIT_Condition;
	information = DIA_Bilgot_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bilgot_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Bilgot_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_HALLO		(C_INFO)
{
	npc		 	 = 	VLK_4120_Bilgot;
	nr			 =  2;
	condition	 = 	DIA_Bilgot_HALLO_Condition;
	information	 = 	DIA_Bilgot_HALLO_Info;
	important	 = 	TRUE;
	permanent 	 =  FALSE;
};
func int DIA_Bilgot_HALLO_Condition ()
{
	return TRUE;
};
func void DIA_Bilgot_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Bilgot_HALLO_05_00"); //Hej, sk�d przyszed�e�? Mo�e z zamku?

	Info_AddChoice	(DIA_Bilgot_HALLO, "Tak, przyszed�em z zamku, a co?", DIA_Bilgot_HALLO_Burg );
	Info_AddChoice	(DIA_Bilgot_HALLO, "Wpad�em tu przez przypadek...", DIA_Bilgot_HALLO_Zufall );
};
func void DIA_Bilgot_HALLO_Zufall ()
{
	AI_Output (other, self, "DIA_Bilgot_HALLO_Zufall_15_00"); //Wpad�em tu przez przypadek...
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_01"); //Ej, nikt tu nie trafia przez PRZYPADEK. Wszyscy jeste�my skazani - otoczeni przez z�bacze!
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_02"); //Codziennie kolejny z nas gryzie ziemi�.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_03"); //Nie chcesz mi powiedzie�, sk�d przyszed�e�? Dobra - w takim razie niech ci� z�bacze ze�r�!
	
	AI_StopProcessInfos (self);
};

func void DIA_Bilgot_HALLO_Burg ()
{
	AI_Output (other, self, "DIA_Bilgot_HALLO_Burg_15_00"); //Tak, przyszed�em z zamku, a co?
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_01"); //Jak wygl�da sytuacja?
	AI_Output (other, self, "DIA_Bilgot_HALLO_Burg_15_02"); //Nie lepiej ni� tu. Orkowie nadal tam s�, je�li o to pytasz.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_03"); //Cholera. Nigdzie nie jeste� bezpieczny.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_04"); //Co� ci powiem. Gdybym nie by� tak przera�ony, ju� dawno bym si� st�d zmy�.
	
	Info_ClearChoices	(DIA_Bilgot_HALLO);
};
///////////////////////////////////////////////////////////////////////
//	Info Job
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_Job		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 =  3;
	condition	 = 	DIA_Bilgot_Job_Condition;
	information	 = 	DIA_Bilgot_Job_Info;
	permanent 	 =  FALSE;
	description	 = 	"A co tu w�a�ciwie robisz?";
};
func int DIA_Bilgot_Job_Condition ()
{
	return TRUE;
};
func void DIA_Bilgot_Job_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_Job_15_00"); //A co tu w�a�ciwie robisz?
	AI_Output (self, other, "DIA_Bilgot_Job_05_01"); //A, robi� tu za ch�opca na posy�ki. Zanie� to tam, miej na oku z�bacze, Bilgot chod� tu, Bilgot id� tam...
	AI_Output (self, other, "DIA_Bilgot_Job_05_02"); //Mog�em zosta� w domu z moj� star�. Tam by�o tak samo, ale mog�em przynajmniej porz�dnie zje��.
	AI_Output (self, other, "DIA_Bilgot_Job_05_03"); //A teraz jestem ostatnim niedobitkiem z kontyngentu przydzielonego do Fajetha.
	AI_Output (self, other, "DIA_Bilgot_Job_05_04"); //Sk�d mia�em wiedzie�, �e ta ekspedycja nie wr�ci?
	AI_Output (self, other, "DIA_Bilgot_Job_05_05"); //M�j kumpel, Olav, ulotni� si�. Mo�e JEMU si� uda�o...
};
///////////////////////////////////////////////////////////////////////
//	Info Hilfe
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_Hilfe		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr 			 =  3;
	condition	 = 	DIA_Bilgot_Hilfe_Condition;
	information	 = 	DIA_Bilgot_Hilfe_Info;
	permanent 	 =  FALSE;
	description	 = 	"Co wiesz o z�baczach?";
};
func int DIA_Bilgot_Hilfe_Condition ()
{
	if	(MIS_Fajeth_Kill_Snapper == LOG_RUNNING)	
	{
		return TRUE;
	};
};
func void DIA_Bilgot_Hilfe_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_00"); //Co wiesz o z�baczach?
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_01"); //A czemu chcesz to wiedzie�? Tylko nie m�w, �e jeste� po prostu ciekawy!
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_02"); //Zamierzam zapolowa� na te z�bacze.
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_03"); //To szale�stwo. Obserwowa�em je - to krwio�ercze bestie.
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_04"); //No to powiedz mi, co o nich wiesz.
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_05"); //Hmmm... M�g�bym ci pom�c, ale pod jednym warunkiem!
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_06"); //Czego chcesz?
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_07"); //Je�li uda ci si� pozabija� z�bacze, to mnie st�d wyci�gniesz!
	
	if ((Npc_IsDead (Fed)) == FALSE)
	{
		AI_Output (self, other, "DIA_Bilgot_Hilfe_05_08"); //Nie wytrzymam tu d�u�ej. Rozmawia�e� z Fedem? Ten facet to kompletny wrak - nie chc� sko�czy� jak on.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info KnowsLeadSnapper
///////////////////////////////////////////////////////////////////////

instance DIA_Bilgot_KNOWSLEADSNAPPER		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 =  4;
	condition	 = 	DIA_Bilgot_KNOWSLEADSNAPPER_Condition;
	information	 = 	DIA_Bilgot_KNOWSLEADSNAPPER_Info;
	permanent 	 =  FALSE;
	description	 = 	"Powiedz mi, co wiesz. Wtedy ci� st�d zabior�.";
};

func int DIA_Bilgot_KNOWSLEADSNAPPER_Condition ()
{
	if ((Npc_KnowsInfo(other, DIA_Bilgot_Hilfe))
	&& (MIS_Fajeth_Kill_Snapper == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_KNOWSLEADSNAPPER_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_00"); //Powiedz mi, co wiesz. Wtedy ci� st�d zabior�.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_01"); //Wiedzia�em, �e mog� na ciebie liczy�. No to s�uchaj. Do�� d�ugo obserwowa�em z�bacze.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_02"); //S� bardzo sprytne i jako� si�... porozumiewaj�. Nigdy nie chodz� same. Atakuj� ca�ym stadem.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_03"); //Ale jest co� jeszcze. W�r�d nich jest jaki� inny jaszczur. Rzadko si� pokazuje, ale go widzia�em.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_04"); //Inne z�bacze pochylaj� �by, kiedy przechodzi, ale ci�gle go obserwuj�.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_05"); //Dop�ki ten jeden si� nie ruszy, reszta te� nie.
	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_06"); //Gdzie znajd� to cholerne bydl�?
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_07"); //Widzia�em go ko�o schod�w prowadz�cych do starej wie�y stra�niczej.

	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_08"); //�wietnie. Chyba zrozumia�em. Dzi�kuj�!
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_09"); //Pami�taj, da�e� mi s�owo!

	Wld_InsertNpc (NewMine_LeadSnapper,"OW_ORC_LOOKOUT_2_01"); //Der Rudelf�hrer
	
	B_LogEntry (TOPIC_FajethKillSnapper,"Bilgot opowiedzia� mi o przyw�dcy stada z�baczy. Znajd� go na schodach starej wie�y stra�niczej."); 
	
	Log_CreateTopic (TOPIC_BilgotEscort,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BilgotEscort,LOG_RUNNING);
	B_LogEntry (TOPIC_BilgotEscort,"Bilgot chce, abym pom�g� mu wydosta� si� z doliny.");
		
};
///////////////////////////////////////////////////////////////////////
//	Info TakeYouWithMe
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_TAKEYOUWITHME		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr 			 =  2;
	condition	 = 	DIA_Bilgot_TAKEYOUWITHME_Condition;
	information	 = 	DIA_Bilgot_TAKEYOUWITHME_Info;
	permanent 	 =  FALSE;
	description	 = 	"(Dotrzymaj obietnicy)";
};
func int DIA_Bilgot_TAKEYOUWITHME_Condition ()
{
	if (MIS_Fajeth_Kill_Snapper == LOG_SUCCESS)
 	&& Npc_KnowsInfo(other, DIA_Bilgot_KNOWSLEADSNAPPER)
 			{
				return TRUE;
 			};
};
func void DIA_Bilgot_TAKEYOUWITHME_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_TAKEYOUWITHME_15_00"); //Pora rusza�, Bilgot! Pakuj manatki.
	//Joly: SC bringt den Typ bis zum Pass AI_Output (self, other, "DIA_Bilgot_TAKEYOUWITHME_05_01"); //Gro�artig! Es reicht mir schon, wenn du mich �ber die gro�e Br�cke am Fluss vor der belagerten Burg bringst. Den Rest schaff ich dann schon.
	//Joly: SC bringt den Typ bis zum Pass AI_Output (other, self, "DIA_Bilgot_TAKEYOUWITHME_15_02"); //Dann beeil dich!
	AI_Output (self, other, "DIA_Bilgot_TAKEYOUWITHME_05_03"); //Jestem gotowy!

	Npc_ExchangeRoutine	(self, "FOLLOWTOOCBRIDGE");
	Bilgot.flags	= 0;	
	MIS_RescueBilgot = LOG_RUNNING;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info LaufSchneller
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_LAUFSCHNELLER		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 =  5;
	condition	 = 	DIA_Bilgot_LAUFSCHNELLER_Condition;
	information	 = 	DIA_Bilgot_LAUFSCHNELLER_Info;
	permanent	 =  FALSE;
	description	 = 	"Nie mo�esz i�� troch� szybciej?!";
};

func int DIA_Bilgot_LAUFSCHNELLER_Condition ()
{
	if ((Npc_KnowsInfo(other, DIA_Bilgot_TAKEYOUWITHME))
	&& ((Npc_KnowsInfo(other, DIA_Bilgot_BEIBRUECKEANGEKOMMEN))==FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_LAUFSCHNELLER_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_LAUFSCHNELLER_15_00"); //Nie mo�esz i�� troch� szybciej?!
	AI_Output (self, other, "DIA_Bilgot_LAUFSCHNELLER_05_01"); //Id� tak szybko, jak daj� rad�.
};
///////////////////////////////////////////////////////////////////////
//	Info BeiBrueckeAngekommen
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_BEIBRUECKEANGEKOMMEN		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 =  2;
	condition	 = 	DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Condition;
	information	 = 	DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Info;
	important	 = 	TRUE;
	permanent	 =  FALSE;
};
func int DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Condition ()
{
	if (Npc_GetDistToWP(self,"START")<8000) 				
	{
		return TRUE;
	};
};

func void DIA_Bilgot_BEIBRUECKEANGEKOMMEN_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_00"); //Dobra, jeste�my. A teraz szybko. Ten teren jest niepewny!
	AI_Output (self, other, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_01"); //Dzi�kuj�!
	AI_Output (other, self, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_02"); //Nie daj si� zje��. Szkoda by ci� by�o.
	AI_Output (self, other, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_03"); //�egnaj!
	
	AI_StopProcessInfos (self);	
	TschuessBilgot = TRUE;
	MIS_RescueBilgot = LOG_SUCCESS;
	B_GivePlayerXP (XP_BilgotEscort);
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self, "FLEEOUTOFOW");
};
///////////////////////////////////////////////////////////////////////
//	Info LetztePause
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_LetztePause		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 = 	3;
	condition	 = 	DIA_Bilgot_LetztePause_Condition;
	information	 = 	DIA_Bilgot_LetztePause_Info;
	permanent	 = 	TRUE;
	description	 = 	"Co tu robisz? My�la�em, �e szed�e� do prze��czy?";
};

func int DIA_Bilgot_LetztePause_Condition ()
{
	if (Npc_GetDistToWP(self,"START")<1000) 				
	{
		return TRUE;
	};
};

func void DIA_Bilgot_LetztePause_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_LetztePause_15_00"); //Co tu robisz? My�la�em, �e szed�e� do prze��czy?
	AI_Output (self, other, "DIA_Bilgot_LetztePause_05_01"); //Ju� nie mog�. Pozw�l mi chwil� odpocz��. Dam rad�. Nie martw si�!
	AI_Output (other, self, "DIA_Bilgot_LetztePause_15_02"); //Skoro tak twierdzisz.
	AI_Output (self, other, "DIA_Bilgot_LetztePause_05_03"); //Tylko kr�tka przerwa.
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Olav
///////////////////////////////////////////////////////////////////////
instance DIA_Bilgot_Olav		(C_INFO)
{
	npc			 = 	VLK_4120_Bilgot;
	nr			 = 	3;
	condition	 = 	DIA_Bilgot_Olav_Condition;
	information	 = 	DIA_Bilgot_Olav_Info;
	permanent	 = 	FALSE;
	description	 = 	"Znalaz�em Olava.";
};

func int DIA_Bilgot_Olav_Condition ()
{
	if (Npc_HasItems (Olav, ITSE_Olav) == 0)	
	&& (Npc_KnowsInfo (other,DIA_Bilgot_Job))
	{
		return TRUE;
	};
};

func void DIA_Bilgot_Olav_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_Olav_15_00"); //Znalaz�em Olava.
	AI_Output (self, other, "DIA_Bilgot_Olav_05_01"); //Jak si� ma?
	AI_Output (other, self, "DIA_Bilgot_Olav_15_02"); //Nie �yje. Wilki go zjad�y.
	AI_Output (self, other, "DIA_Bilgot_Olav_05_03"); //O, cholera. Mam nadziej�, �e chocia� ja zdo�am si� st�d wyrwa�.
	
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bilgot_PICKPOCKET (C_INFO)
{
	npc			= VLK_4120_Bilgot;
	nr			= 900;
	condition	= DIA_Bilgot_PICKPOCKET_Condition;
	information	= DIA_Bilgot_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Bilgot_PICKPOCKET_Condition()
{
	C_Beklauen (20, 30);
};
 
FUNC VOID DIA_Bilgot_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bilgot_PICKPOCKET);
	Info_AddChoice		(DIA_Bilgot_PICKPOCKET, DIALOG_BACK 		,DIA_Bilgot_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bilgot_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bilgot_PICKPOCKET_DoIt);
};

func void DIA_Bilgot_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bilgot_PICKPOCKET);
};
	
func void DIA_Bilgot_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bilgot_PICKPOCKET);
};



