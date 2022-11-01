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
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_00"); //Zrádce! Tak jsem tę konečnę našel.

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_01"); //Nemysli si, že se nad tebou slituji jen proto, že jsem jedním z paladinů.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_02"); //Mnoho z nás, žoldnéâů, zaprodalo duši Beliarovi, a pâesto mi často nečiní dobâe pomyšlení na to, že je bez milosti zabíjíme. Ale u tebe, ty prašivá svinę, udęlám výjimku!
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_03"); //Ze všech tęch bezpáteâních parchantů, které jsem ve svém životę potkal, jsi ty ten naprosto nejhorší. Jsi hanbou našeho âádu.
		};

	AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_04"); //Męl bych tę na místę zabít.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_05"); //Zadrž. Prosím. Očarovali mę. Nikdy bych nezradil klášter o své vlastní vůli.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_06"); //Ani netušíš, čím vším jsem musel bęhem posledních nękolika dní projít. Dali mi do hlavy ten hlas. Nemohl jsem se tomu ubránit.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_07"); //Skâetí plukovník mę celé dny vyslýchal. Poâád mę bil. Ušetâi mę Jsem nevinný. Musíš mi vęâit.
	
	Info_ClearChoices	(DIA_Pedro_DI_YOU);
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Tak mi âekni, co víš.", DIA_Pedro_DI_YOU_verschon );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Vůbec nic nemusím. Na místę tę zabiju.", DIA_Pedro_DI_YOU_tot );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Ukaž mi jediný důvod, proč bych ti męl vęâit.", DIA_Pedro_DI_YOU_grund );
	if (MIS_Gorax_KillPedro == LOG_RUNNING)
	{
		Info_AddChoice	(DIA_Pedro_DI_YOU, "Serpentes mi pâikázal, abych tę zabil.", DIA_Pedro_DI_YOU_Serpentes );
	};
};

func void DIA_Pedro_DI_YOU_grund ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_grund_15_00"); //Ukaž mi jediný důvod, proč bych ti męl vęâit.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_grund_09_01"); //(úpęnlivę) Nech mę žít. Můžu ti dát informaci, s jejíž pomocí se odsud dostaneš. Musíš mę vyslechnout.

};
var int PedroDI_Flee;
func void DIA_Pedro_DI_YOU_tot ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_tot_15_00"); //Vůbec nic nemusím. Na místę tę zabiju.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_tot_09_01"); //U všech bohů...

	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"Ship");
	B_Attack (self, other, AR_NONE, 1);
	PedroDI_Flee = LOG_RUNNING;
};

func void DIA_Pedro_DI_YOU_Serpentes ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_Serpentes_15_00"); //Serpentes mi dal rozkaz, abych tę zabil. Už jenom z principu udęlám to, co mi bylo âečeno.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_Serpentes_09_01"); //(úpęnlivę) Prosím, ne. To nemůžeš udęlat. Můžu ti být k užitku. Nejednej ukvapenę.

	B_GivePlayerXP (XP_Pedro_SerpentesMission);
	MIS_Gorax_KillPedro = LOG_SUCCESS;	//Joly: bei erfolgreicher Mission in folgenden Dialogen muss heißen; if ((Npc_IsDead(PedroDI)) && (MIS_Gorax_KillPedro == LOG_SUCCESS))

};

func void DIA_Pedro_DI_YOU_verschon ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_verschon_15_00"); //Tak mi âekni, co víš.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_verschon_09_01"); //(uklidnęnę) Ano, samozâejmę. Âeknu ti všechno, co budeš chtít. Pod jednou podmínkou. Musíš mę dostat z tohoto prokletého ostrova, souhlasíš?
	
	Info_ClearChoices	(DIA_Pedro_DI_YOU);
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Vůbec nic nemusím. Na místę tę zabiju.", DIA_Pedro_DI_YOU_tot );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "No dobâe. Pojë se mnou, vezmu tę na svou loë.", DIA_Pedro_DI_YOU_FollowShip );

};

