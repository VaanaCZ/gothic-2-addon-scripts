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
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_00"); //Zrádce! Tak jsem tì koneènì našel.

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_01"); //Nemysli si, že se nad tebou slituji jen proto, že jsem jedním z paladinù.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_02"); //Mnoho z nás, žoldnéøù, zaprodalo duši Beliarovi, a pøesto mi èasto neèiní dobøe pomyšlení na to, že je bez milosti zabíjíme. Ale u tebe, ty prašivá svinì, udìlám výjimku!
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_03"); //Ze všech tìch bezpáteøních parchantù, které jsem ve svém životì potkal, jsi ty ten naprosto nejhorší. Jsi hanbou našeho øádu.
		};

	AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_04"); //Mìl bych tì na místì zabít.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_05"); //Zadrž. Prosím. Oèarovali mì. Nikdy bych nezradil klášter o své vlastní vùli.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_06"); //Ani netušíš, èím vším jsem musel bìhem posledních nìkolika dní projít. Dali mi do hlavy ten hlas. Nemohl jsem se tomu ubránit.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_07"); //Skøetí plukovník mì celé dny vyslýchal. Poøád mì bil. Ušetøi mì Jsem nevinný. Musíš mi vìøit.
	
	Info_ClearChoices	(DIA_Pedro_DI_YOU);
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Tak mi øekni, co víš.", DIA_Pedro_DI_YOU_verschon );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Vùbec nic nemusím. Na místì tì zabiju.", DIA_Pedro_DI_YOU_tot );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Ukaž mi jediný dùvod, proè bych ti mìl vìøit.", DIA_Pedro_DI_YOU_grund );
	if (MIS_Gorax_KillPedro == LOG_RUNNING)
	{
		Info_AddChoice	(DIA_Pedro_DI_YOU, "Serpentes mi pøikázal, abych tì zabil.", DIA_Pedro_DI_YOU_Serpentes );
	};
};

func void DIA_Pedro_DI_YOU_grund ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_grund_15_00"); //Ukaž mi jediný dùvod, proè bych ti mìl vìøit.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_grund_09_01"); //(úpìnlivì) Nech mì žít. Mùžu ti dát informaci, s jejíž pomocí se odsud dostaneš. Musíš mì vyslechnout.

};
var int PedroDI_Flee;
func void DIA_Pedro_DI_YOU_tot ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_tot_15_00"); //Vùbec nic nemusím. Na místì tì zabiju.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_tot_09_01"); //U všech bohù...

	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"Ship");
	B_Attack (self, other, AR_NONE, 1);
	PedroDI_Flee = LOG_RUNNING;
};

func void DIA_Pedro_DI_YOU_Serpentes ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_Serpentes_15_00"); //Serpentes mi dal rozkaz, abych tì zabil. Už jenom z principu udìlám to, co mi bylo øeèeno.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_Serpentes_09_01"); //(úpìnlivì) Prosím, ne. To nemùžeš udìlat. Mùžu ti být k užitku. Nejednej ukvapenì.

	B_GivePlayerXP (XP_Pedro_SerpentesMission);
	MIS_Gorax_KillPedro = LOG_SUCCESS;	//Joly: bei erfolgreicher Mission in folgenden Dialogen muss heißen; if ((Npc_IsDead(PedroDI)) && (MIS_Gorax_KillPedro == LOG_SUCCESS))

};

func void DIA_Pedro_DI_YOU_verschon ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_verschon_15_00"); //Tak mi øekni, co víš.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_verschon_09_01"); //(uklidnìnì) Ano, samozøejmì. Øeknu ti všechno, co budeš chtít. Pod jednou podmínkou. Musíš mì dostat z tohoto prokletého ostrova, souhlasíš?
	
	Info_ClearChoices	(DIA_Pedro_DI_YOU);
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Vùbec nic nemusím. Na místì tì zabiju.", DIA_Pedro_DI_YOU_tot );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "No dobøe. Pojï se mnou, vezmu tì na svou loï.", DIA_Pedro_DI_YOU_FollowShip );

};

