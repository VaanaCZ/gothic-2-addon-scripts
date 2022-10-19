// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Buster_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_EXIT_Condition;
	information	= DIA_Buster_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Buster_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Buster_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				   Hallo 
// ************************************************************

INSTANCE DIA_Buster_Hello (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 1;
	condition	= DIA_Buster_Hello_Condition;
	information	= DIA_Buster_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE; 
};                       

FUNC INT DIA_Buster_Hello_Condition()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST) //Wegen News - Info kommt nicht mehr gut, wenn schonmal geprügelt
	&& ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Buster_Hello_13_00");	//Co my tu mamy? Czy ja ciê nie znam?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Skoro tak mówisz. Idê siê zobaczyæ z w³aœcicielem tej ziemi." 	,DIA_Buster_Hello_GoingToFarm);
	Info_AddChoice		(DIA_Buster_Hello, "A kto pyta?"									,DIA_Buster_Hello_WhoAreYou);
};

func void DIA_Buster_Hello_WhoAreYou()
{
	AI_Output (other,self ,"DIA_Buster_Hello_WhoAreYou_15_00"); //A kto pyta?
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_01"); //Jestem Buster, jeden z najemników Lee!
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_02"); //I LEPIEJ zachowuj siê grzeczniej, bo inaczej zbierzesz ciêgi!
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_03"); //Dobra, czego tu szukasz?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Nie twój interes."								,DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice		(DIA_Buster_Hello, "Znam Lee!"											,DIA_Buster_Hello_IKnowLee);
	Info_AddChoice		(DIA_Buster_Hello, "Jestem tylko podró¿nikiem w drodze do posiadacza ziemskiego." 	,DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_IKnowLee()
{
	AI_Output (other,self ,"DIA_Buster_Hello_IKnowLee_15_00"); //Znam Lee!
	AI_Output (self ,other,"DIA_Buster_Hello_IKnowLee_13_01"); //Wszyscy znaj¹ Lee. To nic nie znaczy, koleœ. Teraz rozmawiasz ze MN¥!
	AI_Output (self ,other,"DIA_Buster_Hello_IKnowLee_13_02"); //Dok¹d zmierzasz?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Nie twój interes."								,DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice		(DIA_Buster_Hello, "Jestem tylko podró¿nikiem w drodze do posiadacza ziemskiego." 	,DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_NotYourBusiness()
{
	AI_Output (other,self ,"DIA_Buster_Hello_NotYourBusiness_15_00"); //Nie twój interes.
	AI_Output (self ,other,"DIA_Buster_Hello_NotYourBusiness_13_01"); //Nikt tak do mnie nie mówi, robaku! Myœlê, ¿e czas porachowaæ ci gnaty.
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_GoingToFarm()
{
	AI_Output (other,self ,"DIA_Buster_Hello_GoingToFarm_15_00"); //Skoro tak mówisz. Idê siê zobaczyæ z w³aœcicielem tej ziemi.
	AI_Output (self ,other,"DIA_Buster_Hello_GoingToFarm_13_01"); //W rzeczy samej... Hmmm - nie wygl¹dasz na niebezpiecznego.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Chcesz siê przekonaæ?"								,DIA_Buster_Hello_WannaTestIt);
	Info_AddChoice		(DIA_Buster_Hello, "Zdarzy³o mi siê zabiæ bestiê czy dwie."	,DIA_Buster_Hello_SlewBeasts);
	Info_AddChoice		(DIA_Buster_Hello, "Tu masz racjê." 									,DIA_Buster_Hello_ImNoDanger);
};

func void DIA_Buster_Hello_ImNoDanger()
{
	AI_Output (other,self ,"DIA_Buster_Hello_ImNoDanger_15_00"); //Tu masz racjê.
	AI_Output (self ,other,"DIA_Buster_Hello_ImNoDanger_13_01"); //Taa koleœ, po latach uczysz siê wy³apywaæ takie rzeczy.
	AI_Output (self ,other,"DIA_Buster_Hello_ImNoDanger_13_02"); //Tutaj czêsto walczymy z orkami. Albo ze stra¿nikami z miasta. Strasznie uparte z nich gnojki.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Masz na myœli PRAWDZIWYCH orków? Tych wielkoludów?"						,DIA_Buster_Hello_RealOrcs);
	Info_AddChoice		(DIA_Buster_Hello, "No i?"												,DIA_Buster_Hello_SoWhat);
	Info_AddChoice		(DIA_Buster_Hello, "Imponuj¹ce." 										,DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_SlewBeasts()
{
	AI_Output (other,self ,"DIA_Buster_Hello_SlewBeasts_15_00"); //Zdarzy³o mi siê zabiæ bestiê czy dwie.
	AI_Output (self ,other,"DIA_Buster_Hello_SlewBeasts_13_01"); //Ha! Pewnie uda³o ci siê rozsmarowaæ parê ¿uków na polu i przegoniæ z nor kilka szczurów.
	AI_Output (self ,other,"DIA_Buster_Hello_SlewBeasts_13_02"); //Mamy tu do czynienia z orkami! No i jeszcze z tymi szumowinami - stra¿nikami miejskimi.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Masz na myœli PRAWDZIWYCH orków? Tych wielkoludów?"						,DIA_Buster_Hello_RealOrcs);
	Info_AddChoice		(DIA_Buster_Hello, "No i?"												,DIA_Buster_Hello_SoWhat);
	Info_AddChoice		(DIA_Buster_Hello, "Imponuj¹ce." 										,DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_WannaTestIt()
{
	AI_Output (other,self ,"DIA_Buster_Hello_WannaTestIt_15_00"); //Chcesz siê przekonaæ?
	AI_Output (self ,other,"DIA_Buster_Hello_WannaTestIt_13_01"); //Ojej! Wybra³em sobie nie tego goœcia, co?
	AI_Output (other,self ,"DIA_Buster_Hello_WannaTestIt_15_02"); //Mo¿na tak powiedzieæ.
	AI_Output (self ,other,"DIA_Buster_Hello_WannaTestIt_13_03"); //No to chodŸ, poka¿ mi, co umiesz.
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_Impressive()
{
	AI_Output (other,self ,"DIA_Buster_Hello_Impressive_15_00"); //Imponuj¹ce.
	AI_Output (self ,other,"DIA_Buster_Hello_Impressive_13_01"); //To nasza bran¿a, ma³y! Robimy nawet broñ i pancerze!
	AI_Output (self ,other,"DIA_Buster_Hello_Impressive_13_02"); //Codziennie zmagamy siê ze œmierci¹. Ale taki wiejski kmiot jak ty nie mo¿e o tym wiedzieæ.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Chyba bêdê musia³ ci pokazaæ, co o tym wiem!"	,DIA_Buster_Hello_LetMeShowYou);
	Info_AddChoice		(DIA_Buster_Hello, "Jak chcesz."									,DIA_Buster_Hello_IfYouSaySo);
};

func void DIA_Buster_Hello_IfYouSaySo()
{
	AI_Output (other,self ,"DIA_Buster_Hello_IfYouSaySo_15_00"); //Jak chcesz.
	AI_Output (self ,other,"DIA_Buster_Hello_IfYouSaySo_13_01"); //Ruszaj siê, miêczaku!

	AI_StopProcessInfos	(self);
};

func void DIA_Buster_Hello_LetMeShowYou()
{
	AI_Output (other,self ,"DIA_Buster_Hello_LetMeShowYou_15_00"); //Chyba bêdê musia³ ci pokazaæ, co o tym wiem!
	AI_Output (self ,other,"DIA_Buster_Hello_LetMeShowYou_13_01"); //Przeprowadzasz wiêc jednoosobowe powstanie ch³opskie?
	AI_Output (self ,other,"DIA_Buster_Hello_LetMeShowYou_13_02"); //Dobrze wiêc, poka¿, co masz.
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_SoWhat()
{
	AI_Output (other,self ,"DIA_Buster_Hello_SoWhat_15_00"); //Wiêc?
	AI_Output (self ,other,"DIA_Buster_Hello_SoWhat_13_01"); //Jak gdybyœ wiedzia³ o czym mówiê. Wydaje ci siê, ¿e jesteœ nadludzko silny, co?
	AI_Output (self ,other,"DIA_Buster_Hello_SoWhat_13_02"); //Mo¿e pora, ¿eby ktoœ da³ ci lekcjê!
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "W ka¿dej chwili."						,DIA_Buster_Hello_Whenever);
	Info_AddChoice		(DIA_Buster_Hello, "Tylko ¿artowa³em...."			,DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_RealOrcs()
{
	AI_Output (other,self ,"DIA_Buster_Hello_RealOrcs_15_00"); //Masz na myœli PRAWDZIWYCH orków? Tych wielkoludów?
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_01"); //Jedn¹ chwilkê! Stroisz sobie ze mnie ¿arty?
	AI_Output (other,self ,"DIA_Buster_Hello_RealOrcs_15_02"); //Ale¿ sk¹d.
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_03"); //Ty robaku! Naprawdê siê o to prosisz, co?
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_04"); //No to chodŸ i poka¿ mi, co umiesz, bohaterze.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "W ka¿dej chwili."						,DIA_Buster_Hello_Whenever);
	Info_AddChoice		(DIA_Buster_Hello, "Tylko ¿artowa³em...."			,DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_Whenever()
{
	AI_Output (other,self ,"DIA_Buster_Hello_Whenever_15_00"); //W ka¿dej chwili.
	AI_Output (self ,other,"DIA_Buster_Hello_Whenever_13_01"); //No to podejdŸ bli¿ej, koleœ!
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_JustJoking()
{
	AI_Output (other,self ,"DIA_Buster_Hello_JustJoking_15_00"); //Tylko ¿artowa³em....
	AI_Output (self ,other,"DIA_Buster_Hello_JustJoking_13_01"); //Taak, racja. Uspokój siê trochê! ZejdŸ mi z oczu.
	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				 FightNone
// ************************************************************

INSTANCE DIA_Buster_FightNone (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 1;
	condition	= DIA_Buster_FightNone_Condition;
	information	= DIA_Buster_FightNone_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Buster_FightNone_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Buster_Hello))
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Buster_FightNone_Info()
{
	AI_Output (self, other,"DIA_Buster_FightNone_13_00"); //Czego chcesz, miêczaku?
};


// ************************************************************
// 		  				 Wanna Join		
// ************************************************************

INSTANCE DIA_Buster_Duell (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 3;
	condition	= DIA_Buster_Duell_Condition;
	information	= DIA_Buster_Duell_Info;
	permanent	= TRUE;
	description = "Wyzywam ciê na pojedynek.";
};                       

FUNC INT DIA_Buster_Duell_Condition()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_Duell_Info()
{	
	AI_Output (other, self,"DIA_Buster_Duell_15_00"); //Wyzywam ciê na pojedynek.
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		AI_Output (self, other,"DIA_Buster_Duell_13_01"); //Ha! Chyba nie myœlisz, ¿e to bêdzie ³atwe, co? Dobra, chodŸ tu!
	}
	else //WON oder CANCEL
	{
		AI_Output (self, other,"DIA_Buster_Duell_13_02"); //Chcesz spróbowaæ jeszcze raz? No dobra - chodŸ tu nieznoœny gówniarzu!
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output (self, other,"DIA_Buster_Duell_13_03"); //Tylko znowu nie uciekaj!
		};
	};
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};


// ************************************************************
// 		  				 Wanna Join		
// ************************************************************
INSTANCE DIA_Buster_WannaJoin (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 2;
	condition	= DIA_Buster_WannaJoin_Condition;
	information	= DIA_Buster_WannaJoin_Info;
	permanent	= TRUE;
	description = "Chcê siê przy³¹czyæ do najemników. Masz coœ przeciwko temu?";
};                       

FUNC INT DIA_Buster_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	&& (Buster_Duell == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_WannaJoin_Info()
{	
	AI_Output (other, self,"DIA_Buster_WannaJoin_15_00"); //Chcê do³¹czyæ do najemników!
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	|| (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_01"); //Ka¿dy, kto potrafi przywaliæ tak mocno jak ty, nie powinien mieæ tutaj wiêkszych k³opotów.
		}
		else //FIGHT_WON
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_02"); //Nie jesteœ mo¿e najlepszym z wojowników, ale trudno nazwaæ ciê tchórzem.
		};
		AI_Output (self, other,"DIA_Buster_WannaJoin_13_03"); //Mój g³os nie ma wielkiego znaczenia, bo jestem tu od niedawna, ale kiedy Lee mnie zapyta, bêdê g³osowaæ na ciebie.
		Buster_Duell = TRUE;
		Log_CreateTopic (TOPIC_SLDRespekt,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_SLDRespekt,LOG_RUNNING);
		B_LogEntry (TOPIC_SLDRespekt,"Od kiedy pokona³em Bustera, nie ma nic przeciwko mojemu przy³¹czeniu siê do najemników.");
	}
	else //FIGHT_NONE oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Buster_WannaJoin_13_04"); //Ty? Nie przypominam sobie, ¿eby kiedykolwiek przyjêli do najemników jakiegoœ tchórza...
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_05"); //Ucieczka z pojedynku - w taki sposób daleko tu nie zajdziesz!
		};
	};
};

// ************************************************************
// 		  				 Mehr über Söldner		
// ************************************************************
var int Buster_SentenzaTip;

INSTANCE DIA_Buster_OtherSld (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 1;
	condition	= DIA_Buster_OtherSld_Condition;
	information	= DIA_Buster_OtherSld_Info;
	permanent	= FALSE;
	description = "Chcê siê dowiedzieæ czegoœ wiêcej o najemnikach i okolicznych terenach.";
};                       

FUNC INT DIA_Buster_OtherSld_Condition()
{
	if ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
		{
				return TRUE;	
		};
};
 
FUNC VOID DIA_Buster_OtherSld_Info()
{	
	AI_Output (other, self,"DIA_Buster_OtherSld_15_00"); //Chcê siê dowiedzieæ czegoœ wiêcej o najemnikach i okolicznych terenach.
	AI_Output (self, other,"DIA_Buster_OtherSld_13_01"); //Niewiele mogê ci powiedzieæ o tej okolicy. Lepiej popytaj wieœniaków.
	AI_Output (self, other,"DIA_Buster_OtherSld_13_02"); //A jeœli chodzi o nas, najemników - mamy bardzo prost¹ zasadê: je¿eli potrafisz dotrzymaæ pola, jesteœ z nami.
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other,"DIA_Buster_OtherSld_13_03"); //Wydaje mi siê, ¿e nadajesz siê na jednego z nas.
		AI_Output (self, other,"DIA_Buster_OtherSld_13_04"); //Nie myœl se jednak, ¿e w naszej ostatniej walce brak³o ci szczêœcia.
		AI_Output (self, other,"DIA_Buster_OtherSld_13_05"); //Na farmie jest mnóstwo ch³opaków, którzy s¹ lepsi ode mnie...
		AI_Output (self, other,"DIA_Buster_OtherSld_13_06"); //Na przyk³ad Sentenza. Pilnuje wejœcia na farmê. Nie zaczynaj z nim walki.
		Buster_SentenzaTip = TRUE;
	}
	else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		//NICHTS (s.o.)
	}
	else  //FIGHT_NONE oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Buster_OtherSld_13_07"); //Ale po co mówiê to TOBIE, miêczaku!
		AI_StopProcessInfos (self);		
	};
};

// ************************************************************
// 		  				About Sentenza		
// ************************************************************
var int Buster_GoldZumBrennen;
var int Buster_Bonus;

INSTANCE DIA_Buster_AboutSentenza (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 1;
	condition	= DIA_Buster_AboutSentenza_Condition;
	information	= DIA_Buster_AboutSentenza_Info;
	permanent	= FALSE;
	description = "A co z tym Sentenz¹?";
};                       

FUNC INT DIA_Buster_AboutSentenza_Condition()
{
	if (Buster_SentenzaTip == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_AboutSentenza_Info()
{	
	AI_Output (other, self,"DIA_Buster_AboutSentenza_15_00"); //A co z tym Sentenz¹?
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_01"); //Kiedy przyjdziesz na farmê, bêdzie chcia³ wyci¹gn¹æ od ciebie trochê z³ota - robi tak z wszystkimi nowymi.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_02"); //Na twoim miejscu bym zap³aci³. Ja tak zrobi³em, a potem on na mnie g³osowa³.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_03"); //Powiedzia³, ¿e przys³uga za przys³ugê. Straci³em ca³e moje z³oto, ale nie by³o tego za wiele. A ostatecznie by³em z tego zadowolony.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_04"); //Widzia³em kiedyœ, jak pobi³ kolesia, który postanowi³ mu NIE p³aciæ.
	AI_Output (other, self,"DIA_Buster_AboutSentenza_15_05"); //Dziêki za wskazówkê.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_06"); //W rzeczy samej. Ma dla ciebie jak¹œ wartoœæ?

	Info_ClearChoices (DIA_Buster_AboutSentenza);
	Info_AddChoice (DIA_Buster_AboutSentenza, "Nie.", DIA_Buster_AboutSentenza_No);
	Info_AddChoice (DIA_Buster_AboutSentenza, "Proszê – 5 sztuk z³ota.", DIA_Buster_AboutSentenza_Give);
};

func void DIA_Buster_AboutSentenza_Give()
{
	AI_Output (other, self,"DIA_Buster_AboutSentenza_Give_15_00"); //Trzymaj - 5 sztuk z³ota.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_Give_13_01"); //Dziêki. Koniec koñców wygl¹da na to, ¿e jednak mogê dzisiaj wieczorem coœ ³ykn¹æ. Nie zapomnê ci tego.
	Buster_GoldZumBrennen = TRUE;
	Buster_Bonus = 50;
	Info_ClearChoices (DIA_Buster_AboutSentenza);
};

func void DIA_Buster_AboutSentenza_No()
{
	AI_Output (other, self,"DIA_Buster_AboutSentenza_No_15_00"); //Nie.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_No_13_01"); //Tak w³aœnie myœla³em.
	Info_ClearChoices (DIA_Buster_AboutSentenza);
};

// ************************************************************
// 		  				 LeeLeader		
// ************************************************************

INSTANCE DIA_Buster_LeeLeader (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 2;
	condition	= DIA_Buster_LeeLeader_Condition;
	information	= DIA_Buster_LeeLeader_Info;
	permanent	= FALSE;
	description = "Lee jest dowódc¹ najemników, tak?";
};                       

FUNC INT DIA_Buster_LeeLeader_Condition()
{
	if (Buster_Duell == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_LeeLeader_Info()
{	
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_00"); //Lee jest dowódc¹ najemników, tak?
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_01"); //Dobra - hej, przypominam sobie, sk¹d ciê znam! Te¿ by³eœ w Kolonii.
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_02"); //Tak, by³em.
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_03"); //Nie widzia³em ciê, gdy to siê wszystko sta³o. Przedtem zreszt¹ te¿.
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_04"); //Mia³em inne k³opoty.
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_05"); //Sporo ciê ominê³o - od czasu jak siedzieliœmy razem w Kolonii.
};


// ************************************************************
// 		  				 WhatHappened		
// ************************************************************

INSTANCE DIA_Buster_WhatHappened (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 2;
	condition	= DIA_Buster_WhatHappened_Condition;
	information	= DIA_Buster_WhatHappened_Info;
	permanent	= FALSE;
	description = "Co siê sta³o z najemnikami z Kolonii?";
};                       

FUNC INT DIA_Buster_WhatHappened_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Buster_LeeLeader))
	&& ((hero.guild != GIL_SLD)&& (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_WhatHappened_Info()
{	
	AI_Output (other, self,"DIA_Buster_WhatHappened_15_00"); //Co siê sta³o z najemnikami z Kolonii?
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_01"); //Kiedy Bariera pad³a, Lee wyprowadzi³ nas z Kolonii. Powiedzia³, ¿e jeœli bêdziemy siê trzymaæ razem, nic nam siê nie stanie. Mia³ racjê.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_02"); //Krótko potem znaleŸliœmy sobie tutaj przytulne miejsce. W³aœciciel tej ziemi p³aci nam za pranie ch³opaków ze stra¿y miejskiej.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_03"); //A wiêkszoœæ z nas i tak robi³aby to za darmo.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_04"); //Onar karmi nas wszystkich i mo¿emy czekaæ na dobr¹ okazjê, ¿eby wyjechaæ z tej przeklêtej wyspy.
};


//**************************************
//			TrainingGold
//************************************** 
INSTANCE DIA_Buster_Teach (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 8;
	condition	= DIA_Buster_Teach_Condition;
	information	= DIA_Buster_Teach_Info;
	permanent	= TRUE;
	description = "Mo¿esz mnie nauczyæ lepiej walczyæ?";
};                       

FUNC INT DIA_Buster_Teach_Condition()
{	
	if (Npc_GetTalentSkill (other, NPC_TALENT_1H) <= 60) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_Teach_Info()
{	
	AI_Output (other, self, "DIA_Buster_Teach_15_00"); //Mo¿esz mnie nauczyæ lepiej walczyæ?
	if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Buster_Teach_13_01"); //Mo¿e bêdê móg³ daæ ci wskazówkê czy dwie...
	}
	else 
	{
		AI_Output (self, other, "DIA_Buster_Teach_13_02"); //Nie jesteœ tak têpy na jakiego wygl¹dasz. Dobrze, powiem ci, co wiem. Wtedy mo¿e bêdziesz mia³ ze mn¹ jakieœ szanse...
	};
	
	if (BusterLOG == FALSE)
	{
		Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry (Topic_SoldierTeacher,"Buster mo¿e mnie nauczyæ walki orê¿em jednorêcznym.");
		BusterLOG = TRUE;
	};
	Info_ClearChoices 	(DIA_Buster_Teach);
	Info_AddChoice 		(DIA_Buster_Teach,DIALOG_BACK,DIA_Buster_Teach_Back);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Buster_Teach_1H_1);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Buster_Teach_1H_5);
};

FUNC VOID DIA_Buster_Teach_Back ()
{
	Info_ClearChoices (DIA_Buster_Teach);
};

FUNC VOID DIA_Buster_Teach_1H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 60);
	
	Info_ClearChoices 	(DIA_Buster_Teach);
	Info_AddChoice 		(DIA_Buster_Teach,DIALOG_BACK,DIA_Buster_Teach_Back);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Buster_Teach_1H_1);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Buster_Teach_1H_5);
};

FUNC VOID DIA_Buster_Teach_1H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 60);
	
	Info_ClearChoices 	(DIA_Buster_Teach);
	Info_AddChoice 		(DIA_Buster_Teach,DIALOG_BACK,DIA_Buster_Teach_Back);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Buster_Teach_1H_1);
	Info_AddChoice		(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Buster_Teach_1H_5);
};

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Buster_KAP3_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_KAP3_EXIT_Condition;
	information	= DIA_Buster_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Buster_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Shadowbeasts
