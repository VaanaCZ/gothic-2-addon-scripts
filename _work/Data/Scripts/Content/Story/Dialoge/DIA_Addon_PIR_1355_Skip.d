// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Skip_EXIT(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 999;
	condition	= DIA_Addon_Skip_EXIT_Condition;
	information	= DIA_Addon_Skip_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Skip_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Skip_PICKPOCKET (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 900;
	condition	= DIA_Addon_Skip_PICKPOCKET_Condition;
	information	= DIA_Addon_Skip_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Skip_PICKPOCKET_Condition()
{
	C_Beklauen (20, 43);
};
 
FUNC VOID DIA_Addon_Skip_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Skip_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Skip_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Skip_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Skip_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Skip_PICKPOCKET_DoIt);
};

func void DIA_Addon_Skip_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Skip_PICKPOCKET);
};
	
func void DIA_Addon_Skip_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Skip_PICKPOCKET);
};
// ************************************************************
// 			  				Hello 
// ************************************************************
INSTANCE DIA_Addon_Skip_Hello(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Hello_Condition;
	information	= DIA_Addon_Skip_Hello_Info;

	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& PlayerTalkedToSkipNW == TRUE
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_00"); //A kogó¿ to stary Skip znowu widzi!
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_01"); //Ja ciê znam!
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_02"); //Zatoka ko³o miasta, pamiêtasz?
	AI_Output (other,self ,"DIA_Addon_Skip_Hello_15_03"); //Skip? To ty?
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_04"); //Jak widaæ, trudno mnie zapomnieæ.
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_05"); //Ale wydaje mi siê, ¿e jeszcze gdzieœ ciê widzia³em...
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_06"); //A, no tak!
	B_UseFakeScroll ();
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_07"); //Rysownik siê nie popisa³, ale to by³eœ ty.
	AI_Output (self ,other,"DIA_Addon_Skip_Hello_08_08"); //Ale nie ma o czym gadaæ. Na swoim liœcie goñczym te¿ wygl¹dam doœæ szpetnie.
	Npc_ExchangeRoutine	(self,"Start");
};

// ************************************************************
// 			  			 Baltrams Paket
// ************************************************************
instance DIA_Addon_SkipADW_BaltramPaket		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 2;
	condition	= DIA_Addon_SkipADW_BaltramPaket_Condition;
	information	= DIA_Addon_SkipADW_BaltramPaket_Info;

	description	= "Mam dla ciebie paczkê od Baltrama.";
};
func int DIA_Addon_SkipADW_BaltramPaket_Condition ()
{
	if (Npc_HasItems (other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
};
func void DIA_Addon_SkipADW_BaltramPaket_Info ()
{
	AI_Output	(other, self, "DIA_Addon_SkipADW_BaltramPaket_15_00"); //Mam dla ciebie paczkê od Baltrama.
	AI_Output	(self, other, "DIA_Addon_SkipADW_BaltramPaket_08_01"); //Chyba naprawdê potrzebuje rumu, bo po co wysy³a³by towar w taki sposób?
	B_GiveInvItems (other, self, ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output	(self, other, "DIA_Addon_SkipADW_BaltramPaket_08_02"); //Oto dwie butelki rumu. Niestety, trzeci¹ opró¿ni³em, czekaj¹c tu na niego.
	B_GiveInvItems (self, other, ItFo_Addon_Rum, 2);		
	B_GivePlayerXP (XP_Addon_Skip_BaltramPaket);
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram); 
	Skip_Rum4Baltram = TRUE;
};

// ************************************************************
// 			  			Was machst du hier?
// ************************************************************
INSTANCE DIA_Addon_Skip_Job(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 3;
	condition	= DIA_Addon_Skip_Job_Condition;
	information	= DIA_Addon_Skip_Job_Info;

	description = "Co tu robisz?";
};                       
FUNC INT DIA_Addon_Skip_Job_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_Job_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Job_15_00"); //Co tu robisz?
	AI_Output (self ,other, "DIA_Addon_Skip_Job_08_01"); //Wróci³em z Khorinis i czekam na powrót kapitana Grega.
};

// ************************************************************
// 			  			Greg getroffen!
// ************************************************************
instance DIA_Addon_Skip_ADW_GregGetroffen		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 4;
	condition	= DIA_Addon_Skip_ADW_GregGetroffen_Condition;
	information	= DIA_Addon_Skip_ADW_GregGetroffen_Info;

	description	= "Widzia³em Grega w Khorinis.";
};
func int DIA_Addon_Skip_ADW_GregGetroffen_Condition ()
{
	if (PlayerTalkedToGregNW  == TRUE)
	&& (GregIsBack == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_Job))
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_ADW_GregGetroffen_Info ()
{
	AI_Output (other, self, "DIA_Addon_Skip_ADW_GregGetroffen_15_00"); //Widzia³em Grega w Khorinis.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_01"); //Naprawdê? Niech to diabli! Coœ musia³o pójœæ naprawdê Ÿle!
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_02"); //Powinien ju¿ dawno wróciæ z naszym statkiem.
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_03"); //Najlepiej bêdzie, jeœli wrócê do Khorinis i poczekam tam na niego...
	AI_Output (self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_04"); //Ale nie dzisiaj. Dopiero co wróci³em.
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 			  			Überfahrt - PERM
// ************************************************************
var int Skip_Transport_Variation;
// ------------------------------------------------------------
instance DIA_Addon_Skip_Transport(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 99;
	condition	= DIA_Addon_Skip_Transport_Condition;
	information	= DIA_Addon_Skip_Transport_Info;
	permanent	= TRUE;
	description = "Mo¿esz mnie zabraæ do Khorinis?";
};                       
FUNC INT DIA_Addon_Skip_Transport_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Job))
	&& (self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Skip_Transport_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Transport_15_00"); //Mo¿esz mnie zabraæ do Khorinis?
	if (GregIsBack == FALSE)
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_01"); //Nie. Wyruszam póŸniej. Najpierw muszê odpocz¹æ i napiæ siê grogu.
	}
	else if (Skip_Transport_Variation == 0)
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_02"); //Zwariowa³eœ? Straciliœmy nasz statek, rozumiesz?
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_03"); //Nie mam zamiaru u¿ywaæ naszej ostatniej ³odzi, aby przewieŸæ kogoœ, komu nie chce siê ruszyæ ty³ka!
		Skip_Transport_Variation = 1;
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Skip_Transport_08_04"); //Ile razy mam powtarzaæ? Nie!
	};
};