var int MIS_Pedro_DI_FollowShip;
func void DIA_Pedro_DI_YOU_FollowShip ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_FollowShip_15_00"); //Dobrá. Pojë za mnou, odvedu tę na loë.
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
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_01"); //Máš opravdu působivou loë. Jsi opravdu vynikající vůdce.
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_15_02"); //Pâestaŕ blábolit. Âekni mi konečnę to, co chci vędęt.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_03"); //Ech, samozâejmę. Kde bych męl začít?
	
	Info_ClearChoices	(DIA_Pedro_DI_ArrivedAtShip);
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Už jsem slyšel dost.", DIA_Pedro_DI_ArrivedAtShip_Back );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Jak je možné se dostat dovnitâ ostrova?", DIA_Pedro_DI_ArrivedAtShip_Innere );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Jaké pâíšery se pohybují po tomto ostrovę?", DIA_Pedro_DI_ArrivedAtShip_Monster );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Co bylo s tím skâetím plukovníkem?", DIA_Pedro_DI_ArrivedAtShip_OrkOberst );


};
func void DIA_Pedro_DI_ArrivedAtShip_OrkOberst ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_15_00"); //Co bylo s tím skâetím plukovníkem?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_01"); //Zničil mou poslední jiskâičku nadęje, že ještę nękdy spatâím svou domovinu.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_02"); //Od chvíle, co jsem sem pâišel, mę vyslýchal ohlednę strategického rozmístęní paladinů v Khorinidu.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_03"); //Samozâejmę že jsem mu o tom mnoho neâekl. Jak bych také mohl, sakra? Vždyă jsem u ohnivých jenom novic.
	
	if ((Npc_IsDead(OrkElite_AntiPaladinOrkOberst_DI)))
	{
		Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Skâetí plukovník je mrtvý.", DIA_Pedro_DI_ArrivedAtShip_OberstTot );
	};
};

func void DIA_Pedro_DI_ArrivedAtShip_Monster ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Monster_15_00"); //Jaké pâíšery se pohybují po tomto ostrovę?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_01"); //Bęhem dne můžeš často vidęt, jak k pobâeží míâí ještęâi. Obvykle nesou nęjaká ohromná vejce.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_02"); //Moc jsem toho ve své cele nepochytil, ale myslím, že se chystají opustit ostrov.
};

func void DIA_Pedro_DI_ArrivedAtShip_Innere ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Innere_15_00"); //Jak je možné dostat se dovnitâ ostrova?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_01"); //V trůnním sálu skâetího plukovníka je tajná chodba.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_02"); //Vlekli mę tam pokaždé, když mę chtęl vyslýchat. Vidęl jsem, že tam je.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_03"); //Jeden ze šamanů spustil mechanismus tak, že zatáhnul za jednu z pochodní pâipevnęných na zdi v chodbę.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_04"); //Hmm. Myslím, že nejprve zatáhl za pochodeŕ nalevo a pak napravo, ale možná si to nepamatuju úplnę pâesnę.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_05"); //V zadní části se náhle otevâel průchod, který vedl hluboko do hory.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_06"); //Bohužel nevím, kde ta chodba končí.

};

func void DIA_Pedro_DI_ArrivedAtShip_OberstTot ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_15_00"); //Skâetí plukovník je mrtvý.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_09_01"); //Mrtvý? Innos budiž pochválen. Na ten jeho pâíšerný obličej nikdy nezapomenu.

};

func void DIA_Pedro_DI_ArrivedAtShip_Back ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Back_15_00"); //Už jsem slyšel dost. Bęž si najít místo na mé lodi. Ještę poâád mám dost práce.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Back_09_01"); //Nechă tę Innosova síla provází. Budu se za tebe modlit.
	
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
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_01"); //Chtęl bys snad, abych ti pâinesl polštáâ?
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_02"); //Nech mę být, prosím. Potichu si tady sednu a ani nepípnu.
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_03"); //Hmm.
			B_GivePlayerXP (XP_Ambient);
			PedroDI_Flee = LOG_SUCCESS;
		}
		else if (Npc_IsDead(Dragon_Undead))
		{
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_04"); //Jsem úplnę odrovnaný.
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_05"); //Sbal si svých pęt švestek. Brzy zase vyrazíme na moâe.
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
		AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_08"); //Prosím. Nech mę žít!
		AI_StopProcessInfos (self);
	};
};