///////////////////////////////////////////////////////////////////////
instance DIA_Buster_SHADOWBEASTS		(C_INFO)
{
	npc		 	= Sld_802_Buster;
	nr		 	= 30;
	condition	= DIA_Buster_SHADOWBEASTS_Condition;
	information	= DIA_Buster_SHADOWBEASTS_Info;
	permanent	= FALSE;
	important	= TRUE;
};

func int DIA_Buster_SHADOWBEASTS_Condition ()
{
	if ((Kapitel == 3) || (Kapitel == 4))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
				return TRUE;
		};
};

func void B_DIA_Buster_SHADOWBEASTS_OK ()
{
	AI_StopProcessInfos (self);
};

func void DIA_Buster_SHADOWBEASTS_Info ()
{
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_00"); //Hej ty, koleœ!
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_15_01"); //Czego chcesz?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_02"); //Przez ostatnie kilka dni myœla³em, jak moglibyœmy szybko zarobiæ w tej norze trochê kasy.
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_15_03"); //No i?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_04"); //Wydaje mi siê, ¿e wpad³em na pomys³, jak siê szybko wzbogaciæ.
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_05"); //Jest taki kupiec w mieœcie, który zap³aci kupê kasy za pewn¹ rzecz.

	Info_ClearChoices	(DIA_Buster_SHADOWBEASTS);
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Kim jest ten kupiec, o którym mówisz?", DIA_Buster_SHADOWBEASTS_wer );
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "O co chodzi?", DIA_Buster_SHADOWBEASTS_was );
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Dlaczego mi to mówisz?", DIA_Buster_SHADOWBEASTS_ich );

};
func void DIA_Buster_SHADOWBEASTS_ich ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_ich_15_00"); //Dlaczego mi to mówisz?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_ich_13_01"); //Sam nie mogê tego zrobiæ. Muszê tu siedzieæ i pilnowaæ tych g³upich owiec.
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_ich_15_02"); //Chodzi ci o farmerów?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_ich_13_03"); //To w³aœnie mam na myœli.

};
func void DIA_Buster_SHADOWBEASTS_was ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_15_00"); //O co chodzi?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_13_01"); //Ów kupiec twierdzi, ¿e potrafi z du¿ym zyskiem sprzedaæ rogi cieniostworów.
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_13_02"); //Ktoœ musia³by udaæ siê do lasu i zapolowaæ na te bestie. To w³aœnie twoje zadanie.

	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Ile mo¿na na tym zarobiæ?", DIA_Buster_SHADOWBEASTS_was_wieviel );
};
func void DIA_Buster_SHADOWBEASTS_was_wieviel ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_wieviel_15_00"); //Ile mo¿na na tym zarobiæ?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_wieviel_13_01"); //Kupa kasy, powiadam ci. Wystarczy dla nas dwóch.
	if (Buster_GoldZumBrennen == TRUE)
	{
		AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_wieviel_13_02"); //A skoro odda³eœ mi wtedy ca³e z³oto, za³atwiê ci specjaln¹ cenê.
	};
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_wieviel_15_03"); //Brzmi nieŸle! Dam ci znaæ, jak tylko zdo³am zebraæ trochê rogów.
	MIS_Buster_KillShadowbeasts_DJG = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Buster_KillShadowbeasts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Buster_KillShadowbeasts, LOG_RUNNING);
	B_LogEntry (TOPIC_Buster_KillShadowbeasts,"Buster zap³aci mi za ka¿dy róg cieniostwora, który mu przyniosê."); 

	Info_ClearChoices	(DIA_Buster_SHADOWBEASTS);
};
func void DIA_Buster_SHADOWBEASTS_wer ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_wer_15_00"); //Kim jest ten kupiec, o którym mówisz?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_wer_13_01"); //Nie mogê, ch³opie. Musia³bym byæ naprawdê g³upi, ¿eby powiedzieæ ci o moim Ÿródle. Chcesz mnie wykiwaæ?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_wer_13_02"); //Zrobisz interes ze MN¥ albo w ogóle, capisce?

};

