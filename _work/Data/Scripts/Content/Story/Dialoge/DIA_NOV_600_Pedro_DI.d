///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pedro_DI_EXIT   (C_INFO)
{
	npc         = NOV_600_Pedro_DI;
	nr          = 999;
	condition   = DIA_Pedro_DI_EXIT_Condition;
	information = DIA_Pedro_DI_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pedro_DI_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Pedro_DI_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Verräter
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_YOU		(C_INFO)
{
	npc			 = 	NOV_600_Pedro_DI;
	nr			 = 	2;
	condition	 = 	DIA_Pedro_DI_YOU_Condition;
	information	 = 	DIA_Pedro_DI_YOU_Info;
	
	description	 = 	"Zrádce!";
	
};
func int DIA_Pedro_DI_YOU_Condition ()
{	
	return TRUE;
};

func void DIA_Pedro_DI_YOU_Info ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_00"); //Zrádce! Tak jsem tê koneènê našel.

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_01"); //Nemysli si, že se nad tebou slituji jen proto, že jsem jedním z paladinù.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_02"); //Mnoho z nás, žoldnéâù, zaprodalo duši Beliarovi, a pâesto mi èasto neèiní dobâe pomyšlení na to, že je bez milosti zabíjíme. Ale u tebe, ty prašivá svinê, udêlám výjimku!
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_03"); //Ze všech têch bezpáteâních parchantù, které jsem ve svém životê potkal, jsi ty ten naprosto nejhorší. Jsi hanbou našeho âádu.
		};

	AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_04"); //Mêl bych tê na místê zabít.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_05"); //Zadrž. Prosím. Oèarovali mê. Nikdy bych nezradil klášter o své vlastní vùli.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_06"); //Ani netušíš, èím vším jsem musel bêhem posledních nêkolika dní projít. Dali mi do hlavy ten hlas. Nemohl jsem se tomu ubránit.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_07"); //Skâetí plukovník mê celé dny vyslýchal. Poâád mê bil. Ušetâi mê Jsem nevinný. Musíš mi vêâit.
	
	Info_ClearChoices	(DIA_Pedro_DI_YOU);
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Tak mi âekni, co víš.", DIA_Pedro_DI_YOU_verschon );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Vùbec nic nemusím. Na místê tê zabiju.", DIA_Pedro_DI_YOU_tot );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Ukaž mi jediný dùvod, proè bych ti mêl vêâit.", DIA_Pedro_DI_YOU_grund );
	if (MIS_Gorax_KillPedro == LOG_RUNNING)
	{
		Info_AddChoice	(DIA_Pedro_DI_YOU, "Serpentes mi pâikázal, abych tê zabil.", DIA_Pedro_DI_YOU_Serpentes );
	};
};

func void DIA_Pedro_DI_YOU_grund ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_grund_15_00"); //Ukaž mi jediný dùvod, proè bych ti mêl vêâit.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_grund_09_01"); //(úpênlivê) Nech mê žít. Mùžu ti dát informaci, s jejíž pomocí se odsud dostaneš. Musíš mê vyslechnout.

};
var int PedroDI_Flee;
func void DIA_Pedro_DI_YOU_tot ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_tot_15_00"); //Vùbec nic nemusím. Na místê tê zabiju.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_tot_09_01"); //U všech bohù...

	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"Ship");
	B_Attack (self, other, AR_NONE, 1);
	PedroDI_Flee = LOG_RUNNING;
};

func void DIA_Pedro_DI_YOU_Serpentes ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_Serpentes_15_00"); //Serpentes mi dal rozkaz, abych tê zabil. Už jenom z principu udêlám to, co mi bylo âeèeno.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_Serpentes_09_01"); //(úpênlivê) Prosím, ne. To nemùžeš udêlat. Mùžu ti být k užitku. Nejednej ukvapenê.

	B_GivePlayerXP (XP_Pedro_SerpentesMission);
	MIS_Gorax_KillPedro = LOG_SUCCESS;	//Joly: bei erfolgreicher Mission in folgenden Dialogen muss heißen; if ((Npc_IsDead(PedroDI)) && (MIS_Gorax_KillPedro == LOG_SUCCESS))

};

func void DIA_Pedro_DI_YOU_verschon ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_verschon_15_00"); //Tak mi âekni, co víš.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_verschon_09_01"); //(uklidnênê) Ano, samozâejmê. Âeknu ti všechno, co budeš chtít. Pod jednou podmínkou. Musíš mê dostat z tohoto prokletého ostrova, souhlasíš?
	
	Info_ClearChoices	(DIA_Pedro_DI_YOU);
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Vùbec nic nemusím. Na místê tê zabiju.", DIA_Pedro_DI_YOU_tot );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "No dobâe. Pojë se mnou, vezmu tê na svou loë.", DIA_Pedro_DI_YOU_FollowShip );

};

var int MIS_Pedro_DI_FollowShip;
func void DIA_Pedro_DI_YOU_FollowShip ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_FollowShip_15_00"); //Dobrá. Pojë za mnou, odvedu tê na loë.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_FollowShip_09_01"); //Máš mé díky. Nebudeš toho litovat.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"FollowShip");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_Pedro_DI_FollowShip = LOG_RUNNING;

};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedAtShip
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_ArrivedAtShip		(C_INFO)
{
	npc		 = 	NOV_600_Pedro_DI;
	nr		 = 	4;
	condition	 = 	DIA_Pedro_DI_ArrivedAtShip_Condition;
	information	 = 	DIA_Pedro_DI_ArrivedAtShip_Info;

	description	= "Tak jsme tady!";	
};

