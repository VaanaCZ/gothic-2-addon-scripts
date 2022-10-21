// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Hanna_EXIT(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 999;
	condition	= DIA_Hanna_EXIT_Condition;
	information	= DIA_Hanna_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Hanna_EXIT_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Hanna_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hello 
// ************************************************************

INSTANCE DIA_Hanna_Hello(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_Hello_Condition;
	information	= DIA_Hanna_Hello_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       

FUNC INT DIA_Hanna_Hello_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Hanna_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Hanna_Hello_17_00"); //Ach, klient - co mogê dla ciebie zrobiæ?
};	

//*****************************************
//	Ich suche ein Zimmer
//*****************************************
INSTANCE DIA_Hanna_Room(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 2;
	condition	= DIA_Hanna_Room_Condition;
	information	= DIA_Hanna_Room_Info;
	permanent	= FALSE;
	description	= "Szukam pokoju.";
};                       

FUNC INT DIA_Hanna_Room_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Hanna_Room_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_Room_15_00"); //Szukam pokoju.
	AI_Output (self ,other,"DIA_Hanna_Room_17_01"); //A wiêc trafi³eœ we w³aœciwe miejsce.
	if (Npc_KnowsInfo (other, DIA_Lothar_Schlafen))
	{
		AI_Output (other, self, "DIA_Hanna_Add_15_03"); //Jeden z paladynów powiedzia³ mi, ¿e mogê tu spêdziæ noc za darmo...
	}
	else
	{
		AI_Output (other, self, "DIA_Hanna_Add_15_00"); //Ile kosztuje nocleg?
		AI_Output (self, other, "DIA_Hanna_Add_17_01"); //Absolutnie nic.
		AI_Output (self, other, "DIA_Hanna_Add_17_02"); //Paladyni op³acaj¹ noclegi dla wszystkich przyjezdnych.
		AI_Output (other, self, "DIA_Hanna_Add_15_04"); //A wiêc mogê tutaj nocowaæ za darmo?
	};
	
	AI_Output (self, other, "DIA_Hanna_Add_17_05"); //Tak.
	AI_Output (self, other, "DIA_Hanna_Add_17_06"); //IdŸ na górê.
	AI_Output (self, other, "DIA_Hanna_Add_17_07"); //Wci¹¿ jeszcze mamy tu kilka wolnych ³ó¿ek.
	//AI_Output (self ,other,"DIA_Hanna_Room_17_02"); //Geh einfach nach oben und suche dir ein Bett.
};

//*****************************************
//	WhyPay
//*****************************************
INSTANCE DIA_Hanna_WhyPay(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 3;
	condition	= DIA_Hanna_WhyPay_Condition;
	information	= DIA_Hanna_WhyPay_Info;
	permanent	= FALSE;
	description	= "Czemu paladyni op³acaj¹ noclegi?";
};                       

FUNC INT DIA_Hanna_WhyPay_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Room))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hanna_WhyPay_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_12"); //Czemu paladyni op³acaj¹ noclegi?
	AI_Output (self, other, "DIA_Hanna_Add_17_13"); //Ja te¿ tego nie rozumiem.
	AI_Output (self, other, "DIA_Hanna_Add_17_14"); //Mo¿e chodzi im o to, ¿eby oczyœciæ ulice z biedoty, która, jak wiadomo, pope³nia wiele przestêpstw.
	AI_Output (self, other, "DIA_Hanna_Add_17_15"); //Poza tym, pewnie chc¹ siê przypodobaæ wêdrownym kupcom.
	AI_Output (self, other, "DIA_Hanna_Add_17_16"); //Odk¹d ch³opi zaczêli siê buntowaæ, to oni s¹ naszym jedynym Ÿród³em zaopatrzenia.
	AI_Output (self, other, "DIA_Hanna_Add_17_17"); //A poza tym, chyba chc¹ za³agodziæ panuj¹ce w mieœcie nastroje.
	AI_Output (self, other, "DIA_Hanna_Add_17_18"); //Lord Andre zorganizowa³ nawet darmowe piwo. Rozdaje je na placu wisielców.
};

//*****************************************
//	WerHier - PERM
//*****************************************
INSTANCE DIA_Hanna_WerHier(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 4;
	condition	= DIA_Hanna_WerHier_Condition;
	information	= DIA_Hanna_WerHier_Info;
	permanent	= TRUE;
	description	= "Kto tu teraz mieszka?";
};                       

