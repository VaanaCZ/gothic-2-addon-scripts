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
	AI_Output (self, other, "DIA_Bilgot_HALLO_05_00"); //Hej, sk¹d przyszed³eœ? Mo¿e z zamku?

	Info_AddChoice	(DIA_Bilgot_HALLO, "Tak, przyszed³em z zamku, a co?", DIA_Bilgot_HALLO_Burg );
	Info_AddChoice	(DIA_Bilgot_HALLO, "Wpad³em tu przez przypadek...", DIA_Bilgot_HALLO_Zufall );
};
func void DIA_Bilgot_HALLO_Zufall ()
{
	AI_Output (other, self, "DIA_Bilgot_HALLO_Zufall_15_00"); //Wpad³em tu przez przypadek...
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_01"); //Ej, nikt tu nie trafia przez PRZYPADEK. Wszyscy jesteœmy skazani - otoczeni przez zêbacze!
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_02"); //Codziennie kolejny z nas gryzie ziemiê.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_03"); //Nie chcesz mi powiedzieæ, sk¹d przyszed³eœ? Dobra - w takim razie niech ciê zêbacze ze¿r¹!
	
	AI_StopProcessInfos (self);
};

func void DIA_Bilgot_HALLO_Burg ()
{
	AI_Output (other, self, "DIA_Bilgot_HALLO_Burg_15_00"); //Tak, przyszed³em z zamku, a co?
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_01"); //Jak wygl¹da sytuacja?
	AI_Output (other, self, "DIA_Bilgot_HALLO_Burg_15_02"); //Nie lepiej ni¿ tu. Orkowie nadal tam s¹, jeœli o to pytasz.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_03"); //Cholera. Nigdzie nie jesteœ bezpieczny.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_04"); //Coœ ci powiem. Gdybym nie by³ tak przera¿ony, ju¿ dawno bym siê st¹d zmy³.
	
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
	description	 = 	"A co tu w³aœciwie robisz?";
};
func int DIA_Bilgot_Job_Condition ()
{
	return TRUE;
};
func void DIA_Bilgot_Job_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_Job_15_00"); //A co tu w³aœciwie robisz?
	AI_Output (self, other, "DIA_Bilgot_Job_05_01"); //A, robiê tu za ch³opca na posy³ki. Zanieœ to tam, miej na oku zêbacze, Bilgot chodŸ tu, Bilgot idŸ tam...
	AI_Output (self, other, "DIA_Bilgot_Job_05_02"); //Mog³em zostaæ w domu z moj¹ star¹. Tam by³o tak samo, ale mog³em przynajmniej porz¹dnie zjeœæ.
	AI_Output (self, other, "DIA_Bilgot_Job_05_03"); //A teraz jestem ostatnim niedobitkiem z kontyngentu przydzielonego do Fajetha.
	AI_Output (self, other, "DIA_Bilgot_Job_05_04"); //Sk¹d mia³em wiedzieæ, ¿e ta ekspedycja nie wróci?
	AI_Output (self, other, "DIA_Bilgot_Job_05_05"); //Mój kumpel, Olav, ulotni³ siê. Mo¿e JEMU siê uda³o...
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
	description	 = 	"Co wiesz o zêbaczach?";
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
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_00"); //Co wiesz o zêbaczach?
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_01"); //A czemu chcesz to wiedzieæ? Tylko nie mów, ¿e jesteœ po prostu ciekawy!
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_02"); //Zamierzam zapolowaæ na te zêbacze.
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_03"); //To szaleñstwo. Obserwowa³em je - to krwio¿ercze bestie.
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_04"); //No to powiedz mi, co o nich wiesz.
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_05"); //Hmmm... Móg³bym ci pomóc, ale pod jednym warunkiem!
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_06"); //Czego chcesz?
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_07"); //Jeœli uda ci siê pozabijaæ zêbacze, to mnie st¹d wyci¹gniesz!
	
	if ((Npc_IsDead (Fed)) == FALSE)
	{
		AI_Output (self, other, "DIA_Bilgot_Hilfe_05_08"); //Nie wytrzymam tu d³u¿ej. Rozmawia³eœ z Fedem? Ten facet to kompletny wrak - nie chcê skoñczyæ jak on.
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
	description	 = 	"Powiedz mi, co wiesz. Wtedy ciê st¹d zabiorê.";
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
	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_00"); //Powiedz mi, co wiesz. Wtedy ciê st¹d zabiorê.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_01"); //Wiedzia³em, ¿e mogê na ciebie liczyæ. No to s³uchaj. Doœæ d³ugo obserwowa³em zêbacze.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_02"); //S¹ bardzo sprytne i jakoœ siê... porozumiewaj¹. Nigdy nie chodz¹ same. Atakuj¹ ca³ym stadem.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_03"); //Ale jest coœ jeszcze. Wœród nich jest jakiœ inny jaszczur. Rzadko siê pokazuje, ale go widzia³em.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_04"); //Inne zêbacze pochylaj¹ ³by, kiedy przechodzi, ale ci¹gle go obserwuj¹.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_05"); //Dopóki ten jeden siê nie ruszy, reszta te¿ nie.
	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_06"); //Gdzie znajdê to cholerne bydlê?
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_07"); //Widzia³em go ko³o schodów prowadz¹cych do starej wie¿y stra¿niczej.

	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_08"); //Œwietnie. Chyba zrozumia³em. Dziêkujê!
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_09"); //Pamiêtaj, da³eœ mi s³owo!

	Wld_InsertNpc (NewMine_LeadSnapper,"OW_ORC_LOOKOUT_2_01"); //Der Rudelführer
	
	B_LogEntry (TOPIC_FajethKillSnapper,"Bilgot opowiedzia³ mi o przywódcy stada zêbaczy. Znajdê go na schodach starej wie¿y stra¿niczej."); 
	
	Log_CreateTopic (TOPIC_BilgotEscort,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BilgotEscort,LOG_RUNNING);
	B_LogEntry (TOPIC_BilgotEscort,"Bilgot chce, abym pomóg³ mu wydostaæ siê z doliny.");
		
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
	AI_Output (other, self, "DIA_Bilgot_TAKEYOUWITHME_15_00"); //Pora ruszaæ, Bilgot! Pakuj manatki.
	//Joly: SC bringt den Typ bis zum Pass AI_Output (self, other, "DIA_Bilgot_TAKEYOUWITHME_05_01"); //Großartig! Es reicht mir schon, wenn du mich über die große Brücke am Fluss vor der belagerten Burg bringst. Den Rest schaff ich dann schon.
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
	description	 = 	"Nie mo¿esz iœæ trochê szybciej?!";
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
	AI_Output (other, self, "DIA_Bilgot_LAUFSCHNELLER_15_00"); //Nie mo¿esz iœæ trochê szybciej?!
	AI_Output (self, other, "DIA_Bilgot_LAUFSCHNELLER_05_01"); //Idê tak szybko, jak dajê radê.
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
	AI_Output (other, self, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_00"); //Dobra, jesteœmy. A teraz szybko. Ten teren jest niepewny!
	AI_Output (self, other, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_01"); //Dziêkujê!
	AI_Output (other, self, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_02"); //Nie daj siê zjeœæ. Szkoda by ciê by³o.
	AI_Output (self, other, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_03"); //¯egnaj!
	
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
	description	 = 	"Co tu robisz? Myœla³em, ¿e szed³eœ do prze³êczy?";
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
	AI_Output (other, self, "DIA_Bilgot_LetztePause_15_00"); //Co tu robisz? Myœla³em, ¿e szed³eœ do prze³êczy?
	AI_Output (self, other, "DIA_Bilgot_LetztePause_05_01"); //Ju¿ nie mogê. Pozwól mi chwilê odpocz¹æ. Dam radê. Nie martw siê!
	AI_Output (other, self, "DIA_Bilgot_LetztePause_15_02"); //Skoro tak twierdzisz.
	AI_Output (self, other, "DIA_Bilgot_LetztePause_05_03"); //Tylko krótka przerwa.
	
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
	description	 = 	"Znalaz³em Olava.";
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
	AI_Output (other, self, "DIA_Bilgot_Olav_15_00"); //Znalaz³em Olava.
	AI_Output (self, other, "DIA_Bilgot_Olav_05_01"); //Jak siê ma?
	AI_Output (other, self, "DIA_Bilgot_Olav_15_02"); //Nie ¿yje. Wilki go zjad³y.
	AI_Output (self, other, "DIA_Bilgot_Olav_05_03"); //O, cholera. Mam nadziejê, ¿e chocia¿ ja zdo³am siê st¹d wyrwaæ.
	
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



