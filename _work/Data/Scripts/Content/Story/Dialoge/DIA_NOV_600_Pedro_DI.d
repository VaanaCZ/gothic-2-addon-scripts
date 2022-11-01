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
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_00"); //Zrádce! Tak jsem tě konečně našel.

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_01"); //Nemysli si, že se nad tebou slituji jen proto, že jsem jedním z paladinů.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_02"); //Mnoho z nás, žoldnéřů, zaprodalo duši Beliarovi, a přesto mi často nečiní dobře pomyšlení na to, že je bez milosti zabíjíme. Ale u tebe, ty prašivá svině, udělám výjimku!
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_03"); //Ze všech těch bezpáteřních parchantů, které jsem ve svém životě potkal, jsi ty ten naprosto nejhorší. Jsi hanbou našeho řádu.
		};

	AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_04"); //Měl bych tě na místě zabít.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_05"); //Zadrž. Prosím. Očarovali mě. Nikdy bych nezradil klášter o své vlastní vůli.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_06"); //Ani netušíš, čím vším jsem musel během posledních několika dní projít. Dali mi do hlavy ten hlas. Nemohl jsem se tomu ubránit.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_07"); //Skřetí plukovník mě celé dny vyslýchal. Pořád mě bil. Ušetři mě Jsem nevinný. Musíš mi věřit.
	
	Info_ClearChoices	(DIA_Pedro_DI_YOU);
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Tak mi řekni, co víš.", DIA_Pedro_DI_YOU_verschon );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Vůbec nic nemusím. Na místě tě zabiju.", DIA_Pedro_DI_YOU_tot );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Ukaž mi jediný důvod, proč bych ti měl věřit.", DIA_Pedro_DI_YOU_grund );
	if (MIS_Gorax_KillPedro == LOG_RUNNING)
	{
		Info_AddChoice	(DIA_Pedro_DI_YOU, "Serpentes mi přikázal, abych tě zabil.", DIA_Pedro_DI_YOU_Serpentes );
	};
};

func void DIA_Pedro_DI_YOU_grund ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_grund_15_00"); //Ukaž mi jediný důvod, proč bych ti měl věřit.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_grund_09_01"); //(úpěnlivě) Nech mě žít. Můžu ti dát informaci, s jejíž pomocí se odsud dostaneš. Musíš mě vyslechnout.

};
var int PedroDI_Flee;
func void DIA_Pedro_DI_YOU_tot ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_tot_15_00"); //Vůbec nic nemusím. Na místě tě zabiju.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_tot_09_01"); //U všech bohů...

	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"Ship");
	B_Attack (self, other, AR_NONE, 1);
	PedroDI_Flee = LOG_RUNNING;
};

func void DIA_Pedro_DI_YOU_Serpentes ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_Serpentes_15_00"); //Serpentes mi dal rozkaz, abych tě zabil. Už jenom z principu udělám to, co mi bylo řečeno.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_Serpentes_09_01"); //(úpěnlivě) Prosím, ne. To nemůžeš udělat. Můžu ti být k užitku. Nejednej ukvapeně.

	B_GivePlayerXP (XP_Pedro_SerpentesMission);
	MIS_Gorax_KillPedro = LOG_SUCCESS;	//Joly: bei erfolgreicher Mission in folgenden Dialogen muss heißen; if ((Npc_IsDead(PedroDI)) && (MIS_Gorax_KillPedro == LOG_SUCCESS))

};

func void DIA_Pedro_DI_YOU_verschon ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_verschon_15_00"); //Tak mi řekni, co víš.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_verschon_09_01"); //(uklidněně) Ano, samozřejmě. Řeknu ti všechno, co budeš chtít. Pod jednou podmínkou. Musíš mě dostat z tohoto prokletého ostrova, souhlasíš?
	
	Info_ClearChoices	(DIA_Pedro_DI_YOU);
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Vůbec nic nemusím. Na místě tě zabiju.", DIA_Pedro_DI_YOU_tot );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "No dobře. Pojď se mnou, vezmu tě na svou loď.", DIA_Pedro_DI_YOU_FollowShip );

};