FUNC INT DIA_Hanna_WerHier_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Room))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hanna_WerHier_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_08"); //Kto tu teraz mieszka?
	AI_Output (self, other, "DIA_Hanna_Add_17_09"); //Praktycznie wszyscy moi klienci to wêdrowni handlarze.
	AI_Output (other, self, "DIA_Hanna_Add_15_10"); //Aha.
	AI_Output (self, other, "DIA_Hanna_Add_17_11"); //Tylko nie próbuj ich okradaæ! Nie chcê tutaj ¿adnych problemów!
};

//**********************************************
//	Ich hab noch ein paar Fragen zur Stadt
//**********************************************

INSTANCE DIA_Hanna_City(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 5;
	condition	= DIA_Hanna_City_Condition;
	information	= DIA_Hanna_City_Info;
	permanent	= TRUE;
	description	= "Mam parê pytañ dotycz¹cych miasta...";
};                       

FUNC INT DIA_Hanna_City_Condition()
{
		return TRUE;	
};
 
FUNC VOID DIA_Hanna_City_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_City_15_00"); //Mam parê pytañ dotycz¹cych miasta...
	
	Info_ClearChoices (DIA_Hanna_City);
	Info_AddChoice (DIA_Hanna_City,DIALOG_BACK,DIA_Hanna_City_Back);
	Info_AddChoice (DIA_Hanna_City,"Gdzie mogê tu coœ kupiæ?",DIA_Hanna_City_Buy);
	Info_AddChoice (DIA_Hanna_City,"Opowiedz mi o mieœcie.",DIA_Hanna_City_City);
};

FUNC VOID DIA_Hanna_City_Back ()
{
	Info_ClearChoices (DIA_Hanna_City);
};

FUNC VOID DIA_Hanna_City_Buy ()
{
	AI_Output (other,self ,"DIA_Hanna_City_Buy_15_00"); //Gdzie mogê tu coœ kupiæ?
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_01"); //Targ znajduje siê dok³adnie naprzeciwko drzwi frontowych. Znajdziesz tam wszelkie mo¿liwe towary.
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_02"); //Po drugiej stronie miasta jest jeszcze kilka sklepów i zak³adów rzemieœlniczych. Wiêkszoœæ z nich znajduje siê przy bramie.
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_03"); //Ryby mo¿esz kupiæ w dzielnicy portowej. Sklep rybny znajdziesz tam bez trudu.
};

FUNC VOID DIA_Hanna_City_City ()
{
	AI_Output (other,self ,"DIA_Hanna_City_City_15_00"); //Opowiedz mi o mieœcie.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_01"); //Khorinis to jedno z najbogatszych miast w królestwie, choæ mo¿e w tym momencie trudno w to uwierzyæ.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_02"); //Odk¹d zaczê³a siê wojna z orkami, handel przesta³ przynosiæ zyski. Król za¿¹da³, ¿eby wszystkie statki handlowe zosta³y skonfiskowane na u¿ytek armii.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_03"); //Wiêc rzadko przyp³ywaj¹ tutaj jakiekolwiek jednostki, co z kolei oznacza marne zaopatrzenie. Wielu mieszkañców martwi taki stan rzeczy.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_04"); //Nikt nie mo¿e przewidzieæ, co przyniesie przysz³oœæ. Mo¿emy tylko z pokor¹ czekaæ na to, co ma nast¹piæ. Chyba nie mamy ¿adnego wp³ywu na przysz³e wydarzenia.
};



//##################################
//##
//##	Kapitel 3
//##
//##################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Hanna_Kap3_EXIT(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 999;
	condition	= DIA_Hanna_Kap3_EXIT_Condition;
	information	= DIA_Hanna_Kap3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Hanna_Kap3_EXIT_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_Kap3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

var int Hanna_PriceForLetter;

// ************************************************************
// 		Wie sieht´s aus?
// ************************************************************
INSTANCE DIA_Hanna_AnyNews(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 31;
	condition	= DIA_Hanna_AnyNews_Condition;
	information	= DIA_Hanna_AnyNews_Info;
	permanent	= FALSE;
	description = "Co s³ychaæ?";
};                       
FUNC INT DIA_Hanna_AnyNews_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_AnyNews_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_AnyNews_15_00"); //Jak ci idzie?
	AI_Output (self ,other,"DIA_Hanna_AnyNews_17_01"); //Nie wygl¹dasz na osobê, która przejmuje siê cudzymi zmartwieniami.
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Jasne, oczywiœcie.",DIA_Hanna_AnyNews_Yes);
	Info_AddChoice (DIA_Hanna_AnyNews,"To zale¿y.",DIA_Hanna_AnyNews_Depends);
	Info_AddChoice (DIA_Hanna_AnyNews,"Nie.",DIA_Hanna_AnyNews_No);
};