// ************************************************************
// 			 			Banditen + Rüstung
// ************************************************************
// ------------------------------------------------------------
// 							About Bandits
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Bandits(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_Bandits_Condition;
	information	= DIA_Addon_Skip_Bandits_Info;

	description = "Co mo¿esz mi powiedzieæ o bandytach?";
};                       
FUNC INT DIA_Addon_Skip_Bandits_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Skip_Bandits_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Bandits_15_00"); //Co mo¿esz mi powiedzieæ o bandytach?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_01"); //Bandytach? Napadaj¹ nas, ot co!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_02"); //Niby po co wznosimy tê palisadê?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_03"); //To my ich tu przywieŸliœmy.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_04"); //Nawet z nimi handlowaliœmy. ¯ebyœ wiedzia³, ile oni maj¹ z³ota! Ca³e krocie, mówiê ci!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_05"); //Byli gotowi p³aciæ ka¿d¹ cenê za beczkê rumu.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_06"); //Ale to ju¿ nale¿y do przesz³oœci. Teraz trwa wojna!
	AI_Output (other, self, "DIA_Addon_Erol_Bandits_15_06"); //Co siê sta³o?
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_07"); //Ci dranie nie zap³acili nam za ostatni¹ dostawê.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_08"); //A wiêc poszed³em do nich, ¿eby dostaæ swoje z³oto.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_09"); //Kiedy tylko wszed³em na bagna, ci obwiesie rzucili siê na mnie!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_10"); //Co gorsza, za³atwili Angusa i Hanka - dwóch naszych najlepszych ¿eglarzy!
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_11"); //Nie zapuszczaj siê na bagna, mówiê ci.
	AI_Output (self, other, "DIA_Addon_Skip_Bandits_08_12"); //Atakuj¹ ka¿dego, kto wygl¹da inaczej ni¿ oni!
	
	
};

