package encrypt;

import java.security.MessageDigest;
import java.util.Arrays;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import java.util.Base64;


public class pass {
	private static SecretKey skey;
	private static byte[] key;

	public static void Keygenerate(String sec)
	    {
		MessageDigest adv=null;
		try
		    {
			key=sec.getBytes("UTF-8");
			adv=MessageDigest.getInstance("SHA-1");
			key=adv.digest(key);
			key=Arrays.copyOf(key, 16);
			skey=new SecretKeySpec(key,"AES");
		    }
		catch(Exception e){
			e.printStackTrace();
		}
	    }
	public static String encrypt(String s,String k){
		try
		{
		Keygenerate(k);
		Cipher chi=Cipher.getInstance("AES/ECB/PKCS5Padding");
		chi.init(Cipher.ENCRYPT_MODE,skey);
		byte[] d=chi.doFinal(s.getBytes("UTF-8"));
		String enc=Base64.getEncoder().encodeToString(d);
		return enc;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}
	public static String decrypt(String s,String k)
	{
		try
		{
			Keygenerate(k);
			Cipher chi=Cipher.getInstance("AES/ECB/PKCS5Padding");
			chi.init(Cipher.DECRYPT_MODE,skey);
			byte[] d=Base64.getDecoder().decode(s);
			byte[] e=chi.doFinal(d);
			String dec=new String(e);
			return(dec);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}
}