FUNC VOID DIA_Hanna_AnyNews_No ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_No_15_00"); //Niezupe³nie.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_No_17_01"); //No widzisz, o tym w³aœnie mówiê. Ka¿dy teraz myœli tylko o sobie. Czego chcesz?

	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Depends ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Depends_15_00"); //To zale¿y.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Depends_17_01"); //To zale¿y, ile mo¿na na tym zarobiæ, to chcesz powiedzieæ.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Depends_17_02"); //Nie znoszê takich jak ty.


	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_15_00"); //Tak, pewnie. Nie ma problemu.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_01"); //Wiesz, ¿ycie jest pe³ne niespodzianek. Ostatnio robi³am porz¹dek w moich rzeczach i znalaz³am parê starych map, które sprzeda³am kartografowi Brahimowi z portu.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_02"); //Niestety, nied³ugo potem zauwa¿y³am, ¿e brakuje mi pewnego dokumentu.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_03"); //Przypuszczam, ¿e jakimœ cudem dosta³ siê pomiêdzy mapy.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_04"); //Czy móg³byœ go dla mnie odzyskaæ?
	
	MIS_HannaRetrieveLetter = LOG_RUNNING;

	Log_CreateTopic (TOPIC_HannaRetrieveLetter, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HannaRetrieveLetter, LOG_RUNNING);
	B_LogEntry (TOPIC_HannaRetrieveLetter,"Hanna zgubi³a pewien dokument. Najprawdopodobniej znajduje siê on w dzielnicy portowej, gdzie mieœci siê siedziba kartografa Brahima."); 


	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Nie jestem ch³opcem na posy³ki.",DIA_Hanna_AnyNews_Yes_Footboy);
	Info_AddChoice (DIA_Hanna_AnyNews,"A co JA bêdê z tego mia³?",DIA_Hanna_AnyNews_Yes_Reward);
	Info_AddChoice (DIA_Hanna_AnyNews,"Zobaczê, co da siê zrobiæ.",DIA_Hanna_AnyNews_Yes_WillSee);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Footboy ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Footboy_15_00"); //Nie jestem ch³opcem na posy³ki.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Footboy_17_01"); //Rozumiem - problemy prostej kobiety nic dla ciebie nie znacz¹. Widzê, ¿e sama bêdê musia³a siê tym zaj¹æ.

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_15_00"); //A co z tego bêdê mia³?
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_17_01"); //Aha, wiedzia³am. Niczym siê nie ró¿nisz od tej ho³oty mieszkaj¹cej w porcie.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_17_02"); //Wiêc czego chcesz ode mnie, biednej kobiety?
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Niewa¿ne.",DIA_Hanna_AnyNews_Yes_Reward_OK);
	Info_AddChoice (DIA_Hanna_AnyNews,"Mog³abyœ byæ dla mnie nieco milsza...",DIA_Hanna_AnyNews_Yes_Reward_BeNice);
	Info_AddChoice (DIA_Hanna_AnyNews,"Z³ota.",DIA_Hanna_AnyNews_Yes_Reward_Gold);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_OK ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_OK_15_00"); //Niewa¿ne.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_OK_17_01"); //Widzê, ¿e jednak pozosta³a ci krztyna przyzwoitoœci. Jeœli odzyskasz ten dokument, dostaniesz ode mnie 75 sztuk z³ota.

	Hanna_PriceForLetter = 75;
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_BeNice ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_15_00"); //Mog³abyœ byæ dla mnie nieco milsza...
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_17_01"); //To oburzaj¹ce. Wy...wynoœ siê st¹d! Ty wieprzu!
	
	MIS_HannaRetrieveLetter = LOG_FAILED;
	
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_Gold ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_Gold_15_00"); //Z³ota.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_01"); //Mogê ci za to daæ 50 sztuk z³ota, nie wiêcej.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_02"); //Jeœli zdo³asz odzyskaæ dokument, dostaniesz ode mnie 50 sztuk z³ota.

	Hanna_PriceForLetter = 50;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};	

