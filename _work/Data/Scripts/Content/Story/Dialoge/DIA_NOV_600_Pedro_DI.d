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
//	Info Verr�ter
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_YOU		(C_INFO)
{
	npc			 = 	NOV_600_Pedro_DI;
	nr			 = 	2;
	condition	 = 	DIA_Pedro_DI_YOU_Condition;
	information	 = 	DIA_Pedro_DI_YOU_Info;
	
	description	 = 	"Zr�dce!";
	
};
func int DIA_Pedro_DI_YOU_Condition ()
{	
	return TRUE;
};

func void DIA_Pedro_DI_YOU_Info ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_00"); //Zr�dce! Tak jsem t� kone�n� na�el.

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_01"); //Nemysli si, �e se nad tebou slituji jen proto, �e jsem jedn�m z paladin�.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_02"); //Mnoho z n�s, �oldn���, zaprodalo du�i Beliarovi, a p�esto mi �asto ne�in� dob�e pomy�len� na to, �e je bez milosti zab�j�me. Ale u tebe, ty pra�iv� svin�, ud�l�m v�jimku!
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_03"); //Ze v�ech t�ch bezp�te�n�ch parchant�, kter� jsem ve sv�m �ivot� potkal, jsi ty ten naprosto nejhor��. Jsi hanbou na�eho ��du.
		};

	AI_Output			(other, self, "DIA_Pedro_DI_YOU_15_04"); //M�l bych t� na m�st� zab�t.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_05"); //Zadr�. Pros�m. O�arovali m�. Nikdy bych nezradil kl�ter o sv� vlastn� v�li.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_06"); //Ani netu��, ��m v��m jsem musel b�hem posledn�ch n�kolika dn� proj�t. Dali mi do hlavy ten hlas. Nemohl jsem se tomu ubr�nit.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_09_07"); //Sk�et� plukovn�k m� cel� dny vysl�chal. Po��d m� bil. U�et�i m� Jsem nevinn�. Mus� mi v��it.
	
	Info_ClearChoices	(DIA_Pedro_DI_YOU);
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Tak mi �ekni, co v�.", DIA_Pedro_DI_YOU_verschon );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "V�bec nic nemus�m. Na m�st� t� zabiju.", DIA_Pedro_DI_YOU_tot );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "Uka� mi jedin� d�vod, pro� bych ti m�l v��it.", DIA_Pedro_DI_YOU_grund );
	if (MIS_Gorax_KillPedro == LOG_RUNNING)
	{
		Info_AddChoice	(DIA_Pedro_DI_YOU, "Serpentes mi p�ik�zal, abych t� zabil.", DIA_Pedro_DI_YOU_Serpentes );
	};
};

func void DIA_Pedro_DI_YOU_grund ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_grund_15_00"); //Uka� mi jedin� d�vod, pro� bych ti m�l v��it.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_grund_09_01"); //(�p�nliv�) Nech m� ��t. M��u ti d�t informaci, s jej� pomoc� se odsud dostane�. Mus� m� vyslechnout.

};
var int PedroDI_Flee;
func void DIA_Pedro_DI_YOU_tot ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_tot_15_00"); //V�bec nic nemus�m. Na m�st� t� zabiju.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_tot_09_01"); //U v�ech boh�...

	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"Ship");
	B_Attack (self, other, AR_NONE, 1);
	PedroDI_Flee = LOG_RUNNING;
};

func void DIA_Pedro_DI_YOU_Serpentes ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_Serpentes_15_00"); //Serpentes mi dal rozkaz, abych t� zabil. U� jenom z principu ud�l�m to, co mi bylo �e�eno.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_Serpentes_09_01"); //(�p�nliv�) Pros�m, ne. To nem��e� ud�lat. M��u ti b�t k u�itku. Nejednej ukvapen�.

	B_GivePlayerXP (XP_Pedro_SerpentesMission);
	MIS_Gorax_KillPedro = LOG_SUCCESS;	//Joly: bei erfolgreicher Mission in folgenden Dialogen muss hei�en; if ((Npc_IsDead(PedroDI)) && (MIS_Gorax_KillPedro == LOG_SUCCESS))

};

func void DIA_Pedro_DI_YOU_verschon ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_verschon_15_00"); //Tak mi �ekni, co v�.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_verschon_09_01"); //(uklidn�n�) Ano, samoz�ejm�. �eknu ti v�echno, co bude� cht�t. Pod jednou podm�nkou. Mus� m� dostat z tohoto proklet�ho ostrova, souhlas�?
	
	Info_ClearChoices	(DIA_Pedro_DI_YOU);
	Info_AddChoice	(DIA_Pedro_DI_YOU, "V�bec nic nemus�m. Na m�st� t� zabiju.", DIA_Pedro_DI_YOU_tot );
	Info_AddChoice	(DIA_Pedro_DI_YOU, "No dob�e. Poj� se mnou, vezmu t� na svou lo�.", DIA_Pedro_DI_YOU_FollowShip );

};

