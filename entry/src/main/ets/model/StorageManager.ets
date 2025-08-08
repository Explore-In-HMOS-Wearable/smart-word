import { common } from '@kit.AbilityKit';
import { preferences } from '@kit.ArkData';


const TAG: string = '[StorageManagement]';
let storage: preferences.Preferences;
let storageTemp: preferences.Preferences;

export class StorageManager {

  async getFromStorage(context: common.Context, url: string) {
    let name = url;
    console.log(TAG, 'Name is ${name}');
    try {
      storage = await preferences.getPreferences(context, `${name}`);
    } catch (err) {
      Error(`getStorage failed, code is ${err?.code}, message is ${err?.message}`);
    }
    if (storage) {
      console.log(TAG, 'Create storage is ok.');
    }
  }

  async getStorage(context: common.Context, url: string) {
    storage = storageTemp;
    await this.getFromStorage(context, url);
    return storage;
  }

  async putStorageValue(context: common.Context, key: string, value: number, url: string) {
    storage = await this.getStorage(context, url);
    try {
      await storage.put(key, value);
      await storage.flush();
      console.log(TAG, `put key ${key} && value ${value} success`);
    } catch (err) {
      console.log(TAG, 'put failed');
    }
    return
  }

  async putStorageValueBoolean(context: common.Context, key: string, value: boolean, url: string) {
    storage = await this.getStorage(context, url);
    try {
      await storage.put(key, value);
      await storage.flush();
      console.log(TAG, `put key ${key} && value ${value} success`);
    } catch (err) {
      console.log(TAG, 'put failed');
    }
    return
  }

  async hasStorageValue(context: common.Context, key: string, url: string) {
    storage = await this.getStorage(context, url);
    let result: boolean = false;
    try {
      result = await storage.has(key);
    } catch (err) {
      console.log(`hasStorageValue failed, code is ${err?.code}, message is ${err?.message}`);
    }
    console.log(TAG, `hasStorageValue success result is ${result}`);
    return result;
  }

  async getStorageValue(context: common.Context, key: string, url: string) {
    storage = await this.getStorage(context, url);
    let getValue: preferences.ValueType = 'null';
    try {
      getValue = await storage.get(key, false);
    } catch (err) {
      console.log(`getStorageValue failed, code is ${err?.code}, message is ${err?.message}`);
    }
    console.log(TAG, `getStorageValue success`);
    return getValue;
  }

  async deleteStorageValue(context: common.Context, key: string, url: string) {
    storage = await this.getStorage(context, url);
    try {
      await storage.delete(key);
      await storage.flush();
    } catch (err) {
      console.log(`deleteStorageValue failed, code is ${err?.code}, message is ${err?.message}`);
    }
    console.log(TAG, `delete success`);
    return
  }

}