FUNC VOID DIA_Hanna_AnyNews_Yes_WillSee ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_WillSee_15_00"); //Zobaczê, co da siê zrobiæ.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_01"); //Jesteœ taki s³odki. Powodzenia!
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_02"); //Jeœli przyniesiesz mi ten dokument, dostaniesz ode mnie nagrodê.
	
	Hanna_PriceForLetter = 200;
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
};


// ************************************************************
//		Meinst du dieses Schriftstück?
// ************************************************************
INSTANCE DIA_Hanna_ThisLetter(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 31;
	condition	= DIA_Hanna_ThisLetter_Condition;
	information	= DIA_Hanna_ThisLetter_Info;
	permanent	= FALSE;
	description = "Czy chodzi³o o ten dokument?";
};                       
FUNC INT DIA_Hanna_ThisLetter_Condition()
{
	if (MIS_HannaRetrieveLetter == LOG_RUNNING)
	&& (Npc_HasItems (other,ItWr_ShatteredGolem_Mis) >= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_ThisLetter_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_ThisLetter_15_00"); //Czy chodzi³o o ten dokument?
	AI_Output (self ,other,"DIA_Hanna_ThisLetter_17_01"); //Tak, w³aœnie o ten. Dziêkujê ci.
	AI_Output (other,self ,"DIA_Hanna_ThisLetter_15_02"); //Gdzie moja nagroda?
	AI_Output (self ,other,"DIA_Hanna_ThisLetter_17_03"); //Nie tak szybko. Oto twoje pieni¹dze.
		
	CreateInvItems (self,ItMi_Gold,Hanna_PriceForLetter);
	B_GiveInvItems (self,other,ItMi_Gold,Hanna_PriceForLetter);
	
	MIS_HannaRetrieveLetter = LOG_SUCCESS;
	B_GivePlayerXP (XP_HannaRetrieveLetter);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hanna_PICKPOCKET (C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 900;
	condition	= DIA_Hanna_PICKPOCKET_Condition;
	information	= DIA_Hanna_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Hanna_PICKPOCKET_Condition()
{
	C_Beklauen (45, 25);
};
 
FUNC VOID DIA_Hanna_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hanna_PICKPOCKET);
	Info_AddChoice		(DIA_Hanna_PICKPOCKET, DIALOG_BACK 		,DIA_Hanna_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hanna_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hanna_PICKPOCKET_DoIt);
};

func void DIA_Hanna_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hanna_PICKPOCKET);
};
	
func void DIA_Hanna_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hanna_PICKPOCKET);
};


// ************************************************************
//						Aus Keller
// ************************************************************