///////////////////////////////////////////////////////////////////////
//	Info BringTrophyShadowbeast
///////////////////////////////////////////////////////////////////////
instance DIA_Buster_BringTrophyShadowbeast		(C_INFO)
{
	npc		 = 	Sld_802_Buster;
	nr		 = 	2;
	condition	 = 	DIA_Buster_BringTrophyShadowbeast_Condition;
	information	 = 	DIA_Buster_BringTrophyShadowbeast_Info;
	permanent	 = 	TRUE;

	description	 = 	"Co do tych rogów cieniostworów...";
};

func int DIA_Buster_BringTrophyShadowbeast_Condition ()
{
	if (MIS_Buster_KillShadowbeasts_DJG == LOG_RUNNING)
	&& ((Npc_HasItems (other,ItAt_ShadowHorn))||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
				return TRUE;
		};
};

var int BusterTrophyShadowbeastCounter;

func void DIA_Buster_BringTrophyShadowbeast_Info ()
{
	if ((Kapitel >= 5))
	{
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_00"); //Mój kupiec wyjecha³ z miasta.
		AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_15_01"); //Co to ma znaczyæ?
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_02"); //Nie ¿yje. Mo¿esz zatrzymaæ rogi. Nie wiem, co z nimi teraz zrobiæ.
		MIS_Buster_KillShadowbeasts_DJG = LOG_SUCCESS; //Joly: Feierabend ab Kapitel 5!!!!!!!
		B_GivePlayerXP (XP_Ambient);
	}
	else if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
	{
		AI_Output			(other, self, "DIA_Buster_ANIMALTROPHYSHADOWBEAST_15_03"); //Jak wypatroszyæ cieniostwora?
		AI_Output			(self, other, "DIA_Buster_ANIMALTROPHYSHADOWBEAST_13_04"); //Nie wiesz? Oj ch³opie, spodziewa³em siê po tobie wiêcej.
	
		Info_ClearChoices	(DIA_Buster_BringTrophyShadowbeast);
		Info_AddChoice	(DIA_Buster_BringTrophyShadowbeast, "Jeszcze do tego wrócimy.", DIA_Buster_BringTrophyShadowbeast_back );
		Info_AddChoice	(DIA_Buster_BringTrophyShadowbeast, B_BuildLearnString ("Naucz mnie.",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ShadowHorn)),  DIA_Buster_BringTrophyShadowbeast_teach );
	}
	else 
	{
		var int BusterTrophyShadowbeastCount;
		var int XP_BringBusterTrophyShadowbeast;
		var int XP_BringBusterTrophyShadowbeasts;
		var int BustersBusterTrophyShadowbeastOffer;
		var int BusterTrophyShadowbeastGeld;
	
		BusterTrophyShadowbeastCount = Npc_HasItems(other, ItAt_ShadowHorn);
		XP_BringBusterTrophyShadowbeast = 	(Shadowbeast.level * XP_PER_VICTORY);			
		BustersBusterTrophyShadowbeastOffer = Value_ShadowHorn + Buster_Bonus; //Joly: Wert ohne Handelmultiplier!!!!!!!!!!!!!
		
	
		if (BusterTrophyShadowbeastCount == 1)
			{
				AI_Output		(other, self, "DIA_Buster_BringTrophyShadowbeast_15_05"); //Mam dla ciebie róg cieniostwora.
				B_GivePlayerXP (XP_BringBusterTrophyShadowbeast);
				B_GiveInvItems (other, self, ItAt_ShadowHorn,1);
				BusterTrophyShadowbeastCounter = BusterTrophyShadowbeastCounter + 1;
			}
			else
			{
				AI_Output		(other, self, "DIA_Buster_BringTrophyShadowbeast_15_06"); //Mam wiêcej rogów cieniostworów dla twojego kupca.
	
				B_GiveInvItems (other, self, ItAt_ShadowHorn,  BusterTrophyShadowbeastCount);
	
				XP_BringBusterTrophyShadowbeasts = (BusterTrophyShadowbeastCount * XP_BringBusterTrophyShadowbeast);
				BusterTrophyShadowbeastCounter = (BusterTrophyShadowbeastCounter + BusterTrophyShadowbeastCount); 
	
				B_GivePlayerXP (XP_BringBusterTrophyShadowbeasts);
			};
	
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_07"); //Œwietnie. Daj je tutaj. I przynieœ wiêcej. Kto wie, jak d³ugo jeszcze ten kupiec bêdzie chcia³ te rzeczy.
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_08"); //Oto twoja dzia³ka.
	
		BusterTrophyShadowbeastGeld	= (BusterTrophyShadowbeastCount * BustersBusterTrophyShadowbeastOffer);
	
		CreateInvItems (self, ItMi_Gold, BusterTrophyShadowbeastGeld); 
		B_GiveInvItems (self, other, ItMi_Gold, BusterTrophyShadowbeastGeld);
	};

};
func void DIA_Buster_BringTrophyShadowbeast_teach ()
{
	AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_teach_15_00"); //Naucz mnie.

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ShadowHorn))
		{
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_01"); //No to s³uchaj. Zabijasz cieniostwora, a potem ³apiesz praw¹ rêk¹ za róg, najmocniej jak potrafisz.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_02"); //Potem wbijasz nó¿ w jego czo³o i wycinasz bruzdê w ciele dooko³a rogu.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_03"); //Potem u¿ywasz no¿a jak dŸwigni, ¿eby wyrwaæ róg z czaszki i ju¿ jest twój.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_04"); //No, a potem musisz go przynieœæ do mnie. Nie powinieneœ mieæ z tym problemów.
		};		
	Info_ClearChoices	(DIA_Buster_BringTrophyShadowbeast);
};

