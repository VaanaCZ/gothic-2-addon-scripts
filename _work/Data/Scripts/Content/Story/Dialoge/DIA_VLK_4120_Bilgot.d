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
	AI_Output (self, other, "DIA_Bilgot_HALLO_05_00"); //Hej, skąd przyszedłeś? Może z zamku?

	Info_AddChoice	(DIA_Bilgot_HALLO, "Tak, przyszedłem z zamku, a co?", DIA_Bilgot_HALLO_Burg );
	Info_AddChoice	(DIA_Bilgot_HALLO, "Wpadłem tu przez przypadek...", DIA_Bilgot_HALLO_Zufall );
};
func void DIA_Bilgot_HALLO_Zufall ()
{
	AI_Output (other, self, "DIA_Bilgot_HALLO_Zufall_15_00"); //Wpadłem tu przez przypadek...
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_01"); //Ej, nikt tu nie trafia przez PRZYPADEK. Wszyscy jesteśmy skazani - otoczeni przez zębacze!
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_02"); //Codziennie kolejny z nas gryzie ziemię.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Zufall_05_03"); //Nie chcesz mi powiedzieć, skąd przyszedłeś? Dobra - w takim razie niech cię zębacze zeżrą!
	
	AI_StopProcessInfos (self);
};

func void DIA_Bilgot_HALLO_Burg ()
{
	AI_Output (other, self, "DIA_Bilgot_HALLO_Burg_15_00"); //Tak, przyszedłem z zamku, a co?
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_01"); //Jak wygląda sytuacja?
	AI_Output (other, self, "DIA_Bilgot_HALLO_Burg_15_02"); //Nie lepiej niż tu. Orkowie nadal tam są, jeśli o to pytasz.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_03"); //Cholera. Nigdzie nie jesteś bezpieczny.
	AI_Output (self, other, "DIA_Bilgot_HALLO_Burg_05_04"); //Coś ci powiem. Gdybym nie był tak przerażony, już dawno bym się stąd zmył.
	
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
	description	 = 	"A co tu właściwie robisz?";
};
func int DIA_Bilgot_Job_Condition ()
{
	return TRUE;
};
func void DIA_Bilgot_Job_Info ()
{
	AI_Output (other, self, "DIA_Bilgot_Job_15_00"); //A co tu właściwie robisz?
	AI_Output (self, other, "DIA_Bilgot_Job_05_01"); //A, robię tu za chłopca na posyłki. Zanieś to tam, miej na oku zębacze, Bilgot chodź tu, Bilgot idź tam...
	AI_Output (self, other, "DIA_Bilgot_Job_05_02"); //Mogłem zostać w domu z moją starą. Tam było tak samo, ale mogłem przynajmniej porządnie zjeść.
	AI_Output (self, other, "DIA_Bilgot_Job_05_03"); //A teraz jestem ostatnim niedobitkiem z kontyngentu przydzielonego do Fajetha.
	AI_Output (self, other, "DIA_Bilgot_Job_05_04"); //Skąd miałem wiedzieć, że ta ekspedycja nie wróci?
	AI_Output (self, other, "DIA_Bilgot_Job_05_05"); //Mój kumpel, Olav, ulotnił się. Może JEMU się udało...
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
	description	 = 	"Co wiesz o zębaczach?";
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
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_00"); //Co wiesz o zębaczach?
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_01"); //A czemu chcesz to wiedzieć? Tylko nie mów, że jesteś po prostu ciekawy!
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_02"); //Zamierzam zapolować na te zębacze.
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_03"); //To szaleństwo. Obserwowałem je - to krwiożercze bestie.
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_04"); //No to powiedz mi, co o nich wiesz.
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_05"); //Hmmm... Mógłbym ci pomóc, ale pod jednym warunkiem!
	AI_Output (other, self, "DIA_Bilgot_Hilfe_15_06"); //Czego chcesz?
	AI_Output (self, other, "DIA_Bilgot_Hilfe_05_07"); //Jeśli uda ci się pozabijać zębacze, to mnie stąd wyciągniesz!
	
	if ((Npc_IsDead (Fed)) == FALSE)
	{
		AI_Output (self, other, "DIA_Bilgot_Hilfe_05_08"); //Nie wytrzymam tu dłużej. Rozmawiałeś z Fedem? Ten facet to kompletny wrak - nie chcę skończyć jak on.
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
	description	 = 	"Powiedz mi, co wiesz. Wtedy cię stąd zabiorę.";
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
	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_00"); //Powiedz mi, co wiesz. Wtedy cię stąd zabiorę.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_01"); //Wiedziałem, że mogę na ciebie liczyć. No to słuchaj. Dość długo obserwowałem zębacze.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_02"); //Są bardzo sprytne i jakoś się... porozumiewają. Nigdy nie chodzą same. Atakują całym stadem.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_03"); //Ale jest coś jeszcze. Wśród nich jest jakiś inny jaszczur. Rzadko się pokazuje, ale go widziałem.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_04"); //Inne zębacze pochylają łby, kiedy przechodzi, ale ciągle go obserwują.
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_05"); //Dopóki ten jeden się nie ruszy, reszta też nie.
	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_06"); //Gdzie znajdę to cholerne bydlę?
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_07"); //Widziałem go koło schodów prowadzących do starej wieży strażniczej.

	AI_Output (other, self, "DIA_Bilgot_KNOWSLEADSNAPPER_15_08"); //Świetnie. Chyba zrozumiałem. Dziękuję!
	AI_Output (self, other, "DIA_Bilgot_KNOWSLEADSNAPPER_05_09"); //Pamiętaj, dałeś mi słowo!

	Wld_InsertNpc (NewMine_LeadSnapper,"OW_ORC_LOOKOUT_2_01"); //Der Rudelführer
	
	B_LogEntry (TOPIC_FajethKillSnapper,"Bilgot opowiedział mi o przywódcy stada zębaczy. Znajdę go na schodach starej wieży strażniczej."); 
	
	Log_CreateTopic (TOPIC_BilgotEscort,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BilgotEscort,LOG_RUNNING);
	B_LogEntry (TOPIC_BilgotEscort,"Bilgot chce, abym pomógł mu wydostać się z doliny.");
		
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
	AI_Output (other, self, "DIA_Bilgot_TAKEYOUWITHME_15_00"); //Pora ruszać, Bilgot! Pakuj manatki.
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
	description	 = 	"Nie możesz iść trochę szybciej?!";
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
	AI_Output (other, self, "DIA_Bilgot_LAUFSCHNELLER_15_00"); //Nie możesz iść trochę szybciej?!
	AI_Output (self, other, "DIA_Bilgot_LAUFSCHNELLER_05_01"); //Idę tak szybko, jak daję radę.
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
	AI_Output (other, self, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_00"); //Dobra, jesteśmy. A teraz szybko. Ten teren jest niepewny!
	AI_Output (self, other, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_01"); //Dziękuję!
	AI_Output (other, self, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_02"); //Nie daj się zjeść. Szkoda by cię było.
	AI_Output (self, other, "DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_03"); //Żegnaj!
	
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
	description	 = 	"Co tu robisz? Myślałem, że szedłeś do przełęczy?";
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
	AI_Output (other, self, "DIA_Bilgot_LetztePause_15_00"); //Co tu robisz? Myślałem, że szedłeś do przełęczy?
	AI_Output (self, other, "DIA_Bilgot_LetztePause_05_01"); //Już nie mogę. Pozwól mi chwilę odpocząć. Dam radę. Nie martw się!
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
	description	 = 	"Znalazłem Olava.";
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
	AI_Output (other, self, "DIA_Bilgot_Olav_15_00"); //Znalazłem Olava.
	AI_Output (self, other, "DIA_Bilgot_Olav_05_01"); //Jak się ma?
	AI_Output (other, self, "DIA_Bilgot_Olav_15_02"); //Nie żyje. Wilki go zjadły.
	AI_Output (self, other, "DIA_Bilgot_Olav_05_03"); //O, cholera. Mam nadzieję, że chociaż ja zdołam się stąd wyrwać.
	
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