var int MIS_Pedro_DI_FollowShip;
func void DIA_Pedro_DI_YOU_FollowShip ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_YOU_FollowShip_15_00"); //Dobr�. Poj� za mnou, odvedu t� na lo�.
	AI_Output			(self, other, "DIA_Pedro_DI_YOU_FollowShip_09_01"); //M� m� d�ky. Nebude� toho litovat.
	
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
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_01"); //M� opravdu p�sobivou lo�. Jsi opravdu vynikaj�c� v�dce.
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_15_02"); //P�esta� bl�bolit. �ekni mi kone�n� to, co chci v�d�t.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_03"); //Ech, samoz�ejm�. Kde bych m�l za��t?
	
	Info_ClearChoices	(DIA_Pedro_DI_ArrivedAtShip);
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "U� jsem sly�el dost.", DIA_Pedro_DI_ArrivedAtShip_Back );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Jak je mo�n� se dostat dovnit� ostrova?", DIA_Pedro_DI_ArrivedAtShip_Innere );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Jak� p��ery se pohybuj� po tomto ostrov�?", DIA_Pedro_DI_ArrivedAtShip_Monster );
	Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Co bylo s t�m sk�et�m plukovn�kem?", DIA_Pedro_DI_ArrivedAtShip_OrkOberst );


};
func void DIA_Pedro_DI_ArrivedAtShip_OrkOberst ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_15_00"); //Co bylo s t�m sk�et�m plukovn�kem?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_01"); //Zni�il mou posledn� jisk�i�ku nad�je, �e je�t� n�kdy spat��m svou domovinu.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_02"); //Od chv�le, co jsem sem p�i�el, m� vysl�chal ohledn� strategick�ho rozm�st�n� paladin� v Khorinidu.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_03"); //Samoz�ejm� �e jsem mu o tom mnoho ne�ekl. Jak bych tak� mohl, sakra? V�dy� jsem u ohniv�ch jenom novic.
	
	if ((Npc_IsDead(OrkElite_AntiPaladinOrkOberst_DI)))
	{
		Info_AddChoice	(DIA_Pedro_DI_ArrivedAtShip, "Sk�et� plukovn�k je mrtv�.", DIA_Pedro_DI_ArrivedAtShip_OberstTot );
	};
};

func void DIA_Pedro_DI_ArrivedAtShip_Monster ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Monster_15_00"); //Jak� p��ery se pohybuj� po tomto ostrov�?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_01"); //B�hem dne m��e� �asto vid�t, jak k pob�e�� m��� je�t��i. Obvykle nesou n�jak� ohromn� vejce.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_02"); //Moc jsem toho ve sv� cele nepochytil, ale mysl�m, �e se chystaj� opustit ostrov.
};

func void DIA_Pedro_DI_ArrivedAtShip_Innere ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Innere_15_00"); //Jak je mo�n� dostat se dovnit� ostrova?
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_01"); //V tr�nn�m s�lu sk�et�ho plukovn�ka je tajn� chodba.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_02"); //Vlekli m� tam poka�d�, kdy� m� cht�l vysl�chat. Vid�l jsem, �e tam je.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_03"); //Jeden ze �aman� spustil mechanismus tak, �e zat�hnul za jednu z pochodn� p�ipevn�n�ch na zdi v chodb�.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_04"); //Hmm. Mysl�m, �e nejprve zat�hl za pochode� nalevo a pak napravo, ale mo�n� si to nepamatuju �pln� p�esn�.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_05"); //V zadn� ��sti se n�hle otev�el pr�chod, kter� vedl hluboko do hory.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_06"); //Bohu�el nev�m, kde ta chodba kon��.

};

func void DIA_Pedro_DI_ArrivedAtShip_OberstTot ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_15_00"); //Sk�et� plukovn�k je mrtv�.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_09_01"); //Mrtv�? Innos budi� pochv�len. Na ten jeho p��ern� obli�ej nikdy nezapomenu.

};

func void DIA_Pedro_DI_ArrivedAtShip_Back ()
{
	AI_Output			(other, self, "DIA_Pedro_DI_ArrivedAtShip_Back_15_00"); //U� jsem sly�el dost. B� si naj�t m�sto na m� lodi. Je�t� po��d m�m dost pr�ce.
	AI_Output			(self, other, "DIA_Pedro_DI_ArrivedAtShip_Back_09_01"); //Nech� t� Innosova s�la prov�z�. Budu se za tebe modlit.
	
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

	description	 = 	"Unaven�?";
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
	AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_00"); //Unaven�?

	if (Npc_GetDistToWP(self,"SHIP_DECK_05")<1000) 
	{	
		if (PedroDI_Flee == LOG_RUNNING)
		{
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_01"); //Cht�l bys snad, abych ti p�inesl pol�t��?
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_02"); //Nech m� b�t, pros�m. Potichu si tady sednu a ani nep�pnu.
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_03"); //Hmm.
			B_GivePlayerXP (XP_Ambient);
			PedroDI_Flee = LOG_SUCCESS;
		}
		else if (Npc_IsDead(Dragon_Undead))
		{
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_04"); //Jsem �pln� odrovnan�.
			AI_Output			(other, self, "DIA_Pedro_DI_PERM_15_05"); //Sbal si sv�ch p�t �vestek. Brzy zase vyraz�me na mo�e.
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_06"); //D�ky, chlape. U� jsem si myslel, �e se sval�m z lavice rovnou na zem. Dobrou noc.
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,"SleepShip");
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			PedroDI_TalkNomore = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_07"); //To je v po��dku. D�ky.
			AI_StopProcessInfos (self);
		};
	}
	else
	{
		AI_Output			(self, other, "DIA_Pedro_DI_PERM_09_08"); //Pros�m. Nech m� ��t!
		AI_StopProcessInfos (self);
	};
};