var int MIS_Pedro_DI_FollowShip;
func void DIA_Pedro_DI_YOU_FollowShip ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_FollowShip_15_00"); //Dobrá. Pojï za mnou, odvedu tì na loï.
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
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_01"); //Máš opravdu pùsobivou loï. Jsi opravdu vynikající vùdce.
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_15_02"); //Pøestaò blábolit. Øekni mi koneènì to, co chci vìdìt.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_03"); //Ech, samozøejmì. Kde bych mìl zaèít?
	
	Info_ClearChoices	(DIA_Pedro_DI_ArrivedAtShip);
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Už jsem slyšel dost.", DIA_Pedro_DI_ArrivedAtShip_Back );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Jak je možné se dostat dovnitø ostrova?", DIA_Pedro_DI_ArrivedAtShip_Innere );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Jaké pøíšery se pohybují po tomto ostrovì?", DIA_Pedro_DI_ArrivedAtShip_Monster );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Co bylo s tím skøetím plukovníkem?", DIA_Pedro_DI_ArrivedAtShip_OrkOberst );


};
func void DIA_Pedro_DI_ArrivedAtShip_OrkOberst ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_15_00"); //Co bylo s tím skøetím plukovníkem?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_01"); //Znièil mou poslední jiskøièku nadìje, že ještì nìkdy spatøím svou domovinu.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_02"); //Od chvíle, co jsem sem pøišel, mì vyslýchal ohlednì strategického rozmístìní paladinù v Khorinidu.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_03"); //Samozøejmì že jsem mu o tom mnoho neøekl. Jak bych také mohl, sakra? Vždy jsem u ohnivých jenom novic.
	
	if ((Npc_IsDead(OrkElite_AntiPaladinOrkOberst_DI)))
	{
		Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Skøetí plukovník je mrtvý.", DIA_Pedro_DI_ArrivedAtShip_OberstTot );
	};
};

func void DIA_Pedro_DI_ArrivedAtShip_Monster ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Monster_15_00"); //Jaké pøíšery se pohybují po tomto ostrovì?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_01"); //Bìhem dne mùžeš èasto vidìt, jak k pobøeží míøí ještìøi. Obvykle nesou nìjaká ohromná vejce.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_02"); //Moc jsem toho ve své cele nepochytil, ale myslím, že se chystají opustit ostrov.
};

func void DIA_Pedro_DI_ArrivedAtShip_Innere ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Innere_15_00"); //Jak je možné dostat se dovnitø ostrova?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_01"); //V trùnním sálu skøetího plukovníka je tajná chodba.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_02"); //Vlekli mì tam pokaždé, když mì chtìl vyslýchat. Vidìl jsem, že tam je.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_03"); //Jeden ze šamanù spustil mechanismus tak, že zatáhnul za jednu z pochodní pøipevnìných na zdi v chodbì.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_04"); //Hmm. Myslím, že nejprve zatáhl za pochodeò nalevo a pak napravo, ale možná si to nepamatuju úplnì pøesnì.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_05"); //V zadní èásti se náhle otevøel prùchod, který vedl hluboko do hory.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_06"); //Bohužel nevím, kde ta chodba konèí.

};

func void DIA_Pedro_DI_ArrivedAtShip_OberstTot ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_15_00"); //Skøetí plukovník je mrtvý.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_09_01"); //Mrtvý? Innos budiž pochválen. Na ten jeho pøíšerný oblièej nikdy nezapomenu.

};

func void DIA_Pedro_DI_ArrivedAtShip_Back ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Back_15_00"); //Už jsem slyšel dost. Bìž si najít místo na mé lodi. Ještì poøád mám dost práce.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Back_09_01"); //Nech tì Innosova síla provází. Budu se za tebe modlit.
	
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
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_01"); //Chtìl bys snad, abych ti pøinesl polštáø?
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_02"); //Nech mì být, prosím. Potichu si tady sednu a ani nepípnu.
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_03"); //Hmm.
			B_GivePlayerXP (XP_Ambient);
			PedroDI_Flee = LOG_SUCCESS;
		}
		else if (Npc_IsDead(Dragon_Undead))
		{
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_04"); //Jsem úplnì odrovnaný.
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_05"); //Sbal si svých pìt švestek. Brzy zase vyrazíme na moøe.
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_06"); //Díky, chlape. Už jsem si myslel, že se svalím z lavice rovnou na zem. Dobrou noc.
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,"SleepShip");
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			PedroDI_TalkNomore = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_07"); //To je v poøádku. Díky.
			AI_StopProcessInfos (self);
		};
	}
	else
	{
		AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_08"); //Prosím. Nech mì žít!
		AI_StopProcessInfos (self);
	};
};