// ------------------------------------------------------------
// 						Banditenrüstung
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_ArmorPrice(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_ArmorPrice_Condition;
	information	= DIA_Addon_Skip_ArmorPrice_Info;

	description = "Potrzebny mi pancerz bandytów.";
};                       
FUNC INT DIA_Addon_Skip_ArmorPrice_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Bandits))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};			
};
func VOID DIA_Addon_Skip_ArmorPrice_Info()
{	
	AI_Output (other,self , "DIA_Addon_Skip_ArmorPrice_15_00"); //Potrzebny mi pancerz bandytów.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_01"); //Chcesz tam iœæ? Odbi³o ci do reszty. 
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_02"); //Kiedy bandyci odkryj¹, ¿e nie jesteœ jednym z nich, nakarmi¹ tob¹ wê¿e b³otne.
	AI_Output (other, self, "DIA_Addon_Skip_ArmorPrice_15_02"); //Wiesz, gdzie móg³bym znaleŸæ taki pancerz?
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_03"); //Nigdy siê nie poddajesz, co? Dobrze wiêc. Kiedyœ mieliœmy jeden taki.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_04"); //Mo¿e wci¹¿ le¿y gdzieœ w chacie Grega.
	AI_Output (self ,other, "DIA_Addon_Skip_ArmorPrice_08_05"); //Mo¿e ci go da, jeœli tylko wróci...
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Skip podejrzewa, ¿e zbroja jest w chacie Grega."); 
};

// ------------------------------------------------------------
// 						In Gregs Hütte
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_GregsHut(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_GregsHut_Condition;
	information	= DIA_Addon_Skip_GregsHut_Info;
	permanent	= FALSE;
	description = "A jak siê dostaæ do chaty?";
};                       
FUNC INT DIA_Addon_Skip_GregsHut_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_ArmorPrice))
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};			
};

FUNC VOID DIA_Addon_Skip_GregsHut_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_GregsHut_15_00"); //A jak siê dostaæ do chaty?
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_01"); //Spokojnie, ch³opcze!
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_02"); //Chcesz podwêdziæ coœ, co nale¿y do Grega?
	AI_Output (self ,other,"DIA_Addon_Skip_GregsHut_08_03"); //Kiedy kapitan opuszcza³ nasz obóz, poleci³ Francisowi pilnowaæ, aby nikt nie wchodzi³ do jego chaty.
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Francis ma klucz do chaty Grega, ale nie wpuœci nikogo do œrodka."); 
	
	Knows_GregsHut = TRUE;
};

// ------------------------------------------------------------
//					Über Francis --> Samuel
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Francis (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 6;
	condition	= DIA_Addon_Skip_Francis_Condition;
	information	= DIA_Addon_Skip_Francis_Info;
	permanent	= FALSE;
	description = "Co mo¿esz mi powiedzieæ o Francisie?";
};   
FUNC INT DIA_Addon_Skip_Francis_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
	{
		return TRUE;
	};			
};

FUNC VOID DIA_Addon_Skip_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Francis_15_00"); //Co mo¿esz mi powiedzieæ o Francisie?
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_01"); //To nasz skarbnik.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_02"); //Kapitan mu bardzo ufa. To dlatego powierzy³ mu zastêpstwo.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_03"); //Chocia¿ reszta ch³opaków nie szanuje go zbytnio.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_04"); //Jeœli chcesz wiedzieæ wiêcej, pogadaj z Samuelem.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_05"); //Siedzi w ma³ej jaskini, na pó³noc st¹d.
	AI_Output (self ,other,"DIA_Addon_Skip_Francis_08_06"); //Samuel wie prawie wszystko o prawie wszystkich.
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Powinienem porozmawiaæ z Samuelem. Mo¿e bêdzie móg³ mi daæ jakieœ wskazówki."); 
};
	
	
// ************************************************************
// 						Die Turmbanditen
// ************************************************************
// ------------------------------------------------------------
// 			 				Raven
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Raven(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_Raven_Condition;
	information	= DIA_Addon_Skip_Raven_Info;
	permanent	= FALSE;
	description = "Spotka³eœ kiedyœ Kruka?";
};                       
FUNC INT DIA_Addon_Skip_Raven_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Skip_Bandits) == TRUE)
	{
		return TRUE;
	};			
};
FUNC VOID DIA_Addon_Skip_Raven_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_Raven_15_00"); //Spotka³eœ kiedyœ Kruka?
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_01"); //Pewnie. Sta³em wtedy na stra¿y z Henrym. Widzieliœmy, jak Kruk zostawia swoich ludzi w wie¿y stoj¹cej kawa³ek na po³udnie st¹d.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_02"); //Skoro zostawi³ ich tak blisko, to na pewno maj¹ nas szpiegowaæ.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_03"); //Widzia³em te¿, jak obchodzi siê z ludŸmi, którzy nie okazuj¹ pos³uszeñstwa.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_04"); //Kiedy ktoœ poka¿e choæ cieñ niesubordynacji, mo¿e straciæ g³owê.
	AI_Output (self ,other,"DIA_Addon_Skip_Raven_08_05"); //Uwa¿aj na Kruka, dobrze ci radzê.
};



