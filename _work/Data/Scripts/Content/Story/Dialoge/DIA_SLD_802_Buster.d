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
	AI_Output (self ,other,"DIA_Buster_Hello_13_00");	//Co my tu mamy? Czy ja cię nie znam?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Skoro tak mówisz. Idę się zobaczyć z właścicielem tej ziemi." 	,DIA_Buster_Hello_GoingToFarm);
	Info_AddChoice		(DIA_Buster_Hello, "A kto pyta?"									,DIA_Buster_Hello_WhoAreYou);
};

func void DIA_Buster_Hello_WhoAreYou()
{
	AI_Output (other,self ,"DIA_Buster_Hello_WhoAreYou_15_00"); //A kto pyta?
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_01"); //Jestem Buster, jeden z najemników Lee!
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_02"); //I LEPIEJ zachowuj się grzeczniej, bo inaczej zbierzesz cięgi!
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_03"); //Dobra, czego tu szukasz?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Nie twój interes."								,DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice		(DIA_Buster_Hello, "Znam Lee!"											,DIA_Buster_Hello_IKnowLee);
	Info_AddChoice		(DIA_Buster_Hello, "Jestem tylko podróżnikiem w drodze do posiadacza ziemskiego." 	,DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_IKnowLee()
{
	AI_Output (other,self ,"DIA_Buster_Hello_IKnowLee_15_00"); //Znam Lee!
	AI_Output (self ,other,"DIA_Buster_Hello_IKnowLee_13_01"); //Wszyscy znają Lee. To nic nie znaczy, koleś. Teraz rozmawiasz ze MNĄ!
	AI_Output (self ,other,"DIA_Buster_Hello_IKnowLee_13_02"); //Dokąd zmierzasz?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Nie twój interes."								,DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice		(DIA_Buster_Hello, "Jestem tylko podróżnikiem w drodze do posiadacza ziemskiego." 	,DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_NotYourBusiness()
{
	AI_Output (other,self ,"DIA_Buster_Hello_NotYourBusiness_15_00"); //Nie twój interes.
	AI_Output (self ,other,"DIA_Buster_Hello_NotYourBusiness_13_01"); //Nikt tak do mnie nie mówi, robaku! Myślę, że czas porachować ci gnaty.
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_GoingToFarm()
{
	AI_Output (other,self ,"DIA_Buster_Hello_GoingToFarm_15_00"); //Skoro tak mówisz. Idę się zobaczyć z właścicielem tej ziemi.
	AI_Output (self ,other,"DIA_Buster_Hello_GoingToFarm_13_01"); //W rzeczy samej... Hmmm - nie wyglądasz na niebezpiecznego.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Chcesz się przekonać?"								,DIA_Buster_Hello_WannaTestIt);
	Info_AddChoice		(DIA_Buster_Hello, "Zdarzyło mi się zabić bestię czy dwie."	,DIA_Buster_Hello_SlewBeasts);
	Info_AddChoice		(DIA_Buster_Hello, "Tu masz rację." 									,DIA_Buster_Hello_ImNoDanger);
};

func void DIA_Buster_Hello_ImNoDanger()
{
	AI_Output (other,self ,"DIA_Buster_Hello_ImNoDanger_15_00"); //Tu masz rację.
	AI_Output (self ,other,"DIA_Buster_Hello_ImNoDanger_13_01"); //Taa koleś, po latach uczysz się wyłapywać takie rzeczy.
	AI_Output (self ,other,"DIA_Buster_Hello_ImNoDanger_13_02"); //Tutaj często walczymy z orkami. Albo ze strażnikami z miasta. Strasznie uparte z nich gnojki.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Masz na myśli PRAWDZIWYCH orków? Tych wielkoludów?"						,DIA_Buster_Hello_RealOrcs);
	Info_AddChoice		(DIA_Buster_Hello, "No i?"												,DIA_Buster_Hello_SoWhat);
	Info_AddChoice		(DIA_Buster_Hello, "Imponujące." 										,DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_SlewBeasts()
{
	AI_Output (other,self ,"DIA_Buster_Hello_SlewBeasts_15_00"); //Zdarzyło mi się zabić bestię czy dwie.
	AI_Output (self ,other,"DIA_Buster_Hello_SlewBeasts_13_01"); //Ha! Pewnie udało ci się rozsmarować parę żuków na polu i przegonić z nor kilka szczurów.
	AI_Output (self ,other,"DIA_Buster_Hello_SlewBeasts_13_02"); //Mamy tu do czynienia z orkami! No i jeszcze z tymi szumowinami - strażnikami miejskimi.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Masz na myśli PRAWDZIWYCH orków? Tych wielkoludów?"						,DIA_Buster_Hello_RealOrcs);
	Info_AddChoice		(DIA_Buster_Hello, "No i?"												,DIA_Buster_Hello_SoWhat);
	Info_AddChoice		(DIA_Buster_Hello, "Imponujące." 										,DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_WannaTestIt()
{
	AI_Output (other,self ,"DIA_Buster_Hello_WannaTestIt_15_00"); //Chcesz się przekonać?
	AI_Output (self ,other,"DIA_Buster_Hello_WannaTestIt_13_01"); //Ojej! Wybrałem sobie nie tego gościa, co?
	AI_Output (other,self ,"DIA_Buster_Hello_WannaTestIt_15_02"); //Można tak powiedzieć.
	AI_Output (self ,other,"DIA_Buster_Hello_WannaTestIt_13_03"); //No to chodź, pokaż mi, co umiesz.
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_Impressive()
{
	AI_Output (other,self ,"DIA_Buster_Hello_Impressive_15_00"); //Imponujące.
	AI_Output (self ,other,"DIA_Buster_Hello_Impressive_13_01"); //To nasza branża, mały! Robimy nawet broń i pancerze!
	AI_Output (self ,other,"DIA_Buster_Hello_Impressive_13_02"); //Codziennie zmagamy się ze śmiercią. Ale taki wiejski kmiot jak ty nie może o tym wiedzieć.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Chyba będę musiał ci pokazać, co o tym wiem!"	,DIA_Buster_Hello_LetMeShowYou);
	Info_AddChoice		(DIA_Buster_Hello, "Jak chcesz."									,DIA_Buster_Hello_IfYouSaySo);
};

func void DIA_Buster_Hello_IfYouSaySo()
{
	AI_Output (other,self ,"DIA_Buster_Hello_IfYouSaySo_15_00"); //Jak chcesz.
	AI_Output (self ,other,"DIA_Buster_Hello_IfYouSaySo_13_01"); //Ruszaj się, mięczaku!

	AI_StopProcessInfos	(self);
};

func void DIA_Buster_Hello_LetMeShowYou()
{
	AI_Output (other,self ,"DIA_Buster_Hello_LetMeShowYou_15_00"); //Chyba będę musiał ci pokazać, co o tym wiem!
	AI_Output (self ,other,"DIA_Buster_Hello_LetMeShowYou_13_01"); //Przeprowadzasz więc jednoosobowe powstanie chłopskie?
	AI_Output (self ,other,"DIA_Buster_Hello_LetMeShowYou_13_02"); //Dobrze więc, pokaż, co masz.
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_SoWhat()
{
	AI_Output (other,self ,"DIA_Buster_Hello_SoWhat_15_00"); //Więc?
	AI_Output (self ,other,"DIA_Buster_Hello_SoWhat_13_01"); //Jak gdybyś wiedział o czym mówię. Wydaje ci się, że jesteś nadludzko silny, co?
	AI_Output (self ,other,"DIA_Buster_Hello_SoWhat_13_02"); //Może pora, żeby ktoś dał ci lekcję!
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "W każdej chwili."						,DIA_Buster_Hello_Whenever);
	Info_AddChoice		(DIA_Buster_Hello, "Tylko żartowałem...."			,DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_RealOrcs()
{
	AI_Output (other,self ,"DIA_Buster_Hello_RealOrcs_15_00"); //Masz na myśli PRAWDZIWYCH orków? Tych wielkoludów?
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_01"); //Jedną chwilkę! Stroisz sobie ze mnie żarty?
	AI_Output (other,self ,"DIA_Buster_Hello_RealOrcs_15_02"); //Ależ skąd.
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_03"); //Ty robaku! Naprawdę się o to prosisz, co?
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_04"); //No to chodź i pokaż mi, co umiesz, bohaterze.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "W każdej chwili."						,DIA_Buster_Hello_Whenever);
	Info_AddChoice		(DIA_Buster_Hello, "Tylko żartowałem...."			,DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_Whenever()
{
	AI_Output (other,self ,"DIA_Buster_Hello_Whenever_15_00"); //W każdej chwili.
	AI_Output (self ,other,"DIA_Buster_Hello_Whenever_13_01"); //No to podejdź bliżej, koleś!
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_JustJoking()
{
	AI_Output (other,self ,"DIA_Buster_Hello_JustJoking_15_00"); //Tylko żartowałem....
	AI_Output (self ,other,"DIA_Buster_Hello_JustJoking_13_01"); //Taak, racja. Uspokój się trochę! Zejdź mi z oczu.
	
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
	AI_Output (self, other,"DIA_Buster_FightNone_13_00"); //Czego chcesz, mięczaku?
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
	description = "Wyzywam cię na pojedynek.";
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
	AI_Output (other, self,"DIA_Buster_Duell_15_00"); //Wyzywam cię na pojedynek.
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		AI_Output (self, other,"DIA_Buster_Duell_13_01"); //Ha! Chyba nie myślisz, że to będzie łatwe, co? Dobra, chodź tu!
	}
	else //WON oder CANCEL
	{
		AI_Output (self, other,"DIA_Buster_Duell_13_02"); //Chcesz spróbować jeszcze raz? No dobra - chodź tu nieznośny gówniarzu!
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
	description = "Chcę się przyłączyć do najemników. Masz coś przeciwko temu?";
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
	AI_Output (other, self,"DIA_Buster_WannaJoin_15_00"); //Chcę dołączyć do najemników!
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	|| (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_01"); //Każdy, kto potrafi przywalić tak mocno jak ty, nie powinien mieć tutaj większych kłopotów.
		}
		else //FIGHT_WON
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_02"); //Nie jesteś może najlepszym z wojowników, ale trudno nazwać cię tchórzem.
		};
		AI_Output (self, other,"DIA_Buster_WannaJoin_13_03"); //Mój głos nie ma wielkiego znaczenia, bo jestem tu od niedawna, ale kiedy Lee mnie zapyta, będę głosować na ciebie.
		Buster_Duell = TRUE;
		Log_CreateTopic (TOPIC_SLDRespekt,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_SLDRespekt,LOG_RUNNING);
		B_LogEntry (TOPIC_SLDRespekt,"Od kiedy pokonałem Bustera, nie ma nic przeciwko mojemu przyłączeniu się do najemników.");
	}
	else //FIGHT_NONE oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Buster_WannaJoin_13_04"); //Ty? Nie przypominam sobie, żeby kiedykolwiek przyjęli do najemników jakiegoś tchórza...
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
	description = "Chcę się dowiedzieć czegoś więcej o najemnikach i okolicznych terenach.";
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
	AI_Output (other, self,"DIA_Buster_OtherSld_15_00"); //Chcę się dowiedzieć czegoś więcej o najemnikach i okolicznych terenach.
	AI_Output (self, other,"DIA_Buster_OtherSld_13_01"); //Niewiele mogę ci powiedzieć o tej okolicy. Lepiej popytaj wieśniaków.
	AI_Output (self, other,"DIA_Buster_OtherSld_13_02"); //A jeśli chodzi o nas, najemników - mamy bardzo prostą zasadę: jeżeli potrafisz dotrzymać pola, jesteś z nami.
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other,"DIA_Buster_OtherSld_13_03"); //Wydaje mi się, że nadajesz się na jednego z nas.
		AI_Output (self, other,"DIA_Buster_OtherSld_13_04"); //Nie myśl se jednak, że w naszej ostatniej walce brakło ci szczęścia.
		AI_Output (self, other,"DIA_Buster_OtherSld_13_05"); //Na farmie jest mnóstwo chłopaków, którzy są lepsi ode mnie...
		AI_Output (self, other,"DIA_Buster_OtherSld_13_06"); //Na przykład Sentenza. Pilnuje wejścia na farmę. Nie zaczynaj z nim walki.
		Buster_SentenzaTip = TRUE;
	}
	else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		//NICHTS (s.o.)
	}
	else  //FIGHT_NONE oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Buster_OtherSld_13_07"); //Ale po co mówię to TOBIE, mięczaku!
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
	description = "A co z tym Sentenzą?";
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
	AI_Output (other, self,"DIA_Buster_AboutSentenza_15_00"); //A co z tym Sentenzą?
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_01"); //Kiedy przyjdziesz na farmę, będzie chciał wyciągnąć od ciebie trochę złota - robi tak z wszystkimi nowymi.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_02"); //Na twoim miejscu bym zapłacił. Ja tak zrobiłem, a potem on na mnie głosował.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_03"); //Powiedział, że przysługa za przysługę. Straciłem całe moje złoto, ale nie było tego za wiele. A ostatecznie byłem z tego zadowolony.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_04"); //Widziałem kiedyś, jak pobił kolesia, który postanowił mu NIE płacić.
	AI_Output (other, self,"DIA_Buster_AboutSentenza_15_05"); //Dzięki za wskazówkę.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_06"); //W rzeczy samej. Ma dla ciebie jakąś wartość?

	Info_ClearChoices (DIA_Buster_AboutSentenza);
	Info_AddChoice (DIA_Buster_AboutSentenza, "Nie.", DIA_Buster_AboutSentenza_No);
	Info_AddChoice (DIA_Buster_AboutSentenza, "Proszę – 5 sztuk złota.", DIA_Buster_AboutSentenza_Give);
};

func void DIA_Buster_AboutSentenza_Give()
{
	AI_Output (other, self,"DIA_Buster_AboutSentenza_Give_15_00"); //Trzymaj - 5 sztuk złota.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_Give_13_01"); //Dzięki. Koniec końców wygląda na to, że jednak mogę dzisiaj wieczorem coś łyknąć. Nie zapomnę ci tego.
	Buster_GoldZumBrennen = TRUE;
	Buster_Bonus = 50;
	Info_ClearChoices (DIA_Buster_AboutSentenza);
};

func void DIA_Buster_AboutSentenza_No()
{
	AI_Output (other, self,"DIA_Buster_AboutSentenza_No_15_00"); //Nie.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_No_13_01"); //Tak właśnie myślałem.
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
	description = "Lee jest dowódcą najemników, tak?";
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
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_00"); //Lee jest dowódcą najemników, tak?
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_01"); //Dobra - hej, przypominam sobie, skąd cię znam! Też byłeś w Kolonii.
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_02"); //Tak, byłem.
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_03"); //Nie widziałem cię, gdy to się wszystko stało. Przedtem zresztą też.
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_04"); //Miałem inne kłopoty.
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_05"); //Sporo cię ominęło - od czasu jak siedzieliśmy razem w Kolonii.
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
	description = "Co się stało z najemnikami z Kolonii?";
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
	AI_Output (other, self,"DIA_Buster_WhatHappened_15_00"); //Co się stało z najemnikami z Kolonii?
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_01"); //Kiedy Bariera padła, Lee wyprowadził nas z Kolonii. Powiedział, że jeśli będziemy się trzymać razem, nic nam się nie stanie. Miał rację.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_02"); //Krótko potem znaleźliśmy sobie tutaj przytulne miejsce. Właściciel tej ziemi płaci nam za pranie chłopaków ze straży miejskiej.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_03"); //A większość z nas i tak robiłaby to za darmo.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_04"); //Onar karmi nas wszystkich i możemy czekać na dobrą okazję, żeby wyjechać z tej przeklętej wyspy.
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
	description = "Możesz mnie nauczyć lepiej walczyć?";
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
	AI_Output (other, self, "DIA_Buster_Teach_15_00"); //Możesz mnie nauczyć lepiej walczyć?
	if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Buster_Teach_13_01"); //Może będę mógł dać ci wskazówkę czy dwie...
	}
	else 
	{
		AI_Output (self, other, "DIA_Buster_Teach_13_02"); //Nie jesteś tak tępy na jakiego wyglądasz. Dobrze, powiem ci, co wiem. Wtedy może będziesz miał ze mną jakieś szanse...
	};
	
	if (BusterLOG == FALSE)
	{
		Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry (Topic_SoldierTeacher,"Buster może mnie nauczyć walki orężem jednoręcznym.");
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
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_00"); //Hej ty, koleś!
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_15_01"); //Czego chcesz?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_02"); //Przez ostatnie kilka dni myślałem, jak moglibyśmy szybko zarobić w tej norze trochę kasy.
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_15_03"); //No i?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_04"); //Wydaje mi się, że wpadłem na pomysł, jak się szybko wzbogacić.
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_05"); //Jest taki kupiec w mieście, który zapłaci kupę kasy za pewną rzecz.

	Info_ClearChoices	(DIA_Buster_SHADOWBEASTS);
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Kim jest ten kupiec, o którym mówisz?", DIA_Buster_SHADOWBEASTS_wer );
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "O co chodzi?", DIA_Buster_SHADOWBEASTS_was );
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Dlaczego mi to mówisz?", DIA_Buster_SHADOWBEASTS_ich );

};
func void DIA_Buster_SHADOWBEASTS_ich ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_ich_15_00"); //Dlaczego mi to mówisz?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_ich_13_01"); //Sam nie mogę tego zrobić. Muszę tu siedzieć i pilnować tych głupich owiec.
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_ich_15_02"); //Chodzi ci o farmerów?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_ich_13_03"); //To właśnie mam na myśli.

};
func void DIA_Buster_SHADOWBEASTS_was ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_15_00"); //O co chodzi?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_13_01"); //Ów kupiec twierdzi, że potrafi z dużym zyskiem sprzedać rogi cieniostworów.
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_13_02"); //Ktoś musiałby udać się do lasu i zapolować na te bestie. To właśnie twoje zadanie.

	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Ile można na tym zarobić?", DIA_Buster_SHADOWBEASTS_was_wieviel );
};
func void DIA_Buster_SHADOWBEASTS_was_wieviel ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_wieviel_15_00"); //Ile można na tym zarobić?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_wieviel_13_01"); //Kupa kasy, powiadam ci. Wystarczy dla nas dwóch.
	if (Buster_GoldZumBrennen == TRUE)
	{
		AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_wieviel_13_02"); //A skoro oddałeś mi wtedy całe złoto, załatwię ci specjalną cenę.
	};
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_wieviel_15_03"); //Brzmi nieźle! Dam ci znać, jak tylko zdołam zebrać trochę rogów.
	MIS_Buster_KillShadowbeasts_DJG = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Buster_KillShadowbeasts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Buster_KillShadowbeasts, LOG_RUNNING);
	B_LogEntry (TOPIC_Buster_KillShadowbeasts,"Buster zapłaci mi za każdy róg cieniostwora, który mu przyniosę."); 

	Info_ClearChoices	(DIA_Buster_SHADOWBEASTS);
};
func void DIA_Buster_SHADOWBEASTS_wer ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_wer_15_00"); //Kim jest ten kupiec, o którym mówisz?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_wer_13_01"); //Nie mogę, chłopie. Musiałbym być naprawdę głupi, żeby powiedzieć ci o moim źródle. Chcesz mnie wykiwać?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_wer_13_02"); //Zrobisz interes ze MNĄ albo w ogóle, capisce?

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
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_00"); //Mój kupiec wyjechał z miasta.
		AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_15_01"); //Co to ma znaczyć?
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_02"); //Nie żyje. Możesz zatrzymać rogi. Nie wiem, co z nimi teraz zrobić.
		MIS_Buster_KillShadowbeasts_DJG = LOG_SUCCESS; //Joly: Feierabend ab Kapitel 5!!!!!!!
		B_GivePlayerXP (XP_Ambient);
	}
	else if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
	{
		AI_Output			(other, self, "DIA_Buster_ANIMALTROPHYSHADOWBEAST_15_03"); //Jak wypatroszyć cieniostwora?
		AI_Output			(self, other, "DIA_Buster_ANIMALTROPHYSHADOWBEAST_13_04"); //Nie wiesz? Oj chłopie, spodziewałem się po tobie więcej.
	
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
				AI_Output		(other, self, "DIA_Buster_BringTrophyShadowbeast_15_06"); //Mam więcej rogów cieniostworów dla twojego kupca.
	
				B_GiveInvItems (other, self, ItAt_ShadowHorn,  BusterTrophyShadowbeastCount);
	
				XP_BringBusterTrophyShadowbeasts = (BusterTrophyShadowbeastCount * XP_BringBusterTrophyShadowbeast);
				BusterTrophyShadowbeastCounter = (BusterTrophyShadowbeastCounter + BusterTrophyShadowbeastCount); 
	
				B_GivePlayerXP (XP_BringBusterTrophyShadowbeasts);
			};
	
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_07"); //Świetnie. Daj je tutaj. I przynieś więcej. Kto wie, jak długo jeszcze ten kupiec będzie chciał te rzeczy.
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_08"); //Oto twoja działka.
	
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
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_01"); //No to słuchaj. Zabijasz cieniostwora, a potem łapiesz prawą ręką za róg, najmocniej jak potrafisz.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_02"); //Potem wbijasz nóż w jego czoło i wycinasz bruzdę w ciele dookoła rogu.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_03"); //Potem używasz noża jak dźwigni, żeby wyrwać róg z czaszki i już jest twój.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_04"); //No, a potem musisz go przynieść do mnie. Nie powinieneś mieć z tym problemów.
		};		
	Info_ClearChoices	(DIA_Buster_BringTrophyShadowbeast);
};

func void DIA_Buster_BringTrophyShadowbeast_back ()
{
		AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_back_15_00"); //Jeszcze do tego wrócimy.
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_back_13_01"); //Mam nadzieję.
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
	description = "Co myślisz o tym całym polowaniu na smoki?";
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
	AI_Output (other, self,"DIA_Buster_Perm4_15_00"); //Co myślisz o tym całym polowaniu na smoki?
	AI_Output (self, other,"DIA_Buster_Perm4_13_01"); //Chłopaki mogą z tego wyjść objuczeni złotem - jeśli nie odwalą wcześniej kity.
	AI_Output (self, other,"DIA_Buster_Perm4_13_02"); //Ja tam wolę się trzymać z Lee.
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








































