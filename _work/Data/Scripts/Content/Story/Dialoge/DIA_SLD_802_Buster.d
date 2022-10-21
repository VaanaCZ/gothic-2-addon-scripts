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
	if (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST) //Wegen News - Info kommt nicht mehr gut, wenn schonmal gepr�gelt
	&& ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Buster_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Buster_Hello_13_00");	//Co my tu mamy? Czy ja ci� nie znam?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Skoro tak m�wisz. Id� si� zobaczy� z w�a�cicielem tej ziemi." 	,DIA_Buster_Hello_GoingToFarm);
	Info_AddChoice		(DIA_Buster_Hello, "A kto pyta?"									,DIA_Buster_Hello_WhoAreYou);
};

func void DIA_Buster_Hello_WhoAreYou()
{
	AI_Output (other,self ,"DIA_Buster_Hello_WhoAreYou_15_00"); //A kto pyta?
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_01"); //Jestem Buster, jeden z najemnik�w Lee!
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_02"); //I LEPIEJ zachowuj si� grzeczniej, bo inaczej zbierzesz ci�gi!
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_03"); //Dobra, czego tu szukasz?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Nie tw�j interes."								,DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice		(DIA_Buster_Hello, "Znam Lee!"											,DIA_Buster_Hello_IKnowLee);
	Info_AddChoice		(DIA_Buster_Hello, "Jestem tylko podr�nikiem w drodze do posiadacza ziemskiego." 	,DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_IKnowLee()
{
	AI_Output (other,self ,"DIA_Buster_Hello_IKnowLee_15_00"); //Znam Lee!
	AI_Output (self ,other,"DIA_Buster_Hello_IKnowLee_13_01"); //Wszyscy znaj� Lee. To nic nie znaczy, kole�. Teraz rozmawiasz ze MN�!
	AI_Output (self ,other,"DIA_Buster_Hello_IKnowLee_13_02"); //Dok�d zmierzasz?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Nie tw�j interes."								,DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice		(DIA_Buster_Hello, "Jestem tylko podr�nikiem w drodze do posiadacza ziemskiego." 	,DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_NotYourBusiness()
{
	AI_Output (other,self ,"DIA_Buster_Hello_NotYourBusiness_15_00"); //Nie tw�j interes.
	AI_Output (self ,other,"DIA_Buster_Hello_NotYourBusiness_13_01"); //Nikt tak do mnie nie m�wi, robaku! My�l�, �e czas porachowa� ci gnaty.
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_GoingToFarm()
{
	AI_Output (other,self ,"DIA_Buster_Hello_GoingToFarm_15_00"); //Skoro tak m�wisz. Id� si� zobaczy� z w�a�cicielem tej ziemi.
	AI_Output (self ,other,"DIA_Buster_Hello_GoingToFarm_13_01"); //W rzeczy samej... Hmmm - nie wygl�dasz na niebezpiecznego.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Chcesz si� przekona�?"								,DIA_Buster_Hello_WannaTestIt);
	Info_AddChoice		(DIA_Buster_Hello, "Zdarzy�o mi si� zabi� besti� czy dwie."	,DIA_Buster_Hello_SlewBeasts);
	Info_AddChoice		(DIA_Buster_Hello, "Tu masz racj�." 									,DIA_Buster_Hello_ImNoDanger);
};

func void DIA_Buster_Hello_ImNoDanger()
{
	AI_Output (other,self ,"DIA_Buster_Hello_ImNoDanger_15_00"); //Tu masz racj�.
	AI_Output (self ,other,"DIA_Buster_Hello_ImNoDanger_13_01"); //Taa kole�, po latach uczysz si� wy�apywa� takie rzeczy.
	AI_Output (self ,other,"DIA_Buster_Hello_ImNoDanger_13_02"); //Tutaj cz�sto walczymy z orkami. Albo ze stra�nikami z miasta. Strasznie uparte z nich gnojki.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Masz na my�li PRAWDZIWYCH ork�w? Tych wielkolud�w?"						,DIA_Buster_Hello_RealOrcs);
	Info_AddChoice		(DIA_Buster_Hello, "No i?"												,DIA_Buster_Hello_SoWhat);
	Info_AddChoice		(DIA_Buster_Hello, "Imponuj�ce." 										,DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_SlewBeasts()
{
	AI_Output (other,self ,"DIA_Buster_Hello_SlewBeasts_15_00"); //Zdarzy�o mi si� zabi� besti� czy dwie.
	AI_Output (self ,other,"DIA_Buster_Hello_SlewBeasts_13_01"); //Ha! Pewnie uda�o ci si� rozsmarowa� par� �uk�w na polu i przegoni� z nor kilka szczur�w.
	AI_Output (self ,other,"DIA_Buster_Hello_SlewBeasts_13_02"); //Mamy tu do czynienia z orkami! No i jeszcze z tymi szumowinami - stra�nikami miejskimi.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Masz na my�li PRAWDZIWYCH ork�w? Tych wielkolud�w?"						,DIA_Buster_Hello_RealOrcs);
	Info_AddChoice		(DIA_Buster_Hello, "No i?"												,DIA_Buster_Hello_SoWhat);
	Info_AddChoice		(DIA_Buster_Hello, "Imponuj�ce." 										,DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_WannaTestIt()
{
	AI_Output (other,self ,"DIA_Buster_Hello_WannaTestIt_15_00"); //Chcesz si� przekona�?
	AI_Output (self ,other,"DIA_Buster_Hello_WannaTestIt_13_01"); //Ojej! Wybra�em sobie nie tego go�cia, co?
	AI_Output (other,self ,"DIA_Buster_Hello_WannaTestIt_15_02"); //Mo�na tak powiedzie�.
	AI_Output (self ,other,"DIA_Buster_Hello_WannaTestIt_13_03"); //No to chod�, poka� mi, co umiesz.
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_Impressive()
{
	AI_Output (other,self ,"DIA_Buster_Hello_Impressive_15_00"); //Imponuj�ce.
	AI_Output (self ,other,"DIA_Buster_Hello_Impressive_13_01"); //To nasza bran�a, ma�y! Robimy nawet bro� i pancerze!
	AI_Output (self ,other,"DIA_Buster_Hello_Impressive_13_02"); //Codziennie zmagamy si� ze �mierci�. Ale taki wiejski kmiot jak ty nie mo�e o tym wiedzie�.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Chyba b�d� musia� ci pokaza�, co o tym wiem!"	,DIA_Buster_Hello_LetMeShowYou);
	Info_AddChoice		(DIA_Buster_Hello, "Jak chcesz."									,DIA_Buster_Hello_IfYouSaySo);
};

func void DIA_Buster_Hello_IfYouSaySo()
{
	AI_Output (other,self ,"DIA_Buster_Hello_IfYouSaySo_15_00"); //Jak chcesz.
	AI_Output (self ,other,"DIA_Buster_Hello_IfYouSaySo_13_01"); //Ruszaj si�, mi�czaku!

	AI_StopProcessInfos	(self);
};

func void DIA_Buster_Hello_LetMeShowYou()
{
	AI_Output (other,self ,"DIA_Buster_Hello_LetMeShowYou_15_00"); //Chyba b�d� musia� ci pokaza�, co o tym wiem!
	AI_Output (self ,other,"DIA_Buster_Hello_LetMeShowYou_13_01"); //Przeprowadzasz wi�c jednoosobowe powstanie ch�opskie?
	AI_Output (self ,other,"DIA_Buster_Hello_LetMeShowYou_13_02"); //Dobrze wi�c, poka�, co masz.
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_SoWhat()
{
	AI_Output (other,self ,"DIA_Buster_Hello_SoWhat_15_00"); //Wi�c?
	AI_Output (self ,other,"DIA_Buster_Hello_SoWhat_13_01"); //Jak gdyby� wiedzia� o czym m�wi�. Wydaje ci si�, �e jeste� nadludzko silny, co?
	AI_Output (self ,other,"DIA_Buster_Hello_SoWhat_13_02"); //Mo�e pora, �eby kto� da� ci lekcj�!
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "W ka�dej chwili."						,DIA_Buster_Hello_Whenever);
	Info_AddChoice		(DIA_Buster_Hello, "Tylko �artowa�em...."			,DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_RealOrcs()
{
	AI_Output (other,self ,"DIA_Buster_Hello_RealOrcs_15_00"); //Masz na my�li PRAWDZIWYCH ork�w? Tych wielkolud�w?
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_01"); //Jedn� chwilk�! Stroisz sobie ze mnie �arty?
	AI_Output (other,self ,"DIA_Buster_Hello_RealOrcs_15_02"); //Ale� sk�d.
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_03"); //Ty robaku! Naprawd� si� o to prosisz, co?
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_04"); //No to chod� i poka� mi, co umiesz, bohaterze.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "W ka�dej chwili."						,DIA_Buster_Hello_Whenever);
	Info_AddChoice		(DIA_Buster_Hello, "Tylko �artowa�em...."			,DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_Whenever()
{
	AI_Output (other,self ,"DIA_Buster_Hello_Whenever_15_00"); //W ka�dej chwili.
	AI_Output (self ,other,"DIA_Buster_Hello_Whenever_13_01"); //No to podejd� bli�ej, kole�!
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_JustJoking()
{
	AI_Output (other,self ,"DIA_Buster_Hello_JustJoking_15_00"); //Tylko �artowa�em....
	AI_Output (self ,other,"DIA_Buster_Hello_JustJoking_13_01"); //Taak, racja. Uspok�j si� troch�! Zejd� mi z oczu.
	
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
	AI_Output (self, other,"DIA_Buster_FightNone_13_00"); //Czego chcesz, mi�czaku?
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
	description = "Wyzywam ci� na pojedynek.";
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
	AI_Output (other, self,"DIA_Buster_Duell_15_00"); //Wyzywam ci� na pojedynek.
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		AI_Output (self, other,"DIA_Buster_Duell_13_01"); //Ha! Chyba nie my�lisz, �e to b�dzie �atwe, co? Dobra, chod� tu!
	}
	else //WON oder CANCEL
	{
		AI_Output (self, other,"DIA_Buster_Duell_13_02"); //Chcesz spr�bowa� jeszcze raz? No dobra - chod� tu niezno�ny g�wniarzu!
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
	description = "Chc� si� przy��czy� do najemnik�w. Masz co� przeciwko temu?";
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
	AI_Output (other, self,"DIA_Buster_WannaJoin_15_00"); //Chc� do��czy� do najemnik�w!
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	|| (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_01"); //Ka�dy, kto potrafi przywali� tak mocno jak ty, nie powinien mie� tutaj wi�kszych k�opot�w.
		}
		else //FIGHT_WON
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_02"); //Nie jeste� mo�e najlepszym z wojownik�w, ale trudno nazwa� ci� tch�rzem.
		};
		AI_Output (self, other,"DIA_Buster_WannaJoin_13_03"); //M�j g�os nie ma wielkiego znaczenia, bo jestem tu od niedawna, ale kiedy Lee mnie zapyta, b�d� g�osowa� na ciebie.
		Buster_Duell = TRUE;
		Log_CreateTopic (TOPIC_SLDRespekt,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_SLDRespekt,LOG_RUNNING);
		B_LogEntry (TOPIC_SLDRespekt,"Od kiedy pokona�em Bustera, nie ma nic przeciwko mojemu przy��czeniu si� do najemnik�w.");
	}
	else //FIGHT_NONE oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Buster_WannaJoin_13_04"); //Ty? Nie przypominam sobie, �eby kiedykolwiek przyj�li do najemnik�w jakiego� tch�rza...
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_05"); //Ucieczka z pojedynku - w taki spos�b daleko tu nie zajdziesz!
		};
	};
};

// ************************************************************
// 		  				 Mehr �ber S�ldner		
// ************************************************************
var int Buster_SentenzaTip;

INSTANCE DIA_Buster_OtherSld (C_INFO)
{
	npc			= Sld_802_Buster;
	nr			= 1;
	condition	= DIA_Buster_OtherSld_Condition;
	information	= DIA_Buster_OtherSld_Info;
	permanent	= FALSE;
	description = "Chc� si� dowiedzie� czego� wi�cej o najemnikach i okolicznych terenach.";
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
	AI_Output (other, self,"DIA_Buster_OtherSld_15_00"); //Chc� si� dowiedzie� czego� wi�cej o najemnikach i okolicznych terenach.
	AI_Output (self, other,"DIA_Buster_OtherSld_13_01"); //Niewiele mog� ci powiedzie� o tej okolicy. Lepiej popytaj wie�niak�w.
	AI_Output (self, other,"DIA_Buster_OtherSld_13_02"); //A je�li chodzi o nas, najemnik�w - mamy bardzo prost� zasad�: je�eli potrafisz dotrzyma� pola, jeste� z nami.
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other,"DIA_Buster_OtherSld_13_03"); //Wydaje mi si�, �e nadajesz si� na jednego z nas.
		AI_Output (self, other,"DIA_Buster_OtherSld_13_04"); //Nie my�l se jednak, �e w naszej ostatniej walce brak�o ci szcz�cia.
		AI_Output (self, other,"DIA_Buster_OtherSld_13_05"); //Na farmie jest mn�stwo ch�opak�w, kt�rzy s� lepsi ode mnie...
		AI_Output (self, other,"DIA_Buster_OtherSld_13_06"); //Na przyk�ad Sentenza. Pilnuje wej�cia na farm�. Nie zaczynaj z nim walki.
		Buster_SentenzaTip = TRUE;
	}
	else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		//NICHTS (s.o.)
	}
	else  //FIGHT_NONE oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Buster_OtherSld_13_07"); //Ale po co m�wi� to TOBIE, mi�czaku!
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
	description = "A co z tym Sentenz�?";
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
	AI_Output (other, self,"DIA_Buster_AboutSentenza_15_00"); //A co z tym Sentenz�?
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_01"); //Kiedy przyjdziesz na farm�, b�dzie chcia� wyci�gn�� od ciebie troch� z�ota - robi tak z wszystkimi nowymi.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_02"); //Na twoim miejscu bym zap�aci�. Ja tak zrobi�em, a potem on na mnie g�osowa�.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_03"); //Powiedzia�, �e przys�uga za przys�ug�. Straci�em ca�e moje z�oto, ale nie by�o tego za wiele. A ostatecznie by�em z tego zadowolony.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_04"); //Widzia�em kiedy�, jak pobi� kolesia, kt�ry postanowi� mu NIE p�aci�.
	AI_Output (other, self,"DIA_Buster_AboutSentenza_15_05"); //Dzi�ki za wskaz�wk�.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_06"); //W rzeczy samej. Ma dla ciebie jak�� warto��?

	Info_ClearChoices (DIA_Buster_AboutSentenza);
	Info_AddChoice (DIA_Buster_AboutSentenza, "Nie.", DIA_Buster_AboutSentenza_No);
	Info_AddChoice (DIA_Buster_AboutSentenza, "Prosz� � 5 sztuk z�ota.", DIA_Buster_AboutSentenza_Give);
};

func void DIA_Buster_AboutSentenza_Give()
{
	AI_Output (other, self,"DIA_Buster_AboutSentenza_Give_15_00"); //Trzymaj - 5 sztuk z�ota.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_Give_13_01"); //Dzi�ki. Koniec ko�c�w wygl�da na to, �e jednak mog� dzisiaj wieczorem co� �ykn��. Nie zapomn� ci tego.
	Buster_GoldZumBrennen = TRUE;
	Buster_Bonus = 50;
	Info_ClearChoices (DIA_Buster_AboutSentenza);
};

func void DIA_Buster_AboutSentenza_No()
{
	AI_Output (other, self,"DIA_Buster_AboutSentenza_No_15_00"); //Nie.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_No_13_01"); //Tak w�a�nie my�la�em.
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
	description = "Lee jest dow�dc� najemnik�w, tak?";
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
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_00"); //Lee jest dow�dc� najemnik�w, tak?
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_01"); //Dobra - hej, przypominam sobie, sk�d ci� znam! Te� by�e� w Kolonii.
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_02"); //Tak, by�em.
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_03"); //Nie widzia�em ci�, gdy to si� wszystko sta�o. Przedtem zreszt� te�.
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_04"); //Mia�em inne k�opoty.
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_05"); //Sporo ci� omin�o - od czasu jak siedzieli�my razem w Kolonii.
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
	description = "Co si� sta�o z najemnikami z Kolonii?";
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
	AI_Output (other, self,"DIA_Buster_WhatHappened_15_00"); //Co si� sta�o z najemnikami z Kolonii?
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_01"); //Kiedy Bariera pad�a, Lee wyprowadzi� nas z Kolonii. Powiedzia�, �e je�li b�dziemy si� trzyma� razem, nic nam si� nie stanie. Mia� racj�.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_02"); //Kr�tko potem znale�li�my sobie tutaj przytulne miejsce. W�a�ciciel tej ziemi p�aci nam za pranie ch�opak�w ze stra�y miejskiej.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_03"); //A wi�kszo�� z nas i tak robi�aby to za darmo.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_04"); //Onar karmi nas wszystkich i mo�emy czeka� na dobr� okazj�, �eby wyjecha� z tej przekl�tej wyspy.
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
	description = "Mo�esz mnie nauczy� lepiej walczy�?";
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
	AI_Output (other, self, "DIA_Buster_Teach_15_00"); //Mo�esz mnie nauczy� lepiej walczy�?
	if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Buster_Teach_13_01"); //Mo�e b�d� m�g� da� ci wskaz�wk� czy dwie...
	}
	else 
	{
		AI_Output (self, other, "DIA_Buster_Teach_13_02"); //Nie jeste� tak t�py na jakiego wygl�dasz. Dobrze, powiem ci, co wiem. Wtedy mo�e b�dziesz mia� ze mn� jakie� szanse...
	};
	
	if (BusterLOG == FALSE)
	{
		Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry (Topic_SoldierTeacher,"Buster mo�e mnie nauczy� walki or�em jednor�cznym.");
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
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_00"); //Hej ty, kole�!
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_15_01"); //Czego chcesz?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_02"); //Przez ostatnie kilka dni my�la�em, jak mogliby�my szybko zarobi� w tej norze troch� kasy.
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_15_03"); //No i?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_04"); //Wydaje mi si�, �e wpad�em na pomys�, jak si� szybko wzbogaci�.
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_05"); //Jest taki kupiec w mie�cie, kt�ry zap�aci kup� kasy za pewn� rzecz.

	Info_ClearChoices	(DIA_Buster_SHADOWBEASTS);
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Kim jest ten kupiec, o kt�rym m�wisz?", DIA_Buster_SHADOWBEASTS_wer );
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "O co chodzi?", DIA_Buster_SHADOWBEASTS_was );
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Dlaczego mi to m�wisz?", DIA_Buster_SHADOWBEASTS_ich );

};
func void DIA_Buster_SHADOWBEASTS_ich ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_ich_15_00"); //Dlaczego mi to m�wisz?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_ich_13_01"); //Sam nie mog� tego zrobi�. Musz� tu siedzie� i pilnowa� tych g�upich owiec.
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_ich_15_02"); //Chodzi ci o farmer�w?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_ich_13_03"); //To w�a�nie mam na my�li.

};
func void DIA_Buster_SHADOWBEASTS_was ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_15_00"); //O co chodzi?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_13_01"); //�w kupiec twierdzi, �e potrafi z du�ym zyskiem sprzeda� rogi cieniostwor�w.
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_13_02"); //Kto� musia�by uda� si� do lasu i zapolowa� na te bestie. To w�a�nie twoje zadanie.

	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Ile mo�na na tym zarobi�?", DIA_Buster_SHADOWBEASTS_was_wieviel );
};
func void DIA_Buster_SHADOWBEASTS_was_wieviel ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_wieviel_15_00"); //Ile mo�na na tym zarobi�?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_wieviel_13_01"); //Kupa kasy, powiadam ci. Wystarczy dla nas dw�ch.
	if (Buster_GoldZumBrennen == TRUE)
	{
		AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_wieviel_13_02"); //A skoro odda�e� mi wtedy ca�e z�oto, za�atwi� ci specjaln� cen�.
	};
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_wieviel_15_03"); //Brzmi nie�le! Dam ci zna�, jak tylko zdo�am zebra� troch� rog�w.
	MIS_Buster_KillShadowbeasts_DJG = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Buster_KillShadowbeasts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Buster_KillShadowbeasts, LOG_RUNNING);
	B_LogEntry (TOPIC_Buster_KillShadowbeasts,"Buster zap�aci mi za ka�dy r�g cieniostwora, kt�ry mu przynios�."); 

	Info_ClearChoices	(DIA_Buster_SHADOWBEASTS);
};
func void DIA_Buster_SHADOWBEASTS_wer ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_wer_15_00"); //Kim jest ten kupiec, o kt�rym m�wisz?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_wer_13_01"); //Nie mog�, ch�opie. Musia�bym by� naprawd� g�upi, �eby powiedzie� ci o moim �r�dle. Chcesz mnie wykiwa�?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_wer_13_02"); //Zrobisz interes ze MN� albo w og�le, capisce?

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

	description	 = 	"Co do tych rog�w cieniostwor�w...";
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
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_00"); //M�j kupiec wyjecha� z miasta.
		AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_15_01"); //Co to ma znaczy�?
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_02"); //Nie �yje. Mo�esz zatrzyma� rogi. Nie wiem, co z nimi teraz zrobi�.
		MIS_Buster_KillShadowbeasts_DJG = LOG_SUCCESS; //Joly: Feierabend ab Kapitel 5!!!!!!!
		B_GivePlayerXP (XP_Ambient);
	}
	else if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
	{
		AI_Output			(other, self, "DIA_Buster_ANIMALTROPHYSHADOWBEAST_15_03"); //Jak wypatroszy� cieniostwora?
		AI_Output			(self, other, "DIA_Buster_ANIMALTROPHYSHADOWBEAST_13_04"); //Nie wiesz? Oj ch�opie, spodziewa�em si� po tobie wi�cej.
	
		Info_ClearChoices	(DIA_Buster_BringTrophyShadowbeast);
		Info_AddChoice	(DIA_Buster_BringTrophyShadowbeast, "Jeszcze do tego wr�cimy.", DIA_Buster_BringTrophyShadowbeast_back );
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
				AI_Output		(other, self, "DIA_Buster_BringTrophyShadowbeast_15_05"); //Mam dla ciebie r�g cieniostwora.
				B_GivePlayerXP (XP_BringBusterTrophyShadowbeast);
				B_GiveInvItems (other, self, ItAt_ShadowHorn,1);
				BusterTrophyShadowbeastCounter = BusterTrophyShadowbeastCounter + 1;
			}
			else
			{
				AI_Output		(other, self, "DIA_Buster_BringTrophyShadowbeast_15_06"); //Mam wi�cej rog�w cieniostwor�w dla twojego kupca.
	
				B_GiveInvItems (other, self, ItAt_ShadowHorn,  BusterTrophyShadowbeastCount);
	
				XP_BringBusterTrophyShadowbeasts = (BusterTrophyShadowbeastCount * XP_BringBusterTrophyShadowbeast);
				BusterTrophyShadowbeastCounter = (BusterTrophyShadowbeastCounter + BusterTrophyShadowbeastCount); 
	
				B_GivePlayerXP (XP_BringBusterTrophyShadowbeasts);
			};
	
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_07"); //�wietnie. Daj je tutaj. I przynie� wi�cej. Kto wie, jak d�ugo jeszcze ten kupiec b�dzie chcia� te rzeczy.
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_08"); //Oto twoja dzia�ka.
	
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
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_01"); //No to s�uchaj. Zabijasz cieniostwora, a potem �apiesz praw� r�k� za r�g, najmocniej jak potrafisz.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_02"); //Potem wbijasz n� w jego czo�o i wycinasz bruzd� w ciele dooko�a rogu.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_03"); //Potem u�ywasz no�a jak d�wigni, �eby wyrwa� r�g z czaszki i ju� jest tw�j.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_04"); //No, a potem musisz go przynie�� do mnie. Nie powiniene� mie� z tym problem�w.
		};		
	Info_ClearChoices	(DIA_Buster_BringTrophyShadowbeast);
};

func void DIA_Buster_BringTrophyShadowbeast_back ()
{
		AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_back_15_00"); //Jeszcze do tego wr�cimy.
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_back_13_01"); //Mam nadziej�.
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
	description = "Co my�lisz o tym ca�ym polowaniu na smoki?";
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
	AI_Output (other, self,"DIA_Buster_Perm4_15_00"); //Co my�lisz o tym ca�ym polowaniu na smoki?
	AI_Output (self, other,"DIA_Buster_Perm4_13_01"); //Ch�opaki mog� z tego wyj�� objuczeni z�otem - je�li nie odwal� wcze�niej kity.
	AI_Output (self, other,"DIA_Buster_Perm4_13_02"); //Ja tam wol� si� trzyma� z Lee.
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








