func void DIA_Buster_BringTrophyShadowbeast_back ()
{
		AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_back_15_00"); //Jeszcze do tego wrócimy.
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_back_13_01"); //Mam nadziejê.
		Info_ClearChoices	(DIA_Buster_BringTrophyShadowbeast);
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Buster_KAP4_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_KAP4_EXIT_Condition;
	information	= DIA_Buster_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Buster_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 		  				 	PERM Kapitel 4	
// ************************************************************

INSTANCE DIA_Buster_Perm4 (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 2;
	condition	= DIA_Buster_Perm4_Condition;
	information	= DIA_Buster_Perm4_Info;
	permanent	= TRUE;
	description = "Co myœlisz o tym ca³ym polowaniu na smoki?";
};                       

FUNC INT DIA_Buster_Perm4_Condition()
{
	if (Kapitel >= 4) 
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_Perm4_Info()
{	
	AI_Output (other, self,"DIA_Buster_Perm4_15_00"); //Co myœlisz o tym ca³ym polowaniu na smoki?
	AI_Output (self, other,"DIA_Buster_Perm4_13_01"); //Ch³opaki mog¹ z tego wyjœæ objuczeni z³otem - jeœli nie odwal¹ wczeœniej kity.
	AI_Output (self, other,"DIA_Buster_Perm4_13_02"); //Ja tam wolê siê trzymaæ z Lee.
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Buster_KAP5_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_KAP5_EXIT_Condition;
	information	= DIA_Buster_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Buster_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Buster_KAP6_EXIT(C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 999;
	condition	= DIA_Buster_KAP6_EXIT_Condition;
	information	= DIA_Buster_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Buster_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Buster_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Buster_PICKPOCKET (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 900;
	condition	= DIA_Buster_PICKPOCKET_Condition;
	information	= DIA_Buster_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Buster_PICKPOCKET_Condition()
{
	C_Beklauen (34, 60);
};
 
FUNC VOID DIA_Buster_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Buster_PICKPOCKET);
	Info_AddChoice		(DIA_Buster_PICKPOCKET, DIALOG_BACK 		,DIA_Buster_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Buster_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Buster_PICKPOCKET_DoIt);
};

func void DIA_Buster_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Buster_PICKPOCKET);
};
	
func void DIA_Buster_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Buster_PICKPOCKET);
};








