// ************************************************************
// ***														***
// 						Die Angus und Hank Show
// ***														***
// ************************************************************

// ------------------------------------------------------------
// 			 			Angus und Hank.
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHank(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHank_Condition;
	information	= DIA_Addon_Skip_AngusHank_Info;

	description = "Opowiedz mi coœ wiêcej o Angusie i Hanku.";
};                       
FUNC INT DIA_Addon_Skip_AngusHank_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_Bandits))
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHank_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_AngusnHank_15_00"); //Opowiedz mi coœ wiêcej o Angusie i Hanku.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_01"); //Angus i Hank mieli spotkaæ siê z bandytami poza obozem.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_02"); //Mieli ze sob¹ wszystko, co tamci zamówili.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_03"); //Kut¹ stal, wytrychy i inne takie rzeczy. 
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_04"); //Niestety, nie wrócili. Te sukinsyny musia³y ich za³atwiæ!
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_05"); //Morgan i Bill szukali ich, ale bezskutecznie.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_06"); //Bill by³ szczególnie smutny, bo Angus i Hank to jego bliscy przyjaciele.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_07"); //Jest m³ody i s³abo znosi takie wydarzenia.
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_08"); //Inni przyjêli to ze spokojem. Utrata dóbr nie jest niczym wielkim. Ale ten grog, który nieœli...
	AI_Output (self ,other,"DIA_Addon_Skip_AngusnHank_08_09"); //By³o tego ze 20 butelek!
	MIS_ADDON_SkipsGrog = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_SkipsGrog,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_SkipsGrog,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Skip chce odzyskaæ 20 butelek grogu, które zabrali mu bandyci.");
	Log_AddEntry	(TOPIC_Addon_SkipsGrog,"Angus i Hank mieli pohandlowaæ z bandytami. Od tej pory ich nie widziano.");
	Log_AddEntry	(TOPIC_Addon_SkipsGrog,"Poszukiwania Morgana i Billa nie przynios³y efektu...");
};

// ------------------------------------------------------------
// 			 		Angus und Hank sind TOT
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHankDead(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHankDead_Condition;
	information	= DIA_Addon_Skip_AngusHankDead_Info;
	permanent	= FALSE;
	description = "Jeœli chodzi o Angusa i Hanka...";
};                       
FUNC INT DIA_Addon_Skip_AngusHankDead_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_Bandits))
	&& (!Npc_HasItems (Angus, ItRi_Addon_MorgansRing_Mission))
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHankDead_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_00"); //Jeœli chodzi o Angusa i Hanka...
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_01"); //Tak?
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_01"); //Znalaz³em ich.
	//AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_02"); //Sie sind tot, richtig?
	AI_Output (other, self, "DIA_Addon_Skip_AngusnHankDead_15_03"); //Nie ¿yj¹.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_03"); //A wiêc jednak. Biedni dranie!
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_04"); //Ale nie liczy³em na nic innego.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_05"); //Powinieneœ zanieœæ te smutne wieœci Billowi, jeœli dot¹d tego nie zrobi³eœ.
	AI_Output (self ,other, "DIA_Addon_Skip_AngusnHankDead_08_06"); //Ale nie wal prosto z mostu. Bill jest jeszcze m³ody.
};

// ------------------------------------------------------------
// 			 			Kenne den Mörder
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AngusHankMurder(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 5;
	condition	= DIA_Addon_Skip_AngusHankMurder_Condition;
	information	= DIA_Addon_Skip_AngusHankMurder_Info;
	permanent	= FALSE;
	description = "Wiem, kto zamordowa³ Angusa i Hanka.";
};                       
FUNC INT DIA_Addon_Skip_AngusHankMurder_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_AngusHankDead))
	&& (SC_Knows_JuanMurderedAngus == TRUE)
	{ 
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_AngusHankMurder_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_JuanMurder_15_00"); //Wiem, kto zamordowa³ Angusa i Hanka.
	if (MIS_ADDON_SkipsGrog == LOG_SUCCESS)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_01"); //No i dobrze. Ale to im nie zwróci ¿ycia.
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_02"); //Zemsta to z³y sposób na zdobycie ³upów.
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_03"); //Najwa¿niejsze, ¿e odzyska³em swój grog.
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_AngusHankMurder_08_04"); //Morderca mnie nie obchodzi! Co z moim grogiem?
	};
};

