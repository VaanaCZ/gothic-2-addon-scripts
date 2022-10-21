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
	AI_Output (self ,other,"DIA_Buster_Hello_13_00");	//Kohopak to tady máme? Neznám tì odnìkud?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Když myslíš. Jsem na cestì za statkáøem." 	,DIA_Buster_Hello_GoingToFarm);
	Info_AddChoice		(DIA_Buster_Hello, "Kdo se ptá?"									,DIA_Buster_Hello_WhoAreYou);
};

func void DIA_Buster_Hello_WhoAreYou()
{
	AI_Output (other,self ,"DIA_Buster_Hello_WhoAreYou_15_00"); //Kdo se ptá?
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_01"); //Jsem Buster, jeden z Leeových žoldnéøù!
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_02"); //A TY bys ke mnì mìl být trošku zdvoøilejší, nebo toho budeš litovat!
	AI_Output (self ,other,"DIA_Buster_Hello_WhoAreYou_13_03"); //Dobrá, co tady chceš?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Do toho ti nic není."								,DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice		(DIA_Buster_Hello, "Leeho znám!"											,DIA_Buster_Hello_IKnowLee);
	Info_AddChoice		(DIA_Buster_Hello, "Jsem pouhým poutníkem, který by si rád promluvil se statkáøem." 	,DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_IKnowLee()
{
	AI_Output (other,self ,"DIA_Buster_Hello_IKnowLee_15_00"); //Leeho znám!
	AI_Output (self ,other,"DIA_Buster_Hello_IKnowLee_13_01"); //Leeho zná každý! To nic neznamená, kámo. Zrovna teï mluvíš SE MNOU!
	AI_Output (self ,other,"DIA_Buster_Hello_IKnowLee_13_02"); //Takže, kam máš namíøeno?
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Do toho ti nic není."								,DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice		(DIA_Buster_Hello, "Jsem pouhým poutníkem, který by si rád promluvil s hostinským." 	,DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_NotYourBusiness()
{
	AI_Output (other,self ,"DIA_Buster_Hello_NotYourBusiness_15_00"); //Do toho ti nic není.
	AI_Output (self ,other,"DIA_Buster_Hello_NotYourBusiness_13_01"); //Takhle se mnou nikdo mluvit nebude, ty èerve! Øekl bych, že je èas na poøádnou nakládaèku.
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_GoingToFarm()
{
	AI_Output (other,self ,"DIA_Buster_Hello_GoingToFarm_15_00"); //Když myslíš. Jsem na cestì za statkáøem.
	AI_Output (self ,other,"DIA_Buster_Hello_GoingToFarm_13_01"); //Vážnì... Hm - nepøijdeš mi nìjak zvláš nebezpeèný.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Chceš to zjistit?"								,DIA_Buster_Hello_WannaTestIt);
	Info_AddChoice		(DIA_Buster_Hello, "Jednou nebo dvakrát jsem zabil nìjakou pøíšeru."	,DIA_Buster_Hello_SlewBeasts);
	Info_AddChoice		(DIA_Buster_Hello, "To máš pravdu." 									,DIA_Buster_Hello_ImNoDanger);
};

func void DIA_Buster_Hello_ImNoDanger()
{
	AI_Output (other,self ,"DIA_Buster_Hello_ImNoDanger_15_00"); //To máš pravdu.
	AI_Output (self ,other,"DIA_Buster_Hello_ImNoDanger_13_01"); //(samolibì) Jo, za ty roky se nauèíš si takových vìcí všímat, kámo.
	AI_Output (self ,other,"DIA_Buster_Hello_ImNoDanger_13_02"); //V jednom kuse tady bojujeme se skøetama. Nebo strážema z mìsta. Teda, jsou to pìknì neodbytný prevíti, to teda jo. (zasmìje se)
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Myslíš SKUTEÈNÉ skøety? Ty velké potvory?"						,DIA_Buster_Hello_RealOrcs);
	Info_AddChoice		(DIA_Buster_Hello, "Takže?"												,DIA_Buster_Hello_SoWhat);
	Info_AddChoice		(DIA_Buster_Hello, "Pùsobivé." 										,DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_SlewBeasts()
{
	AI_Output (other,self ,"DIA_Buster_Hello_SlewBeasts_15_00"); //Jednou nebo dvakrát jsem zabil nìjakou pøíšeru.
	AI_Output (self ,other,"DIA_Buster_Hello_SlewBeasts_13_01"); //Ha! (zasmìje se) Nejspíš jsi v poli rozšlápnul pár broukù a vyhnal nìkolik krys z jejich nor.
	AI_Output (self ,other,"DIA_Buster_Hello_SlewBeasts_13_02"); //Tady nám jdou po krku skøeti! Jo, a ta mizerná mìstská stráž. (výsmìšnì se zasmìje)
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Myslíš SKUTEÈNÉ skøety? Ty velké potvory?"						,DIA_Buster_Hello_RealOrcs);
	Info_AddChoice		(DIA_Buster_Hello, "Takže?"												,DIA_Buster_Hello_SoWhat);
	Info_AddChoice		(DIA_Buster_Hello, "Pùsobivé." 										,DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_WannaTestIt()
{
	AI_Output (other,self ,"DIA_Buster_Hello_WannaTestIt_15_00"); //Chceš se pøesvìdèit
	AI_Output (self ,other,"DIA_Buster_Hello_WannaTestIt_13_01"); //Božíèku! Vybral jsem si špatného otloukánka, co?
	AI_Output (other,self ,"DIA_Buster_Hello_WannaTestIt_15_02"); //Dalo by se to tak øíct.
	AI_Output (self ,other,"DIA_Buster_Hello_WannaTestIt_13_03"); //Tak pojï, ukaž mi, co v tobì je.
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_Impressive()
{
	AI_Output (other,self ,"DIA_Buster_Hello_Impressive_15_00"); //Pùsobivé.
	AI_Output (self ,other,"DIA_Buster_Hello_Impressive_13_01"); //(zasmìje se) To je naše živnost, chlapèe! Dokonce si dìláme vlastní zbranì a brnìní!
	AI_Output (self ,other,"DIA_Buster_Hello_Impressive_13_02"); //Vysmíváme se smrti den co den. Ale o nìèem takovém nemá vesnický balík jako ty ani zdání.
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Asi ti budu muset ukázat, jak velké ponìtí o tom mám!"	,DIA_Buster_Hello_LetMeShowYou);
	Info_AddChoice		(DIA_Buster_Hello, "Když to øíkáš..."									,DIA_Buster_Hello_IfYouSaySo);
};

func void DIA_Buster_Hello_IfYouSaySo()
{
	AI_Output (other,self ,"DIA_Buster_Hello_IfYouSaySo_15_00"); //Když to øíkáš...
	AI_Output (self ,other,"DIA_Buster_Hello_IfYouSaySo_13_01"); //(se znudìným zavrèením) Mazej, strašpytle!

	AI_StopProcessInfos	(self);
};

func void DIA_Buster_Hello_LetMeShowYou()
{
	AI_Output (other,self ,"DIA_Buster_Hello_LetMeShowYou_15_00"); //Asi ti budu muset ukázat, jak velké ponìtí o tom mám!
	AI_Output (self ,other,"DIA_Buster_Hello_LetMeShowYou_13_01"); //To má být jednomužné rolnické povstání, nebo co?
	AI_Output (self ,other,"DIA_Buster_Hello_LetMeShowYou_13_02"); //Tak dobrá, ukaž mi, co v tobì je.
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_SoWhat()
{
	AI_Output (other,self ,"DIA_Buster_Hello_SoWhat_15_00"); //Takže?
	AI_Output (self ,other,"DIA_Buster_Hello_SoWhat_13_01"); //(odfrkne si) Jako bys vìdìl, o èem to tady mluvím. Myslíš si, bùhvíjak nejsi silný, co?
	AI_Output (self ,other,"DIA_Buster_Hello_SoWhat_13_02"); //(rozzlobenì) Možná je naèase, aby ti nìkdo uštìdøil lekci!
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Kdykoliv!"						,DIA_Buster_Hello_Whenever);
	Info_AddChoice		(DIA_Buster_Hello, "Dìlám si srandu..."			,DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_RealOrcs()
{
	AI_Output (other,self ,"DIA_Buster_Hello_RealOrcs_15_00"); //Myslíš SKUTEÈNÉ skøety? Ty velké potvory?
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_01"); //(povzdychne si) Já jenom... Poèkat! Chceš si ze mì utahovat?
	AI_Output (other,self ,"DIA_Buster_Hello_RealOrcs_15_02"); //(s úsmìvem) To vùbec ne.
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_03"); //Ty èerve! (neèekanì agresivnì) Nedáš jinak, co?
	AI_Output (self ,other,"DIA_Buster_Hello_RealOrcs_13_04"); //Tak pojï a ukaž, co v tobì je, ty hrdino!
	
	Info_ClearChoices	(DIA_Buster_Hello);

	Info_AddChoice		(DIA_Buster_Hello, "Kdykoliv!"						,DIA_Buster_Hello_Whenever);
	Info_AddChoice		(DIA_Buster_Hello, "Dìlám si srandu..."			,DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_Whenever()
{
	AI_Output (other,self ,"DIA_Buster_Hello_Whenever_15_00"); //Kdykoliv!
	AI_Output (self ,other,"DIA_Buster_Hello_Whenever_13_01"); //Tak pojï blíž, kámo!
	
	AI_StopProcessInfos	(self);
	B_Attack(self,other,AR_NONE, 1);
};

func void DIA_Buster_Hello_JustJoking()
{
	AI_Output (other,self ,"DIA_Buster_Hello_JustJoking_15_00"); //Dìlám si srandu.
	AI_Output (self ,other,"DIA_Buster_Hello_JustJoking_13_01"); //No jo, jasnì, zastrè drápky! Jdi mi z oèí!
	
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
	AI_Output (self, other,"DIA_Buster_FightNone_13_00"); //Co chceš, strašpytle?
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
	description = "Vyzívám tì k souboji!";
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
	AI_Output (other, self,"DIA_Buster_Duell_15_00"); //Vyzívám tì k souboji!
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		AI_Output (self, other,"DIA_Buster_Duell_13_01"); //Ha, ha! Nechceš to nechat jen tak, co? Tak dobrá - pojï sem!
	}
	else //WON oder CANCEL
	{
		AI_Output (self, other,"DIA_Buster_Duell_13_02"); //Chceš to zkusit znovu? Otravo mizernej - dobrá, pojï sem!
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output (self, other,"DIA_Buster_Duell_13_03"); //Ale už podruhé neutíkej!
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
	description = "Chci se pøidat k žoldnéøùm!";
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
	AI_Output (other, self,"DIA_Buster_WannaJoin_15_00"); //Chci se pøidat k žoldnéøùm!
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	|| (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_01"); //Každý, kdo má ránu tvrdou jako ty, by tady nemìl mít žádné problémy.
		}
		else //FIGHT_WON
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_02"); //Nejsi zrovna nejlepší bojovník, ale odvaha ti rozhodnì nechybí.
		};
		AI_Output (self, other,"DIA_Buster_WannaJoin_13_03"); //Mùj hlas tady moc neznamená, protože jsem tady dlouho nebyl, ale až se mì Lee zeptá, budu hlasovat pro tebe.
		Buster_Duell = TRUE;
		Log_CreateTopic (TOPIC_SLDRespekt,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_SLDRespekt,LOG_RUNNING);
		B_LogEntry (TOPIC_SLDRespekt,"Teï, když jsem Bustera porazil, už nemá nic proti tomu, abych se pøidal k žoldákùm.");
	}
	else //FIGHT_NONE oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Buster_WannaJoin_13_04"); //Ty? Nevzpomínám si, že by k žoldnéøùm kdy pøijali nìjakého sraba.
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output (self, other,"DIA_Buster_WannaJoin_13_05"); //Utíkat ze souboje - s tím se tady moc daleko nedostaneš!
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
	description = "Rád bych se dozvìdìl nìco o žoldnéøích a zdejším okolí.";
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
	AI_Output (other, self,"DIA_Buster_OtherSld_15_00"); //Rád bych se dozvìdìl nìco o žoldnéøích a zdejším okolí.
	AI_Output (self, other,"DIA_Buster_OtherSld_13_01"); //O okolí ti toho moc nepovím. Na to by ses mìl radìji zeptat farmáøù.
	AI_Output (self, other,"DIA_Buster_OtherSld_13_02"); //A co se týèe nás žoldnéøù - máme jedno velice jednoduché pravidlo: jestli dokážeš neustoupit, mùžeš mezi nás.
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other,"DIA_Buster_OtherSld_13_03"); //Myslím, že jsi pøesnì z toho materiálu, který potøebujeme.
		AI_Output (self, other,"DIA_Buster_OtherSld_13_04"); //Ale ne, aby ti to stouplo do hlavy, že jsi mìl v našem posledním souboji štìstí.
		AI_Output (self, other,"DIA_Buster_OtherSld_13_05"); //Na farmì je spousta hochù, kteøí jsou o chloupek lepší než já.
		AI_Output (self, other,"DIA_Buster_OtherSld_13_06"); //Sentenza, napøíklad. Hlídá vstup na farmu. A se dìje, co se dìje, s ním se do køížku nepouštìj.
		Buster_SentenzaTip = TRUE;
	}
	else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		//NICHTS (s.o.)
	}
	else  //FIGHT_NONE oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Buster_OtherSld_13_07"); //Ale proè to vlastnì øíkám takovému zbabìlci!
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
	description = "Co s tím Sentenzou?";
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
	AI_Output (other, self,"DIA_Buster_AboutSentenza_15_00"); //Co s tím Sentenzou?
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_01"); //Až pøijdeš na farmu, pokusí se z tebe vymáèknout nìjaké peníze - to dìlá všem nováèkùm.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_02"); //A být na tvém místì, tak bych zaplatil. Sám jsem to svého èasu udìlal. Dobré bylo, že mi pak dal svùj hlas.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_03"); //Øíká, že jedna laskavost vyžaduje druhou. Tenkrát jsem tak pøišel o všechny své peníze, ale nebylo to vlastnì až tak moc. A nakonec jsem byl rád, že to tak dopadlo.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_04"); //Ve chvíli, když jsem vidìl, jak zmlátil maníka, který se rozhodl NEZAPLATIT.
	AI_Output (other, self,"DIA_Buster_AboutSentenza_15_05"); //Díky za radu.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_13_06"); //Rádo se stalo. Má pro tebe nìjakou cenu?

	Info_ClearChoices (DIA_Buster_AboutSentenza);
	Info_AddChoice (DIA_Buster_AboutSentenza, "Ne.", DIA_Buster_AboutSentenza_No);
	Info_AddChoice (DIA_Buster_AboutSentenza, "Tady máš - 5 zlatých.", DIA_Buster_AboutSentenza_Give);
};

func void DIA_Buster_AboutSentenza_Give()
{
	AI_Output (other, self,"DIA_Buster_AboutSentenza_Give_15_00"); //Tady máš - 5 zlatých.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_Give_13_01"); //Díky, chlape. Zdá se, že si veèer budu moc dát pár korbelù. Na to nezapomenu.
	Buster_GoldZumBrennen = TRUE;
	Buster_Bonus = 50;
	Info_ClearChoices (DIA_Buster_AboutSentenza);
};

func void DIA_Buster_AboutSentenza_No()
{
	AI_Output (other, self,"DIA_Buster_AboutSentenza_No_15_00"); //Ne.
	AI_Output (self, other,"DIA_Buster_AboutSentenza_No_13_01"); //Myslel jsem si to.
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
	description = "Lee je šéf žoldnéøù, ne?";
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
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_00"); //Lee je šéf žoldnéøù, ne?
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_01"); //Pøesnì tak - hej, už jsem si vzpomnìl, odkud tì znám! Tys byl také v kolonii.
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_02"); //(s povzdychem) To jsem byl.
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_03"); //Nevidìl jsem tì, když došlo k tomu velkému tøesku. Ani hodnou chvíli pøedtím.
	AI_Output (other, self,"DIA_Buster_LeeLeader_15_04"); //Mìl jsem jiné starosti.
	AI_Output (self, other,"DIA_Buster_LeeLeader_13_05"); //Tos o hodnì pøišel - co jsme byli v lochu, tak se dost vìcí zmìnilo.
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
	description = "Co se stalo se žoldnéøi v kolonii?";
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
	AI_Output (other, self,"DIA_Buster_WhatHappened_15_00"); //Co se stalo se žoldnéøi v kolonii?
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_01"); //Jakmile bariéra padla, vyvedl nás Lee z kolonie. Øíkal, že když budeme držet pohromadì, tak se nám nic nestane. A mìl pravdu.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_02"); //Netrvalo dlouho a našli jsme si tady hezké místeèko. Statkáø nám platí, abychom zametali s domobranou z mìsta.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_03"); //A vìtšina z nás by do toho šla dobrovolnì i zadarmo.
	AI_Output (self, other,"DIA_Buster_WhatHappened_13_04"); //Ale Onar nám dává jídlo a aspoò tak mùžeme nìjak zabít èas, než se naskytne nìjaká pøíležitost pláchnout z tohohle mizerného ostrova.
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
	description = "Mùžeš mì nauèit, jak lépe bojovat?";
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
	AI_Output (other, self, "DIA_Buster_Teach_15_00"); //Mùžeš mì nauèit, jak lépe bojovat?
	if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Buster_Teach_13_01"); //Možná bych ti mohl dát jednu dvì rady.
	}
	else 
	{
		AI_Output (self, other, "DIA_Buster_Teach_13_02"); //Nejsi tak tupý, jak vypadáš. Dobrá, nauèím tì, co vím. Pak možná proti mnì budeš mít nìjakou šanci.
	};
	
	if (BusterLOG == FALSE)
	{
		Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry (Topic_SoldierTeacher,"Buster mì nauèí, jak bojovat jednoruèními zbranìmi.");
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
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_00"); //Hej, ty, chlapèe!
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_15_01"); //Co chceš?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_02"); //Posledních pár dní jsem pøemýšlel, jak v téhle díøe pøijít k nìjakým snadným penìzùm.
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_15_03"); //A?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_04"); //Myslím, že jsem pøišel na to, jak nìjaké prachy získat.
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_13_05"); //Jeden kupec z mìsta vyklopí za jistou vìc pìknej balík.

	Info_ClearChoices	(DIA_Buster_SHADOWBEASTS);
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Co je to za kupce, o kterém mluvíš?", DIA_Buster_SHADOWBEASTS_wer );
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "O co jde?", DIA_Buster_SHADOWBEASTS_was );
	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Proè mi to øíkáš?", DIA_Buster_SHADOWBEASTS_ich );

};
func void DIA_Buster_SHADOWBEASTS_ich ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_ich_15_00"); //Proè mi to øíkáš?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_ich_13_01"); //Nemùžu do toho jít sám. Musím zùstat tady a dávat pozor na ty pitomé ovce.
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_ich_15_02"); //Myslíš farmáøe.
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_ich_13_03"); //No vždy.

};
func void DIA_Buster_SHADOWBEASTS_was ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_15_00"); //O co jde?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_13_01"); //Ten kupec tvrdí, že by mohl na trhu velice dobøe zpenìžit rohy stínové šelmy.
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_13_02"); //Nìkdo bude muset jít do lesa a ty stvùry pokosit. A to je právì práce pro tebe.

	Info_AddChoice	(DIA_Buster_SHADOWBEASTS, "Kolik z toho kouká?", DIA_Buster_SHADOWBEASTS_was_wieviel );
};
func void DIA_Buster_SHADOWBEASTS_was_wieviel ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_wieviel_15_00"); //Kolik z toho kouká?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_wieviel_13_01"); //Balík penìz, to ti povídám. Bude dost pro nás pro oba.
	if (Buster_GoldZumBrennen == TRUE)
	{
		AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_was_wieviel_13_02"); //A protože jsi mi tenkrát pøinesl to zlato, udìlám ti zvláštní cenu.
	};
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_was_wieviel_15_03"); //To zní dobøe! Dám ti vìdìt, až budu mít nìjaké ty rohy.
	MIS_Buster_KillShadowbeasts_DJG = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Buster_KillShadowbeasts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Buster_KillShadowbeasts, LOG_RUNNING);
	B_LogEntry (TOPIC_Buster_KillShadowbeasts,"Buster mi nabídl dobrou cenu za každý roh stínové šelmy, který mu pøinesu."); 

	Info_ClearChoices	(DIA_Buster_SHADOWBEASTS);
};
func void DIA_Buster_SHADOWBEASTS_wer ()
{
	AI_Output			(other, self, "DIA_Buster_SHADOWBEASTS_wer_15_00"); //Co je to za kupce, o kterém mluvíš?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_wer_13_01"); //Tak to ne, kámo. Byl bych vážnì pitomec, kdybych ti prozradil svùj zdroj. Chceš mì snad podfouknout?
	AI_Output			(self, other, "DIA_Buster_SHADOWBEASTS_wer_13_02"); //Buï se dohodneš SE MNOU, nebo vùbec. Kapišto?

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

	description	 = 	"K tìm rohùm stínové šelmy...";
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
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_00"); //Mùj kupec nám dal sbohem.
		AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_15_01"); //Co to má znamenat?
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_02"); //Je mrtvý. Klidnì si ty rohy nech. Stejnì nevím, co bych s nimi teï dìlal.
		MIS_Buster_KillShadowbeasts_DJG = LOG_SUCCESS; //Joly: Feierabend ab Kapitel 5!!!!!!!
		B_GivePlayerXP (XP_Ambient);
	}
	else if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
	{
		AI_Output			(other, self, "DIA_Buster_ANIMALTROPHYSHADOWBEAST_15_03"); //Jak mám vykuchat stínovou šelmu?
		AI_Output			(self, other, "DIA_Buster_ANIMALTROPHYSHADOWBEAST_13_04"); //Ty to nevíš? Teda chlape, èekal jsem od tebe víc.
	
		Info_ClearChoices	(DIA_Buster_BringTrophyShadowbeast);
		Info_AddChoice	(DIA_Buster_BringTrophyShadowbeast, "Pak se k tobì vrátím.", DIA_Buster_BringTrophyShadowbeast_back );
		Info_AddChoice	(DIA_Buster_BringTrophyShadowbeast, B_BuildLearnString ("Uè mì.",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ShadowHorn)),  DIA_Buster_BringTrophyShadowbeast_teach );
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
				AI_Output		(other, self, "DIA_Buster_BringTrophyShadowbeast_15_05"); //Mám pro tebe roh stínové šelmy.
				B_GivePlayerXP (XP_BringBusterTrophyShadowbeast);
				B_GiveInvItems (other, self, ItAt_ShadowHorn,1);
				BusterTrophyShadowbeastCounter = BusterTrophyShadowbeastCounter + 1;
			}
			else
			{
				AI_Output		(other, self, "DIA_Buster_BringTrophyShadowbeast_15_06"); //Mám pro tvého kupce pár dalších rohù stínové šelmy.
	
				B_GiveInvItems (other, self, ItAt_ShadowHorn,  BusterTrophyShadowbeastCount);
	
				XP_BringBusterTrophyShadowbeasts = (BusterTrophyShadowbeastCount * XP_BringBusterTrophyShadowbeast);
				BusterTrophyShadowbeastCounter = (BusterTrophyShadowbeastCounter + BusterTrophyShadowbeastCount); 
	
				B_GivePlayerXP (XP_BringBusterTrophyShadowbeasts);
			};
	
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_07"); //Skvìlé. Ukaž. A pøines jich víc. Kdo ví, jak dlouho bude ten kupec tyhle vìci ještì chtít.
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_13_08"); //Tady je tvùj podíl.
	
		BusterTrophyShadowbeastGeld	= (BusterTrophyShadowbeastCount * BustersBusterTrophyShadowbeastOffer);
	
		CreateInvItems (self, ItMi_Gold, BusterTrophyShadowbeastGeld); 
		B_GiveInvItems (self, other, ItMi_Gold, BusterTrophyShadowbeastGeld);
	};

};
func void DIA_Buster_BringTrophyShadowbeast_teach ()
{
	AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_teach_15_00"); //Uè mì.

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_ShadowHorn))
		{
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_01"); //Tak poslouchej. Zabiješ stínovou šelmu a pak ji pravou rukou chytíš co nejpevnìji za roh.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_02"); //Potom zarazíš nùž do jejího èela a kolem rohu vyøízneš žlábek.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_03"); //Nùž potom použiješ jako páku, roh odlomíš a dáš si ho do kapsy.
			AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_04"); //No. A pak mi ho pøineseš. To by pro tebe nemìlo být až tak tìžké.
		};		
	Info_ClearChoices	(DIA_Buster_BringTrophyShadowbeast);
};

func void DIA_Buster_BringTrophyShadowbeast_back ()
{
		AI_Output			(other, self, "DIA_Buster_BringTrophyShadowbeast_back_15_00"); //Pak se k tobì vrátím.
		AI_Output			(self, other, "DIA_Buster_BringTrophyShadowbeast_back_13_01"); //To doufám.
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
	description = "Co si myslíš o celé té drakobijecké záležitosti?";
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
	AI_Output (other, self,"DIA_Buster_Perm4_15_00"); //Co si myslíš o celé té drakobijecké záležitosti?
	AI_Output (self, other,"DIA_Buster_Perm4_13_01"); //Hoši by z toho mohli vytøískat docela dost zlata - pokud døív nezaklepou baèkorama.
	AI_Output (self, other,"DIA_Buster_Perm4_13_02"); //Já osobnì se radši držím Leeho.
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








