INSTANCE DIA_Hanna_AusKeller(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 11;
	condition	= DIA_Hanna_AusKeller_Condition;
	information	= DIA_Hanna_AusKeller_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Hanna_AusKeller_Condition()
{
	if (Npc_HasItems (other, ItKe_ThiefGuildKey_Hotel_MIS) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_AusKeller_Info()
{	
	if (Cassia.aivar[AIV_KilledByPlayer] == TRUE)
	|| (Jesper.aivar[AIV_KilledByPlayer] == TRUE)
	|| (Ramirez.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Hanna_Add_17_27"); //Sk¹d... wracasz?
		AI_Output (other, self, "DIA_Hanna_Add_15_28"); //Znalaz³em ciekaw¹ rzecz w twojej piwnicy...
		AI_Output (self, other, "DIA_Hanna_Add_17_29"); //Co robi³eœ w mojej piwnicy?!
		AI_Output (other, self, "DIA_Hanna_Add_15_30"); //Dobrze wiesz!
		AI_Output (self, other, "DIA_Hanna_Add_17_31"); //Nie mam pojêcia, o czym mówisz...
	}
	else 
	{
		AI_Output (self, other, "DIA_Hanna_Add_17_19"); //Spójrz tylko na siebie! Gdzie by³eœ? Hm?
		AI_Output (other, self, "DIA_Hanna_Add_15_20"); //Ja...
		AI_Output (self, other, "DIA_Hanna_Add_17_21"); //Ju¿ wiem!
		AI_Output (self, other, "DIA_Hanna_Add_17_22"); //Nie musisz nic mówiæ. Domyœli³am siê wszystkiego.
		AI_Output (self, other, "DIA_Hanna_Add_17_23"); //Nawet nie myœl o tym, ¿eby coœ st¹d ukraœæ, jasne?
		AI_Output (self, other, "DIA_Hanna_Add_17_24"); //Nie mo¿emy sobie pozwoliæ na ¿aden skandal.
	};	
	
	AI_StopProcessInfos (self);
};

// ************************************************************
//						Schuldenbuch zeigen
// ************************************************************

INSTANCE DIA_Hanna_Schuldenbuch(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_Schuldenbuch_Condition;
	information	= DIA_Hanna_Schuldenbuch_Info;
	permanent	= FALSE;
	description	= "Zobacz, jak¹ ksi¹¿kê znalaz³em!";
};                       
FUNC INT DIA_Hanna_Schuldenbuch_Condition()
{
	if (Npc_HasItems (other, ItWr_Schuldenbuch) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_Schuldenbuch_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_41"); //Zobacz, jak¹ ksi¹¿kê znalaz³em!
	AI_Output (self, other, "DIA_Hanna_Add_17_42"); //To ksiêga rachunkowa Lehmara. Sk¹d j¹ masz?
	AI_Output (other, self, "DIA_Hanna_Add_15_43"); //No...
	AI_Output (self, other, "DIA_Hanna_Add_17_44"); //To dobrze, ¿e Lehmar ju¿ jej nie ma. Jednak czu³abym siê lepiej, gdybym mog³a j¹ zatrzymaæ.
};

// ************************************************************
//						Schuldenbuch geben
// ************************************************************
instance DIA_Hanna_GiveSchuldenbuch(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_GiveSchuldenbuch_Condition;
	information	= DIA_Hanna_GiveSchuldenbuch_Info;
	permanent	= FALSE;
	description = "Proszê - weŸ tê ksiêgê.";
};                       
FUNC INT DIA_Hanna_GiveSchuldenbuch_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Schuldenbuch))
	&& (Npc_HasItems (other, ItWr_Schuldenbuch) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_GiveSchuldenbuch_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_45"); //Proszê - weŸ tê ksiêgê.
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (self, other, "DIA_Hanna_Add_17_46"); //Dziêkujê.
	AI_Output (self, other, "DIA_Hanna_Add_17_47"); //Przyjmij to w nagrodê.
	B_GiveInvItems (self, other, ItSe_HannasBeutel, 1);
	B_GivePlayerXP (XP_Schuldenbuch);
	AI_Output (other, self, "DIA_Hanna_Add_15_49"); //Co to jest?
	AI_Output (self, other, "DIA_Hanna_Add_17_48"); //To klucz do bram bogactwa.
};


// ************************************************************
// 			  				
// ************************************************************
func void Hanna_Blubb()
{
	AI_Output (other, self, "DIA_Hanna_Add_15_37"); //Wszystko w porz¹dku w kryjówce?
	AI_Output (self, other, "DIA_Hanna_Add_17_39"); //Nie by³am tam ju¿ od d³u¿szego czasu.
	AI_Output (self, other, "DIA_Hanna_Add_17_40"); //Kiedy tylko nadarzy siê okazja, zejdê na dó³ i sprawdzê, czy wszystko w porz¹dku.
	AI_Output (self, other, "DIA_Hanna_Add_17_38"); //Tak. Ale lepiej o tym tak g³oœno nie mówiæ.
	//-------------------
	AI_Output (other, self, "DIA_Hanna_Add_15_25"); //Wiedzia³aœ o z³odziejskiej kryjówce?
	AI_Output (self, other, "DIA_Hanna_Add_17_26"); //Nie mam pojêcia, o czym mówisz...
	//-------------------
	AI_Output (self, other, "DIA_Hanna_Add_17_32"); //By³a tutaj stra¿... Ktoœ powiedzia³ im o kryjówce!
	AI_Output (self, other, "DIA_Hanna_Add_17_33"); //Nie mogli mi nic udowodniæ, ale Cassia i jej ludzie nie ¿yj¹!
	AI_Output (self, other, "DIA_Hanna_Add_17_34"); //Jestem pewna, ¿e to TWOJA sprawka...
	AI_Output (self, other, "DIA_Hanna_Add_17_35"); //Kupi³am to specjalnie dla ciebie.
	AI_Output (self, other, "DIA_Hanna_Add_17_36"); //Kosztowa³o mnie to masê pieniêdzy, ale op³aca³o siê, ty œwinio...
};	

	