// ------------------------------------------------------------
// 							Grog zurück
// ------------------------------------------------------------
instance DIA_Addon_Skip_Grog		(C_INFO)
{
	npc		 	= PIR_1355_Addon_Skip;
	nr		 	= 9;
	condition	= DIA_Addon_Skip_Grog_Condition;
	information	= DIA_Addon_Skip_Grog_Info;
	permanent	= TRUE;
	description	= "W sprawie grogu...";
};
func int DIA_Addon_Skip_Grog_Condition ()
{
	if (MIS_ADDON_SkipsGrog == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_Grog_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_Grog_15_00"); //W sprawie grogu...
		
	if (Npc_HasItems (other,Itfo_Addon_Grog)>= 20)
	{
		Info_ClearChoices	(DIA_Addon_Skip_Grog);
		Info_AddChoice	(DIA_Addon_Skip_Grog, DIALOG_BACK, DIA_Addon_Skip_Grog_back );
		Info_AddChoice	(DIA_Addon_Skip_Grog, "Oto twoje 20 flaszek.", DIA_Addon_Skip_Grog_geben );
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Skip_Grog_15_01"); //Brakuje 20 butelek, tak?
		AI_Output	(self, other, "DIA_Addon_Skip_Grog_08_02"); //Tak, do cholery! To by³ nasz ca³y zapas!
	};
};
func void DIA_Addon_Skip_Grog_back ()
{
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};
func void DIA_Addon_Skip_Grog_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_00"); //Oto twoje 20 flaszek.
	B_GiveInvItems (other, self, Itfo_Addon_Grog, 20);
	
	B_LogEntry	(TOPIC_Addon_SkipsGrog,"Skip odzyska³ swoje 20 butelek grogu i jest zadowolony.");
	
	MIS_ADDON_SkipsGrog = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_SkipsGrog);

	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_01"); //Niech mnie kule bij¹! Tak za darmo?
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_02"); //No có¿...
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_03"); //Dobrze, zap³acê ci.
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_geben_15_04"); //Masz mo¿e coœ bardziej interesuj¹cego ni¿ z³oto?
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_05"); //Hmmm... Pomyœlmy... O, mam pierœcieñ.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_06"); //Wygra³em go wiele lat temu w koœci w jednej z portowych tawern.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_07"); //Cz³owiek, który go przegra³, zapewnia³, ¿e pierœcieñ jest magiczny. Ale nigdy nie mia³em okazji sprawdziæ, czy to prawda.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_geben_08_08"); //Chcesz pierœcieñ czy z³oto?
	
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
	Info_AddChoice	(DIA_Addon_Skip_Grog, "Wezmê pieni¹dze.", DIA_Addon_Skip_Grog_gold );
	Info_AddChoice	(DIA_Addon_Skip_Grog, "Daj mi pierœcieñ.", DIA_Addon_Skip_Grog_ring );
};
func void DIA_Addon_Skip_Grog_ring ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_ring_15_00"); //Daj mi pierœcieñ.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_ring_08_01"); //Proszê bardzo.
	B_GiveInvItems (self, other, ItRi_Prot_Edge_02, 1);		
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};
func void DIA_Addon_Skip_Grog_gold ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_Grog_gold_15_00"); //Wezmê pieni¹dze.
	AI_Output			(self, other, "DIA_Addon_Skip_Grog_gold_08_01"); //Nie ma sprawy.
	var int GrogKohle;
	GrogKohle = (Value_Grog * 20);
	B_GiveInvItems (self, other, ItMi_Gold, GrogKohle);		
	Info_ClearChoices	(DIA_Addon_Skip_Grog);
};



// ************************************************************
// 			  				TRADE 
// ************************************************************
INSTANCE DIA_Addon_Skip_News(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 888;
	condition	= DIA_Addon_Skip_News_Condition;
	information	= DIA_Addon_Skip_News_Info;
	permanent	= FALSE;
	description = "Masz mo¿e coœ do sprzedania?";
};                       
FUNC INT DIA_Addon_Skip_News_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Skip_News_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Skip_News_15_00"); //Masz mo¿e coœ do sprzedania?
	AI_Output (self ,other,"DIA_Addon_Skip_News_08_01"); //Jeœli chcesz pohandlowaæ, to pogadaj z Garrettem. On zajmuje siê naszymi zapasami.

	Log_CreateTopic (Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
};