var int MIS_Pedro_DI_FollowShip;
func void DIA_Pedro_DI_YOU_FollowShip ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_FollowShip_15_00"); //Dobrá. Pojď za mnou, odvedu tě na loď.
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
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_01"); //Máš opravdu působivou loď. Jsi opravdu vynikající vůdce.
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_15_02"); //Přestaň blábolit. Řekni mi konečně to, co chci vědět.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_03"); //Ech, samozřejmě. Kde bych měl začít?
	
	Info_ClearChoices	(DIA_Pedro_DI_ArrivedAtShip);
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Už jsem slyšel dost.", DIA_Pedro_DI_ArrivedAtShip_Back );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Jak je možné se dostat dovnitř ostrova?", DIA_Pedro_DI_ArrivedAtShip_Innere );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Jaké příšery se pohybují po tomto ostrově?", DIA_Pedro_DI_ArrivedAtShip_Monster );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Co bylo s tím skřetím plukovníkem?", DIA_Pedro_DI_ArrivedAtShip_OrkOberst );


};
func void DIA_Pedro_DI_ArrivedAtShip_OrkOberst ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_15_00"); //Co bylo s tím skřetím plukovníkem?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_01"); //Zničil mou poslední jiskřičku naděje, že ještě někdy spatřím svou domovinu.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_02"); //Od chvíle, co jsem sem přišel, mě vyslýchal ohledně strategického rozmístění paladinů v Khorinidu.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_03"); //Samozřejmě že jsem mu o tom mnoho neřekl. Jak bych také mohl, sakra? Vždyť jsem u ohnivých jenom novic.
	
	if ((Npc_IsDead(OrkElite_AntiPaladinOrkOberst_DI)))
	{
		Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Skřetí plukovník je mrtvý.", DIA_Pedro_DI_ArrivedAtShip_OberstTot );
	};
};

func void DIA_Pedro_DI_ArrivedAtShip_Monster ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Monster_15_00"); //Jaké příšery se pohybují po tomto ostrově?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_01"); //Během dne můžeš často vidět, jak k pobřeží míří ještěři. Obvykle nesou nějaká ohromná vejce.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_02"); //Moc jsem toho ve své cele nepochytil, ale myslím, že se chystají opustit ostrov.
};

func void DIA_Pedro_DI_ArrivedAtShip_Innere ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Innere_15_00"); //Jak je možné dostat se dovnitř ostrova?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_01"); //V trůnním sálu skřetího plukovníka je tajná chodba.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_02"); //Vlekli mě tam pokaždé, když mě chtěl vyslýchat. Viděl jsem, že tam je.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_03"); //Jeden ze šamanů spustil mechanismus tak, že zatáhnul za jednu z pochodní připevněných na zdi v chodbě.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_04"); //Hmm. Myslím, že nejprve zatáhl za pochodeň nalevo a pak napravo, ale možná si to nepamatuju úplně přesně.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_05"); //V zadní části se náhle otevřel průchod, který vedl hluboko do hory.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_06"); //Bohužel nevím, kde ta chodba končí.

};

func void DIA_Pedro_DI_ArrivedAtShip_OberstTot ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_15_00"); //Skřetí plukovník je mrtvý.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_09_01"); //Mrtvý? Innos budiž pochválen. Na ten jeho příšerný obličej nikdy nezapomenu.

};

func void DIA_Pedro_DI_ArrivedAtShip_Back ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Back_15_00"); //Už jsem slyšel dost. Běž si najít místo na mé lodi. Ještě pořád mám dost práce.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Back_09_01"); //Nechť tě Innosova síla provází. Budu se za tebe modlit.
	
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
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_01"); //Chtěl bys snad, abych ti přinesl polštář?
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_02"); //Nech mě být, prosím. Potichu si tady sednu a ani nepípnu.
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_03"); //Hmm.
			B_GivePlayerXP (XP_Ambient);
			PedroDI_Flee = LOG_SUCCESS;
		}
		else if (Npc_IsDead(Dragon_Undead))
		{
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_04"); //Jsem úplně odrovnaný.
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_05"); //Sbal si svých pět švestek. Brzy zase vyrazíme na moře.
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_06"); //Díky, chlape. Už jsem si myslel, že se svalím z lavice rovnou na zem. Dobrou noc.
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,"SleepShip");
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			PedroDI_TalkNomore = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_07"); //To je v pořádku. Díky.
			AI_StopProcessInfos (self);
		};
	}
	else
	{
		AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_08"); //Prosím. Nech mě žít!
		AI_StopProcessInfos (self);
	};
};