func int DIA_Pedro_DI_ArrivedAtShip_Condition ()
{
	if (Npc_GetDistToWP(self,"SHIP")<6000) 
	&& (MIS_Pedro_DI_FollowShip == LOG_RUNNING)
		{
				return TRUE;
		};
};

func void DIA_Pedro_DI_ArrivedAtShip_Info ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_15_00"); //Tak jsme tady!
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_01"); //Máš opravdu pùsobivou loë. Jsi opravdu vynikající vùdce.
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_15_02"); //Pâestaà blábolit. Âekni mi koneènê to, co chci vêdêt.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_03"); //Ech, samozâejmê. Kde bych mêl zaèít?
	
	Info_ClearChoices	(DIA_Pedro_DI_ArrivedAtShip);
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Už jsem slyšel dost.", DIA_Pedro_DI_ArrivedAtShip_Back );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Jak je možné se dostat dovnitâ ostrova?", DIA_Pedro_DI_ArrivedAtShip_Innere );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Jaké pâíšery se pohybují po tomto ostrovê?", DIA_Pedro_DI_ArrivedAtShip_Monster );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Co bylo s tím skâetím plukovníkem?", DIA_Pedro_DI_ArrivedAtShip_OrkOberst );


};
func void DIA_Pedro_DI_ArrivedAtShip_OrkOberst ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_15_00"); //Co bylo s tím skâetím plukovníkem?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_01"); //Znièil mou poslední jiskâièku nadêje, že ještê nêkdy spatâím svou domovinu.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_02"); //Od chvíle, co jsem sem pâišel, mê vyslýchal ohlednê strategického rozmístêní paladinù v Khorinidu.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_03"); //Samozâejmê že jsem mu o tom mnoho neâekl. Jak bych také mohl, sakra? Vždyã jsem u ohnivých jenom novic.
	
	if ((Npc_IsDead(OrkElite_AntiPaladinOrkOberst_DI)))
	{
		Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Skâetí plukovník je mrtvý.", DIA_Pedro_DI_ArrivedAtShip_OberstTot );
	};
};

func void DIA_Pedro_DI_ArrivedAtShip_Monster ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Monster_15_00"); //Jaké pâíšery se pohybují po tomto ostrovê?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_01"); //Bêhem dne mùžeš èasto vidêt, jak k pobâeží míâí ještêâi. Obvykle nesou nêjaká ohromná vejce.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_02"); //Moc jsem toho ve své cele nepochytil, ale myslím, že se chystají opustit ostrov.
};

func void DIA_Pedro_DI_ArrivedAtShip_Innere ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Innere_15_00"); //Jak je možné dostat se dovnitâ ostrova?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_01"); //V trùnním sálu skâetího plukovníka je tajná chodba.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_02"); //Vlekli mê tam pokaždé, když mê chtêl vyslýchat. Vidêl jsem, že tam je.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_03"); //Jeden ze šamanù spustil mechanismus tak, že zatáhnul za jednu z pochodní pâipevnêných na zdi v chodbê.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_04"); //Hmm. Myslím, že nejprve zatáhl za pochodeà nalevo a pak napravo, ale možná si to nepamatuju úplnê pâesnê.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_05"); //V zadní èásti se náhle otevâel prùchod, který vedl hluboko do hory.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_06"); //Bohužel nevím, kde ta chodba konèí.

};

func void DIA_Pedro_DI_ArrivedAtShip_OberstTot ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_15_00"); //Skâetí plukovník je mrtvý.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_09_01"); //Mrtvý? Innos budiž pochválen. Na ten jeho pâíšerný oblièej nikdy nezapomenu.

};

func void DIA_Pedro_DI_ArrivedAtShip_Back ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Back_15_00"); //Už jsem slyšel dost. Bêž si najít místo na mé lodi. Ještê poâád mám dost práce.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Back_09_01"); //Nechã tê Innosova síla provází. Budu se za tebe modlit.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Ship");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};


///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_PERM		(C_INFO)
{
	npc		 = 	NOV_600_Pedro_DI;
	nr		 = 	5;
	condition	 = 	DIA_Pedro_DI_PERM_Condition;
	information	 = 	DIA_Pedro_DI_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Unavený?";
};
var int PedroDI_TalkNomore;
func int DIA_Pedro_DI_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pedro_DI_YOU))
	&& (PedroDI_TalkNomore == FALSE)
		{
				return TRUE;
		};
};
func void DIA_Pedro_DI_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_00"); //Unavený?

	if (Npc_GetDistToWP(self,"SHIP_DECK_05")<1000) 
	{	
		if (PedroDI_Flee == LOG_RUNNING)
		{
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_01"); //Chtêl bys snad, abych ti pâinesl polštáâ?
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_02"); //Nech mê být, prosím. Potichu si tady sednu a ani nepípnu.
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_03"); //Hmm.
			B_GivePlayerXP (XP_Ambient);
			PedroDI_Flee = LOG_SUCCESS;
		}
		else if (Npc_IsDead(Dragon_Undead))
		{
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_04"); //Jsem úplnê odrovnaný.
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_05"); //Sbal si svých pêt švestek. Brzy zase vyrazíme na moâe.
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_06"); //Díky, chlape. Už jsem si myslel, že se svalím z lavice rovnou na zem. Dobrou noc.
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,"SleepShip");
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			PedroDI_TalkNomore = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_07"); //To je v poâádku. Díky.
			AI_StopProcessInfos (self);
		};
	}
	else
	{
		AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_08"); //Prosím. Nech mê žít!
		AI_StopProcessInfos (self);
	};
};