// ************************************************************
// *** 														***
// 						Mitkommen (Greg)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Anheuern(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 11;
	condition	= DIA_Addon_Skip_Anheuern_Condition;
	information	= DIA_Addon_Skip_Anheuern_Info;
	permanent	= FALSE;
	description = "Powinieneœ mi pomóc.";
};                       
FUNC INT DIA_Addon_Skip_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Skip_Anheuern_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_Anheuern_15_00"); //Powinieneœ mi pomóc.
	AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_01"); //Co jest grane?
	AI_Output (other, self, "DIA_Addon_Skip_Anheuern_15_01"); //Kanion czeka.
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_02"); //Widzê, ¿e zgromadzi³eœ ch³opców. Dobra robota! 
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_03"); //Lepiej weŸ paru ch³opaków!
	};
	AI_Output (self, other, "DIA_Addon_Skip_Anheuern_08_04"); //Kanion jest bardzo niebezpieczny.
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_Skip_ComeOn(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr		 	= 12;
	condition	= DIA_Addon_Skip_ComeOn_Condition;
	information	= DIA_Addon_Skip_ComeOn_Info;
	permanent	= TRUE;
	description	= "ChodŸ ze mn¹.";
};
func int DIA_Addon_Skip_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_Skip_ComeOn_Info ()
{
	AI_Output (other, self, "DIA_Addon_Skip_ComeOn_15_00"); //ChodŸ ze mn¹.
	if (C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_ComeOn_08_02"); //Czekaj. Wróæmy do kanionu.
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_ComeOn_08_01"); //No to w drogê!
		if (C_BodyStateContains (self, BS_SIT))
		{
			AI_StandUp (self);
			B_TurnToNpc (self,other);
		};
		AI_StopProcessInfos (self);
		
		B_Addon_PiratesFollowAgain();
		
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_GoHome(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 13;
	condition	= DIA_Addon_Skip_GoHome_Condition;
	information	= DIA_Addon_Skip_GoHome_Info;
	permanent	= TRUE;
	description = "Nie potrzebujê ju¿ twojej pomocy.";
};                       
FUNC INT DIA_Addon_Skip_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Skip_GoHome_Info()
{	
	AI_Output (other, self, "DIA_Addon_Skip_GoHome_15_00"); //Nie potrzebujê ju¿ twojej pomocy.
	AI_Output (self, other, "DIA_Addon_Skip_GoHome_08_01"); //No to idê. Znajdziesz mnie w obozie, jakby co.
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START");
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_TooFar(C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 14;
	condition	= DIA_Addon_Skip_TooFar_Condition;
	information	= DIA_Addon_Skip_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_TooFar_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_01"); //To wystarczaj¹co daleko!
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_02"); //Jeœli naprawdê chcesz iœæ dalej, to bez nas.
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Skip_TooFar_08_03"); //Jeœli naprawdê chcesz iœæ dalej, to beze mnie.
	};
	
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 			Oase = Treffpunkt
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Treffpunkt (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Treffpunkt_Condition;
	information	= DIA_Addon_Skip_Treffpunkt_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Treffpunkt_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP (self, "ADW_CANYON_TELEPORT_PATH_06") <= 800)
	&& (C_AllCanyonRazorDead() == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_Treffpunkt_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_00"); //Jeœli zostaniemy rozdzieleni, spotkamy siê przy wodzie.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_02"); //Idziemy!
		
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 				Orks!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_Orks (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_Orks_Condition;
	information	= DIA_Addon_Skip_Orks_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_Orks_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP (self, "ADW_CANYON_PATH_TO_LIBRARY_14") <= 2000)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_Orks_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_01"); //Orkowie! Nienawidzê tych bestii!

	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 			Alle Razor tot
// ------------------------------------------------------------
INSTANCE DIA_Addon_Skip_AllRazorsDead (C_INFO)
{
	npc			= PIR_1355_Addon_Skip;
	nr			= 1;
	condition	= DIA_Addon_Skip_AllRazorsDead_Condition;
	information	= DIA_Addon_Skip_AllRazorsDead_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Skip_AllRazorsDead_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_AllCanyonRazorDead() == TRUE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Skip_AllRazorsDead_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_03"); //Wygl¹da na to, ¿e pozbyliœmy siê brzytwiaków.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_04"); //Mo¿emy trochê po³aziæ po okolicy, jeœli chcesz.
	AI_Output (self ,other, "DIA_Addon_Skip_Add_08_05"); //Oczywiœcie musimy zostaæ w kanionie. 
	
	AI_StopProcessInfos (self); 
};


